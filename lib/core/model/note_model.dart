///
///     note model
///
class NoteModel {
  final String book;
  final String chapterVerse;
  final String version;
  final String noteText;
  // final DateTime dateTime;
  final String highlightedText;
  final String date;
  final String time;

  NoteModel({
    required this.book,
    required this.chapterVerse,
    required this.version,
    required this.noteText,
    // required this.dateTime,
    required this.highlightedText,
    required this.date,
    required this.time,
  });
}
