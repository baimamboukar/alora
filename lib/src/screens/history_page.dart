import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grnagain/src/extensions/contextx.dart';

@RoutePage()
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('You dont have any history yet',
            style: context.title.copyWith(color: context.colorScheme.primary)),
      ),
    );
  }
}
