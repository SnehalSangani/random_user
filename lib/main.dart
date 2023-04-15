import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/screen/home/provider/home_provider.dart';
import 'package:random_user/screen/home/view/home_Screen.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => home(),
        },
      ),
    )
  );
}