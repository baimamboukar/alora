import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

class UserBox {
  static bool get isDarkTheme =>
      Hive.box<bool>('settigs').get('theme') ?? false;
  static User? get getfirebaseUser =>
      Hive.box<User>('user').get('firebase_user');
  static set setfirebaseUser(User user) =>
      Hive.box<User>('user').put('firebase_user', user);
}
