import 'package:agenda_ja_app/services/auth_service.dart';
import 'package:agenda_ja_app/utility/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child:
        ListView(children:  [
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Deslogar'),
            onTap: ()async{
              await AuthService().logoutUser();
              Navigator.pushNamed(context, AppRoutes.Login);
            },
          )
        ]),
      ),
      body: Center(child: Text('home')),
    );
  }
}
