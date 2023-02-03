import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:spotify_run_kt/SpotifyProvider.dart';
final GlobalKey<NavigatorState> appNavigationKey = GlobalKey<NavigatorState>();
const String hiveBoxName = 'myBox';
Box hiveBox = Hive.box(hiveBoxName);
double screenWidth = MediaQuery.of(appNavigationKey.currentContext!).size.width;
SpotifyProvider spotifyProvider = Provider.of<SpotifyProvider>(appNavigationKey.currentContext!, listen: false);
showToast(String msg) {
  ScaffoldMessenger.of(appNavigationKey.currentContext!).showSnackBar(SnackBar(
    content: Text(msg),
  ));
}