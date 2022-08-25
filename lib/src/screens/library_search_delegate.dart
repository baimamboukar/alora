import 'package:grnagain/src/configs/data.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:flutter/material.dart';
import 'package:grnagain/src/extensions/router.dart';
import 'package:grnagain/src/models/crop_model.dart';
import 'package:grnagain/src/router/router.gr.dart';
import 'package:line_icons/line_icons.dart';

class CropsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      GestureDetector(
        onTap: () {
          query = '';
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.cancel),
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final List<Crop> _crops = crops.where((crop) {
      bool matches = crop.name.toLowerCase().contains(query.toLowerCase()) ||
          crop.scienticName.toLowerCase().contains(query.toLowerCase()) ||
          crop.description.toLowerCase().contains(query.toLowerCase());

      return matches;
    }).toList();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            Text(
              "Matching items",
              style: Styles.designText(
                  bold: true, size: 16, color: Palette.primary),
            ),
            const SizedBox(height: 14),
            ..._crops.map(
              (crop) => ListTile(
                  onTap: () {
                    context.autorouter.navigate(CropsDetails(model: crop));
                  },
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(crop.imageURL.caption),
                  ),
                  title: Text(
                    crop.name,
                    style: Styles.designText(
                        bold: true, color: Palette.primary, size: 14.0),
                  ),
                  subtitle: Text(
                    crop.scienticName,
                    style: Styles.designText(
                        bold: false, color: Palette.secondary, size: 12.0),
                  ),
                  trailing: const Icon(
                    LineIcons.heartAlt,
                    color: Palette.primary,
                  )),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    List<Crop> _crops = [];
    if (query.isEmpty) {
      _crops =
          crops.where((crop) => crop.isBookmarked).take(3).toSet().toList();
    } else {
      _crops = crops.where((crop) {
        bool matches = crop.name.toLowerCase().contains(query.toLowerCase()) ||
            crop.scienticName.toLowerCase().contains(query.toLowerCase()) ||
            crop.description.toLowerCase().contains(query.toLowerCase());

        return matches;
      }).toList();
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            Text(
              query.isEmpty ? "Bookmared crops" : "Matching results",
              style: Styles.designText(
                  bold: true, size: 16, color: Palette.primary),
            ),
            const SizedBox(height: 14),
            ..._crops.map(
              (crop) => ListTile(
                  onTap: () {
                    context.autorouter.navigate(CropsDetails(model: crop));
                  },
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(crop.imageURL.caption),
                  ),
                  title: Text(
                    crop.name,
                    style: Styles.designText(
                        bold: true, color: Palette.primary, size: 14.0),
                  ),
                  subtitle: Text(
                    crop.scienticName,
                    style: Styles.designText(
                        bold: false, color: Palette.secondary, size: 12.0),
                  ),
                  trailing: const Icon(
                    LineIcons.heartAlt,
                    color: Palette.primary,
                  )),
            )
          ],
        ),
      ),
    );
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
