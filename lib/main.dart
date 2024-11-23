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

  List<AyBayModel> ayBayList = [
    AyBayModel(ay: "ay", bay: "bay"),
    AyBayModel(ay: "ay", bay: "bay"),
    AyBayModel(ay: "ay", bay: "bay"),
    AyBayModel(ay: "ay", bay: "bay"),
    AyBayModel(ay: "ay", bay: "bay"),
    AyBayModel(ay: "ay", bay: "bay"),
  ];

  DateTime time = DateTime.now();

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
                      keyboardType: TextInputType.number,
                      controller: ayTEController,
                      decoration: InputDecoration(
                        labelText: "Ay",
                        isDense: true,
                      ),
                    )),
                    SizedBox(width: 8,),
                    Expanded(child: TextFormField(
                      keyboardType: TextInputType.number,
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
                      onPressed: (){
                      ayBayList.add(AyBayModel(ay: ayTEController.text.trim(), bay: bayTEController.text.trim()));
                     ayTEController.clear();
                     bayTEController.clear();
                      setState(() {

                      });
                      }, child: Text("Add"))),
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
              SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.deepPurple.shade200,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: ayBayList.length,
                    itemBuilder: (context,index){
                    return SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                        child: Row(
                          children: [
                            SizedBox(width: 10,),
                            SizedBox(
                              width: 70,
                                child: Text(ayBayList[index].ay,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis)),
                            SizedBox(width: 10,),
                            SizedBox(
                              height: 30,
                                width: 100,
                                child: Card(child: Center(child: Text(time.toString())))),
                            SizedBox(width: 10,),
                            SizedBox(
                                width: 70,
                                child: Text(ayBayList[index].bay,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis)),
                            SizedBox(width: 10,),
                            Spacer(),
                            InkWell(
                              onTap: (){
                                ayBayList.remove(ayBayList[index]);
                                setState(() {

                                });
                              },
                                child: Icon(Icons.delete)),
                            SizedBox(width: 10,),
                          ],
                        ),
                      ),
                    );
                    },
                    separatorBuilder: (context,index){
                    return SizedBox(height: 10,);
                    },
                   ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AyBayModel{
   final String ay,bay;

  AyBayModel({required this.ay, required this.bay});


}


