import 'package:alora/src/configs/index.dart';
import 'package:alora/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CropsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return const [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.cancel),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("Soiuuuu");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListTile(
        leading: const CircleAvatar(
            backgroundImage: AssetImage(
          "assets/images/broccoli.png",
        )),
        title: Text(
          "Brocolli",
          style:
              Styles.designText(bold: true, color: Palette.primary, size: 14.0),
        ),
        subtitle: Text(
          "Mosaic Virus, Blackleg",
          style: Styles.designText(
              bold: false, color: Palette.secondary, size: 12.0),
        ),
        trailing: const Icon(LineIcons.heart));
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: Palette.light,
        inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
            hintStyle: Styles.designText(
                bold: false, color: Palette.light.withOpacity(.45), size: 14)),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: const TextStyle(color: Colors.white),
            ),
        appBarTheme: const AppBarTheme(elevation: 0.0, color: Palette.primary));
  }
}
