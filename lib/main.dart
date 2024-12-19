import 'package:ay_bay_app/categorywidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const AyBayHishab());
}
  /*List <int> number = [10,20,30,50,60];
  for(int value in number){
    print(value);
  }*/

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

  List<AyBayModel> ayBayList = [];

  DateTime time = DateTime.now();

  int calculateAySum (List<AyBayModel>ayBayList){
    int aySum = 0;
    for (AyBayModel A in ayBayList){
      aySum+= int.parse(A.ay);
      setState(() {});
    }
    return aySum;
  }
  int calculateBaySum (List<AyBayModel>ayBayList){
    int baySum = 0;
    for (AyBayModel A in ayBayList){
      baySum+= int.parse(A.bay);
      setState(() {});
    }
    return baySum;
  }

  @override
  Widget build(BuildContext context) {

    int result = calculateAySum(ayBayList);

    int result1 = calculateBaySum(ayBayList);


    return Scaffold(
      appBar: AppBar(
        title: const Text("Ay Bay Hishab"),
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
                      decoration: const InputDecoration(
                        labelText: "Ay",
                        isDense: true,
                      ),
                    )),
                    const SizedBox(width: 8,),
                    Expanded(child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: bayTEController,
                      decoration: const InputDecoration(
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
                      ayBayList.add(AyBayModel(ay: ayTEController.text.trim(), bay: bayTEController.text.trim(), date: DateFormat("yMd").format(time)));
                     ayTEController.clear();
                     bayTEController.clear();
                      setState(() {

                      });
                      }, child: const Text("Add"))),
              const SizedBox(height: 5,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryWidget(title: 'Ay', color: Colors.green,),
                  CategoryWidget(title: 'Date', color: Colors.blue,),
                  CategoryWidget(title: 'Bay', color: Colors.deepOrangeAccent,),
                  CategoryWidget(title: 'More', color: Colors.brown,),
                ],
              ),
              const SizedBox(
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
                            const SizedBox(width: 10,),
                            SizedBox(
                              width: 30,
                                child: Text(ayBayList[index].ay,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis)),
                            const SizedBox(width: 50,),
                            SizedBox(
                              height: 30,
                                width: 70,
                                child: Card(
                                  margin: EdgeInsets.zero,
                                    child: Center(child: Text(ayBayList[index].date)))),
                            const SizedBox(width: 50,),
                            SizedBox(
                                width: 70,
                                child: Text(ayBayList[index].bay,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis)),
                            const SizedBox(width: 10,),
                            const Spacer(),
                            InkWell(
                              onTap: (){
                                ayBayList.remove(ayBayList[index]);
                                setState(() {
                                });
                              },
                                child: const Icon(Icons.delete)),
                            const SizedBox(width: 10,),
                          ],
                        ),
                      ),
                    );
                    },
                    separatorBuilder: (context,index){
                    return const SizedBox(height: 10,);
                    },
                   ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(onPressed: (){},label: Text("Total Ay: $result"),),
          SizedBox(width: 10,),
          FloatingActionButton.extended(onPressed: (){},label: Text("Total Bay: $result1"),),
          SizedBox(width: 10,),
          FloatingActionButton.extended(onPressed: (){},label: Text("You have:  ${result - result1}"),),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class AyBayModel{
   final String ay,bay,date;
  AyBayModel({required this.date, required this.ay, required this.bay});


}


