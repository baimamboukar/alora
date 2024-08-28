import 'package:flutter/material.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:intl/intl.dart';

class FrostedGlass extends StatelessWidget {
  final double borderRadius;

  final String tempMin;
  final String tempMax;
  final String icon;
  final String description;
  final bool isPreview;
  final DateTime? date;

  const FrostedGlass({
    super.key,
    this.borderRadius = 30.0,
    required this.tempMin,
    required this.tempMax,
    required this.icon,
    required this.description,
    this.isPreview = false,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: isPreview ? 180 : 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isPreview ? 12 : borderRadius),
          color: isPreview
              ? context.colorScheme.inversePrimary.withOpacity(0.35)
              : Theme.of(context).colorScheme.primary.withOpacity(0.25),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/weather/$icon.png",
                width: 100,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isPreview)
                      Builder(builder: (context) {
                        final format = DateFormat('E, d MMM yyyy');
                        final formattedDate =
                            format.format(date ?? DateTime.now());
                        return Text(
                          formattedDate,
                          style: context.paragraph
                              .copyWith(color: context.colorScheme.primary),
                        ).floatL.hPaddingx(24);
                      }),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ).format,
                    const Divider(
                      color: Colors.black,
                      thickness: 4,
                    ),
                    Text(
                      "Min: $tempMin°C\nMax: $tempMax°C",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
