import 'package:agenda_ja_app/app/core/application_config.dart';
import 'package:agenda_ja_app/app/modules/app_module.dart';
import 'package:agenda_ja_app/app/modules/app_widget.dart';
import 'package:agenda_ja_app/config/ProviderConfig.dart';
import 'package:agenda_ja_app/config/routes_config.dart';
import 'package:agenda_ja_app/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import 'app/modules/auth/login/login_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await ApplicationConfig().configureApp();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderConfig.init,
      child: MaterialApp(
        // home: const RouteScreen(),
        navigatorKey: MyApp.navigatorKey,
        routes: RoutesConfig.init,
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: Text('Login Page'),
        //   ),
        //   body: LoginPage(),
        // ),
      ),
    );
  }
}

class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (ctx, data) {
        if (data.hasData) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
