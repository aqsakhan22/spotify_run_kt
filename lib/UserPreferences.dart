import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';



late SharedPreferences prefs;
initializePreferences() async{
  prefs = await SharedPreferences.getInstance();
}
class UserPreferences {

  static String get spotifyToken => prefs.getString("SpotifyToken",) ?? '';
  static set spotifyToken(String spotifyToken){
    prefs.setString("SpotifyToken",spotifyToken);
  }
}