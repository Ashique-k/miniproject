import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miniproject/screens/login_page.dart';
class Regtr extends StatefulWidget {
  const Regtr({super.key});

  @override
  State<Regtr> createState() => _RegtrState();
}

class _RegtrState extends State<Regtr> {
  final formkey = GlobalKey<FormState>();
  TextEditingController datectrl = TextEditingController();
  TextEditingController timectrl = TextEditingController();
  int selectedvalue=1;
  bool ? _value = false;
  bool ? _values = false;
  String ? gender;
  final SnackBar _snackBar=SnackBar(
      content: Text("Registered"), duration: Duration(seconds: 4),);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
         // width: MediaQuery.of(context).size.width,
          width: double.infinity,

          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                ),
                Center(child: Text("REGISTRATION FORM",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black54),)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 5,
                  width: 200,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator:     (value) {
                      if (value == null || value.isEmpty) {   // Validation Logic
                        return 'Please enter DOB';
                      }
                      return null;
                    },
                    controller: datectrl,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText:"Enter your DOB",
                          suffixIcon: IconButton(onPressed: ()async{
                          final DateTime? _date = await showDatePicker(context: context,
                                initialDate: DateTime.now(),
                               firstDate: DateTime(2000),
                               lastDate: DateTime(2025));
                          final formatteddate = DateFormat("dd/MM/yyyy").format(_date!);
                          setState(() {
                           datectrl.text = formatteddate.toString();
                          });



                          }, icon: Icon(Icons.calendar_month)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),


                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                     validator:    (value) {
                      if (value == null || value.isEmpty) {   // Validation Logic
                        return 'Required';
                      }
                      return null;
                    },
                    controller: timectrl,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText:"Time",
                      suffixIcon: IconButton(onPressed: ()async{

                      final TimeOfDay? _day= await showTimePicker(
                          context: context,
                           initialTime: TimeOfDay.now());
                      setState(() {
                      timectrl.text = _day!.format(context);
                      });


                      }, icon: Icon(Icons.timer)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),


                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 300,
                  child: DropdownButton(
                      value: selectedvalue,
                      items:[
                        DropdownMenuItem(child: Text("-state-"),
                          value: 1,),
                        DropdownMenuItem(child: Text("Kerala"),
                          value: 2,),
                        DropdownMenuItem(child: Text("Goa"),
                          value: 3,),
                        DropdownMenuItem(child: Text("Lakshdeep"),
                          value: 4,),
                      ], onChanged: (int? value){
                    setState(() {
                      selectedvalue=value!;
                    });
                  }),

                ),
                SizedBox(
                  height: 25,
                ),

                Text("Marital Status",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
                SizedBox(
                  height: 35,
                ),


                CheckboxListTile(
                  checkColor: Colors.blue,
                  activeColor: Colors.white,
                  title: Text("married"),
                    value: _value,
                    onChanged: ( bool ? value){
                      setState(() {
                        _value= value;
                      });
                    }
                ),
                CheckboxListTile(
                    checkColor: Colors.blue,
                    activeColor: Colors.white,
                    title: Text("Single"),
                    value: _values,
                    onChanged: ( bool ? values){
                      setState(() {
                        _values= values;
                      });
                    }
                ),
                 Text("Gender ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),


                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                       // Text("Gender :",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),


                        SizedBox(
                          height: 30,
                          width: 180,
                          child: ListTile(
                              title: Text("male"),
                              leading: Radio(value: "male", groupValue: gender, onChanged:(String ? Value){
                                setState(() {
                                  gender=Value;
                                });
                              }
                              )
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 180,
                          child: ListTile(
                                   title:Text ("Female"),
                                   leading: Radio(value: "Female",
                                       groupValue: gender,
                                       onChanged: (String ? value){
                                         setState(() {
                                           gender = value;
                                         });
                                       }),
                                 ),
                        )

                      ],
                    ),
                  ),
                ),


               //  Container(
               //    height: 100,
               //    width: 300,
               //    child: Row(
               //
               // //   mainAxisAlignment: MainAxisAlignment.start,
               //      children: [
               //        Padding(
               //          padding: const EdgeInsets.all(8.0),
               //          child: Text("Gender :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black),),
               //        ),
               //        SizedBox(
               //          width: 5,
               //        ),
               //        ListTile(
               //          title:Text ("Male"),
               //        leading: Radio(value: "Male",
               //             groupValue: gender,
               //             onChanged: (String ? value){
               //            setState(() {
               //              gender = value;
               //            });
               //             }),
               //        ),
               //        //
               //
               //        // ListTile(
               //        //   title:Text ("Female"),
               //        //   leading: Radio(value: "Female",
               //        //       groupValue: gender,
               //        //       onChanged: (String ? value){
               //        //         setState(() {
               //        //           gender = value;
               //        //         });
               //        //       }),
               //        // )
               //
               //
               //
               //      ],
               //    ),
               //  ),
               //  Row(
               //    children: [
               //      Container(
               //        color: Colors.red,
               //        height: 20,
               //      //  height: 50,
               //     //   width: double.infinity,
               //      ),
               //      Container(
               //        color: Colors.green,
               //        height: 60,
               //      )
               //    ],
               //  ),




                SizedBox(
                  height: 35,
                ),
                SizedBox(
                  height: 45,
                  width: 300,
                  child: ElevatedButton(onPressed: (){
                    if(formkey.currentState!.validate()){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => login()));
                      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                    }






                  }, child: Text("Register",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent
                  ),

                  ),
                ),

                SizedBox(
                  height: 45,
                )

              ],

            ),
          ),
        ),
      ),
    );
  }
}
