import 'package:flutter/material.dart';

import 'menu_item.dart';

class DetailScreen extends StatelessWidget {
  final MenuItem item;
  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                item.image,
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) => Container(
                  height: 240,
                  color: Colors.orange.shade100,
                  alignment: Alignment.center,
                  child: Text(item.emoji, style: const TextStyle(fontSize: 80)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              item.name,
              key: const Key('detail-name'),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              item.description,
              key: const Key('detail-description'),
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
