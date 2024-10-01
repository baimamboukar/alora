extension StringX on String {
  String get clean => replaceAll("#", "").replaceAll("*", "").toLowerCase();
}
