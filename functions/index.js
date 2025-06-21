const functions = require("firebase-functions");
const nodemailer = require("nodemailer");

// ✅ Use environment config (secure)
const gmailEmail = functions.config().gmail.email;
const gmailAppPassword = functions.config().gmail.password;

// ✅ Gmail transporter using nodemailer
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: gmailEmail,
    pass: gmailAppPassword,
  },
});

// ✅ sendFormulaEmail callable function
exports.sendFormulaEmail = functions.https.onCall(async (data, context) => {
  const {clientEmail, subject, formulaName, remedies, dosage, notes} = data;

  const htmlContent = `
    <h2>${formulaName}</h2>
    <p><strong>Dosage:</strong> ${dosage}</p>
    <p><strong>Notes:</strong> ${notes}</p>
    <p><strong>Remedies:</strong></p>
    <ul>
      ${remedies.map((r) => `<li>${r.name}</li>`).join("")}
    </ul>
  `;

  const mailOptions = {
    from: `Lightweaver <${gmailEmail}>`,
    to: clientEmail,
    subject: subject,
    html: htmlContent,
  };

  try {
    await transporter.sendMail(mailOptions);
    return {success: true};
  } catch (error) {
    console.error("❌ Email sending error:", error);
    return {success: false, error: error.message};
  }
});
