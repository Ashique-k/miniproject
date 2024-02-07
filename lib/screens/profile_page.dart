import 'package:flutter/material.dart';
import 'package:miniproject/screens/Home_page.dart';
import 'package:miniproject/screens/detail_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});


  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final formkey = GlobalKey<FormState>();
  final SnackBar _snackBar=SnackBar(
    content: Text("Updated"), duration: Duration(seconds: 4),);
  final namectrl = TextEditingController();
  final emailctrl = TextEditingController();
  final phnctrl = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(


                height: 200,
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.only(left: 2,top: 30),
                  child: Image.asset("assets/images/person.png"),
                ),

              ),
              SizedBox(
                height: 10,
              ),
              Text("PROFILE",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                width: 400,
                color: Colors.blue,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: namectrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Your Name",
                      labelText: "EnterName",
                      suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailctrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'Please enter your Mail ID';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Mail ID",
                      labelText: "Email",
                      suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.email_outlined)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phnctrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'Please Enter Ph No';
                    }
                    return null;
                  },
                  keyboardType:TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enter phone no:",
                      labelText: "Phone number",
                      suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.phone_android)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 45,
                width: 300,
                child: ElevatedButton(onPressed: ()async{
                  final  prefs = await SharedPreferences.getInstance();
                  await  prefs.setString("name", namectrl.text);
                  await prefs.setString("email", emailctrl.text);
                  await prefs.setString("phone no", phnctrl.text);


                  showDialog(context: context,
                      builder: (BuildContext context)=>
                          AlertDialog(
                            title: Text("Conformation"),
                            content: Text("Are you confirm"),
                            actions: [
                              TextButton(onPressed: () {
                                Navigator.pop(context,"cancel");
                              }, child: Text("Cancel")),
                              TextButton(onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));
                              }, child: Text("Ok")),

                            ],
                          )
                          );
                  if(formkey.currentState!.validate()){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Details()));
                    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                  }
                  else{
                    showDialog(context: context,
                        builder: (BuildContext context)=>
                            AlertDialog(
                              title: Text("Conformation"),
                              content: Text("Are you confirm"),
                              actions: [
                                TextButton(onPressed: () {
                                  Navigator.pop(context,"cancel");
                                }, child: Text("Cancel")),
                                TextButton(onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Details()));
                                }, child: Text("Ok")),

                              ],
                            )
                    );
                  }






                }, child: Text("Save",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),

                ),
              ),


            ],
          ),
        ),
      ),


    );
  }
}
