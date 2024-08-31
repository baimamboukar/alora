// ignore_for_file: avoid_unnecessary_containers

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/configs/data.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/services/auth/firebase_auth.dart';
import 'package:grnagain/src/widgets/image_picker.dart';
import 'package:grnagain/src/widgets/index.dart';
import 'package:grnagain/src/widgets/scanner_launcher.dart';
import 'package:grnagain/src/widgets/weather_forecast.dart';

import 'library_search_delegate.dart';

@RoutePage()
class CropsPage extends ConsumerStatefulWidget {
  const CropsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CropsViewState();
}

class _CropsViewState extends ConsumerState<CropsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: _BuildPage(),
        // child: YoutubePlayerBuilder(
        //   player: YoutubePlayer(controller: _controller),
        //   builder: (context, player) => _BuildPage(controller: _controller),
        // ),
      ),
      floatingActionButton: ScannerLauncher(),
    );
  }
}

class _BuildPage extends StatelessWidget {
  const _BuildPage({
    super.key,
    //required YoutubePlayerController controller,
  });

  //final YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.vGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: FirebaseAuth
                      .instance.currentUser?.providerData.first.photoURL !=
                  null,
              replacement: const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 14,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 32,
                backgroundImage: NetworkImage(FirebaseAuth
                        .instance.currentUser?.providerData.first.photoURL ??
                    ''),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                color: context.colorScheme.primary,
              ),
              onPressed: () => context.autorouter.pushNamed('/notifications'),
            ),
          ],
        ),
        14.vGap,
        Row(
          children: [
            Text(t.yourLibary,
                style: Styles.designText(
                    bold: true, color: context.colorScheme.primary, size: 26)),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Container(
                height: 58.0,
                width: (context.screenWidth - 76) * .8,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Palette.light,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: TextFormField(
                    onTap: () =>
                        showSearch(context: context, delegate: CropsSearch()),
                    decoration: InputDecoration(
                      hintText: t.searchLinary,
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Palette.secondary,
                      ),
                    ),
                  ),
                )),
            const SizedBox(width: 22),
            GestureDetector(
              onTap: () {
                FirebaseAuthentication.isPreniumUser
                    ? showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return const ImagePickModal();
                        },
                      )
                    : context.autorouter.pushNamed('/purchase');
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Icon(
                    Icons.document_scanner,
                    size: 28,
                    color: Palette.light,
                  ),
                ),
              ),
            )
          ],
        ),
        //14.vGap,
        const WeatherForecast(),
        const SizedBox(width: 30),
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            crossAxisCount: 2,
            children: <Widget>[
              ...crops.map(
                (crop) => CropCaption(crop),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
