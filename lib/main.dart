import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:spotify_run_kt/SpotifyProvider.dart';
import 'package:spotify_run_kt/UserPreferences.dart';
import 'package:spotify_run_kt/spotify_Ex.dart';

import 'package:uni_links/uni_links.dart';
//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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializePreferences();

  // hiveBox = await Hive.openBox(hiveBoxName);

  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? sub;
  Uri? _initialUri;
  Uri? _latestUri;
  Object? _err;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleIncomingLinks();
    });

    super.initState();
  }
  void _handleIncomingLinks() {
    print("_handleIncomingLinks");
    // spotifyProvider.initSpotify();

  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_) => SpotifyProvider()),


      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home:Home() ,
      ),

    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("hello world"),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Spotify() ));
            }, child: Text("check spotify"))
          ],
        )
      ),
    );
  }
}











