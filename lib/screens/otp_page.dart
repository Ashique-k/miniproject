import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:miniproject/screens/Home_page.dart';
import 'package:miniproject/screens/bottmnav.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String _verficationcode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
                height: 300,
                width: double.infinity,
                child: Lottie.asset("assets/anm/anime1.json")),

            SizedBox(
              height: 10,
            ),
            Text("otp has been send to this number 7994691027",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10  ,
            ),
            OtpTextField(
          numberOfFields: 6,
              borderColor:Color.fromRGBO(217,217,217,1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)) ,
              borderWidth: 2,
              showFieldAsBox: true,
              onCodeChanged: (String code) {
              },
              onSubmit: (String verficationcode){
             setState(() {
               _verficationcode =verficationcode;
             });
              },
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 30,
                width: 130,

                child: ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Bot()),
                  );


                }, child: Text("Continue",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent
                ),
                ),),
          ],
        ),
      ),

    );
  }
}
