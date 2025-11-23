import 'package:flutter/material.dart';

class AdhkarCard extends StatefulWidget {
  final String arabicText;
  final String englishText;
  final int count;
  final VoidCallback onIncrement;

  const AdhkarCard({
    super.key,
    required this.arabicText,
    required this.englishText,
    required this.count,
    required this.onIncrement,
  });

  @override
  State<AdhkarCard> createState() => _AdhkarCardState();
}

class _AdhkarCardState extends State<AdhkarCard> {
  bool _isTapped = false;

  void _handleTap() {
    widget.onIncrement();
    setState(() => _isTapped = true);
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() => _isTapped = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.arabicText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontFamily: 'Amiri'),
            ),
            const SizedBox(height: 10),
            Text(
              widget.englishText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            Text(
              '${widget.count}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _handleTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.symmetric(
                  horizontal: _isTapped ? 28 : 24,
                  vertical: _isTapped ? 14 : 12,
                ),
                decoration: BoxDecoration(
                  color: _isTapped
                      ? theme.colorScheme.secondary
                      : theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Increment',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
