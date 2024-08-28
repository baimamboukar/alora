import 'package:flutter/material.dart';
import 'package:grnagain/src/extensions/widgetx.dart';

class DailySummary extends StatelessWidget {
  final String summary;

  const DailySummary({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 5,
        left: 15,
        right: 15,
        bottom: 15,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .secondary
            .withOpacity(0.2)
            .withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          "This day is more likely to be **$summary** day!",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
        ).format,
      ),
    );
  }
}
