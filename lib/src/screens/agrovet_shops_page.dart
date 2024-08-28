import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/extensions/num.dart';
import 'package:grnagain/src/extensions/widgetx.dart';
import 'package:grnagain/src/models/shops.dart';

@RoutePage()
class AgrovetShopsPage extends StatefulWidget {
  const AgrovetShopsPage({super.key});

  @override
  State<AgrovetShopsPage> createState() => _AgrovetShopsPageState();
}

class _AgrovetShopsPageState extends State<AgrovetShopsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        54.vGap,
        Text(
          "Agrovet Shops",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold, color: context.colorScheme.primary),
        ).hPaddingx(26).floatL,
        Expanded(
          child: ListView.builder(
            itemCount: shops.length,
            itemBuilder: (context, index) {
              final shop = shops[index];
              return GestureDetector(
                onTap: () {
                  // context.router.push(AgrovetShopDetails(shop: shop));
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  height: 134,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.colorScheme.inversePrimary.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      // Shop Image
                      Container(
                        width: 134,
                        height: 134,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          image: DecorationImage(
                            image: AssetImage(shop.imageUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ).hPaddingx(16),
                      const SizedBox(width: 16),
                      // Shop Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              shop.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              shop.location,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              shop.desc,
                              style: Theme.of(context).textTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).hPaddingx(16),
        ),
      ],
    );
  }
}
