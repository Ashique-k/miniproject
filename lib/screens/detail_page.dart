import 'package:flutter/material.dart';
import 'package:miniproject/screens/Home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var name = "";
  var email = "";
  var phno = "";
  @override
  void initState() {
    // TODO: implement initState
    edited();
    super.initState();
  }
  edited() async{
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name')!;
    email = prefs.getString('email')!;
    phno = prefs.getString('phone no')!;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 500,
        width: double.infinity,
        child: Container(
          height: 500,
          width: 600,

          child: SizedBox(
            height: 150,
            child: Card(
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text("data"),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(name),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(email),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(phno),
                  ),
                  SizedBox(
                    height: 40,
                    width: 80,

                    child: ElevatedButton(onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));

                    }, child: Text("ok")),
                  )
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
