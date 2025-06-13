// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildClientShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: 5, // Loading ke dauraan fixed number of placeholders
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 18, width: 120, color: Colors.white),
                const SizedBox(height: 8),
                Container(
                  height: 14,
                  width: double.infinity,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                Container(height: 14, width: 150, color: Colors.white),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      height: 36,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      height: 36,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
