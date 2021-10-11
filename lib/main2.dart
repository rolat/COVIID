import 'package:COVID19/models/User.dart';
import 'package:COVID19/providers/information.dart';
import 'package:COVID19/providers/users.dart';
import 'package:COVID19/screens/BannerScreen.dart';
import 'package:COVID19/screens/HomeScreen.dart';
import 'package:COVID19/screens/edit_profile.dart';
import 'package:COVID19/screens/story_screen.dart';
import 'package:flutter/material.dart';
import 'package:COVID19/core/color_constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Information(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          accentColor: kAccentColor
        ),
        home: BannerScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          DonatePlasma.routeName: (ctx) => DonatePlasma(),
          BannerScreen.routeName: (ctx) => BannerScreen(),
          EditProfile.routeName: (ctx) => EditProfile(),
          StoryScreen.routeName: (ctx) => StoryScreen()
        },
      ),
    );
  }
}