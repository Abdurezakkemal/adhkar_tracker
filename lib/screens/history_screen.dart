import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final StorageService _storageService = StorageService();
  late Future<Map<String, int>> _allCountsFuture;

  @override
  void initState() {
    super.initState();
    _allCountsFuture = _storageService.getAllCounts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: FutureBuilder<Map<String, int>>(
        future: _allCountsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final counts = snapshot.data!;
            final sortedDates = counts.keys.toList()
              ..sort((a, b) => b.compareTo(a));

            return ListView.builder(
              itemCount: sortedDates.length,
              itemBuilder: (context, index) {
                final date = sortedDates[index];
                final count = counts[date];
                return ListTile(
                  title: Text(date),
                  trailing: Text(
                    '$count',
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No history found.'));
          }
        },
      ),
    );
  }
}
