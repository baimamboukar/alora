import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(3.8480, 11.5021), // Centered on Yaounde
                zoom: 15,
              ),
              markers: shops.map((shop) {
                return Marker(
                  markerId: MarkerId(shop.name),
                  position: shop.coordinates,
                  infoWindow: InfoWindow(
                    title: shop.name,
                    snippet: shop.location,
                    onTap: () {
                      _showShopInfo(context, shop);
                    },
                  ),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor
                      .hueAzure), // Optional: Custom marker color
                );
              }).toSet(),
            ),
          ),
          // Bottom Container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Container(
              color: Colors.white,
              child: const Center(
                child: Text('Agrovet Shops Information'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showShopInfo(BuildContext context, Shop shop) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(shop.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Address: ${shop.location}'),
              // Optionally, add more details like an image, contact info, etc.
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

// class AgrovetShopsPage extends StatefulWidget {
//   const AgrovetShopsPage({super.key});

//   @override
//   State<AgrovetShopsPage> createState() => _AgrovetShopsPageState();
// }

// class _AgrovetShopsPageState extends State<AgrovetShopsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         54.vGap,
//         Text(
//           "Agrovet Shops",
//           style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//               fontWeight: FontWeight.bold, color: context.colorScheme.primary),
//         ).hPaddingx(26).floatL,
//         Expanded(
//           child: ListView.builder(
//             itemCount: shops.length,
//             itemBuilder: (context, index) {
//               final shop = shops[index];
//               return GestureDetector(
//                 onTap: () {
//                   // context.router.push(AgrovetShopDetails(shop: shop));
//                 },
//                 child: Container(
//                   margin:
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                   height: 134,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: context.colorScheme.inversePrimary.withOpacity(0.35),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     children: [
//                       // Shop Image
//                       Container(
//                         width: 134,
//                         height: 134,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(14),
//                           image: DecorationImage(
//                             image: AssetImage(shop.imageUrl),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ).hPaddingx(16),
//                       const SizedBox(width: 16),
//                       // Shop Info
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               shop.name,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headlineSmall
//                                   ?.copyWith(fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               shop.location,
//                               style: Theme.of(context).textTheme.bodyMedium,
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               shop.desc,
//                               style: Theme.of(context).textTheme.bodySmall,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ).hPaddingx(16),
//         ),
//       ],
//     );
//   }
// }
