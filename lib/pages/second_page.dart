import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("It's a second page title"),
      ),
    );
  }

  goToFirstPage(context) {
    Navigator.pushNamed(context, '/firstpage');
  }
}
