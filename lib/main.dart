import 'package:flutter/material.dart';

void main() {
  runApp(const AyBayHishab());
}
class AyBayHishab extends StatelessWidget {
  const AyBayHishab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple,width: 2),
            borderRadius: BorderRadius.circular(20),
        ),
     enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.deepPurple,width: 1),
          borderRadius: BorderRadius.circular(20),
      ),
    )
    ),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ay_Bay_Hishab"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade200,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField()),
                SizedBox(width: 8,),
                Expanded(child: TextField()),
              ],
            )
          ],
        ),
      ),
    );
  }
}

