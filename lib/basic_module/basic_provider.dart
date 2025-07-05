import 'package:flutter/material.dart';
import 'font_logic.dart';
import 'package:provider/provider.dart';

import 'basic_app.dart';
import 'theme_logic.dart';

Widget basicProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider( create: (context) => ThemeLogic()),
      ChangeNotifierProvider(create: (context) => FontLogic())
    ],
    child: BasicApp(),
  );
}
