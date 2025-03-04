import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'features/auth/register/page/register_notifier.dart';
import 'features/welcome/page/welcome_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterNotifier>(
      create: (context) => RegisterNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('id'), // Indonesia
        ],
      ),
    );
  }
}
