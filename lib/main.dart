import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/splash_screen.dart';
import 'viewmodel/home_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    ),
  );
}
