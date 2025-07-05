import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pic1 =
        "https://img.cdn-pictorem.com/uploads/collection/E/EF5MND10RMF/900_Coolbits-Art_zore25.jpg";
    final pic2 =
        "https://imagedelivery.net/0vZ7NNrG1AM4WK7mdewxHw/8b8940e3-9a2f-4fbd-3b85-d7fe04ec5c00/public";

    final pic3 =
        "https://img.cdn-pictorem.com/uploads/collection/E/EF5MND10RMF/900_Coolbits-Art_zore22.jpg";
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: const Color.fromARGB(255, 30, 233, 74),
        foregroundColor: Colors.white,
      ),
      body: Center(child: Image.network(pic1)),
      drawer: Drawer(
        child: Column(
          children: [
            Image.network(pic2, fit: BoxFit.cover),
            const ListTile(leading: Icon(Icons.home), title: Text("Home")),
          ],
        ),
      ),
      //drawer: Drawer(child: Image.network(pic2, fit: BoxFit.cover)),
      endDrawer: Drawer(child: Image.network(pic3, fit: BoxFit.cover)),
    );
  }
}
