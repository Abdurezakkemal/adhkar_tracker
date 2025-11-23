import 'package:flutter/material.dart';
import '../models/hadith.dart';
import '../services/hadith_service.dart';
import '../services/storage_service.dart';
import '../widgets/adhkar_card.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  late Future<Hadith> _hadithFuture;
  final HadithService _hadithService = HadithService();
  final StorageService _storageService = StorageService();
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _hadithFuture = _hadithService.fetchHadith();
    _loadCount();
  }

  Future<void> _loadCount() async {
    final count = await _storageService.loadCount();
    setState(() {
      _count = count;
    });
  }

  void _incrementCount() {
    setState(() {
      _count++;
      _storageService.saveCount(_count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Today\'s Hadith')),
      body: Center(
        child: FutureBuilder<Hadith>(
          future: _hadithFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return AdhkarCard(
                arabicText: snapshot.data!.arabicText,
                englishText: snapshot.data!.englishText,
                count: _count,
                onIncrement: _incrementCount,
              );
            } else {
              return const Text('No hadith found.');
            }
          },
        ),
      ),
    );
  }
}
