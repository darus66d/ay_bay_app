import 'package:ay_bay_app/categorywidget.dart';
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
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ayTEController = TextEditingController();
  final bayTEController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ay Bay Hishab"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Row(
                  children: [
                    Expanded(child: TextFormField(
                      controller: ayTEController,
                      decoration: InputDecoration(
                        labelText: "Ay",
                        isDense: true,
                      ),
                    )),
                    SizedBox(width: 8,),
                    Expanded(child: TextFormField(
                      controller: bayTEController,
                      decoration: InputDecoration(
                        labelText: "Bay",
                        isDense: true,
                      ),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: 50,
                width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                    ),
                      onPressed: (){}, child: Text("Add"))),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryWidget(title: 'Ay', color: Colors.green,),
                  CategoryWidget(title: 'Date', color: Colors.blue,),
                  CategoryWidget(title: 'Bay', color: Colors.deepOrangeAccent,),
                  CategoryWidget(title: 'More', color: Colors.brown,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



