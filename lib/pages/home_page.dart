import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home Page")),
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 126, 103, 189),
          child: Column(
            children: [
              DrawerHeader(child: Icon(Icons.favorite, size: 48)),
              ListTile(
                leading: Icon(Icons.pageview_rounded),
                title: Text("P A G E  O N E"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/firstpage');
                },
              ),
              ListTile(
                leading: Icon(Icons.all_inbox),
                title: Text("P A G E  S E C O N D"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/secondpage');
                },
              ),
            ],
          ),
        ),
      );
  }
}