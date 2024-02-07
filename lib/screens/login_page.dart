import 'package:flutter/material.dart';
import 'package:miniproject/screens/otp_page.dart';
import 'package:miniproject/screens/register_page.dart';
import 'package:url_launcher/url_launcher.dart';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formkey=GlobalKey<FormState>();
  final Uri _url = Uri.parse('https://www.google.com/');

  //HTTPS screen
  Future<void> _googleUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
  final Uri _face = Uri.parse('https://en-gb.facebook.com/');

  //HTTPS screen
  Future<void> _facebookUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
  final Uri _twit = Uri.parse('https://en-gb.facebook.com/');

  //HTTPS screen
  Future<void> _twiterurl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30.0,top: 10),
                child: Container(
                    height: 400,
                    // width: double.infinity,
                   decoration:BoxDecoration(
                     image: DecorationImage(image: AssetImage("assets/images/log.jpg"),
                     fit: BoxFit.fill
                     ),

                   ) ,

                   // child: Image.asset("assets/images/log.jpg")),
                   ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'Please enter your mail';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your Email",
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
                  obscureText: true,
                  validator:  (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      labelText: "Password",
                      suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.lock)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                height: 45,
                child: ElevatedButton(onPressed: (){
                  if(_formkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Otp()),
                    );

                  }



    }, child: Text("Login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Color.fromRGBO(255,255,255,3)),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),

                ),
              ),
              SizedBox(
                height: 20,

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(
                      width: 40,

                      child: InkWell(
                          onTap: (){
                            _googleUrl();

                          },

                          child: Image.asset("assets/images/google.png")

                      ),

                  ),
                  SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                      width: 40,
                      child: InkWell(
                          onTap: (){
                            _facebookUrl();
                          },

                          child: Image.asset("assets/images/facebook.png")),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                      width: 40,
                      child: InkWell(
                          onTap: (){
                            _twiterurl();


                          },

                          child: Image.asset("assets/images/twiter.png")),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                child: TextButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Regtr()),
                  );



                }, child: Text("New Register ?")),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
