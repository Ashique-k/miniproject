import 'package:flutter/material.dart';

class Pants extends StatefulWidget {
  const Pants({super.key});

  @override
  State<Pants> createState() => _PantsState();
}

class _PantsState extends State<Pants> {
  List <size> tlist =[
    size(siz:"small",price:"2999/-"),
    size(siz:"Medium",price:"3999/-"),
    size(siz:"Large",price:"4999/-"),
    size(siz:"Big",price:"5999/-"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
      //   centerTitle: true,
      //   title: Text("MINI SHOPING",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      //   backgroundColor: Colors.black38,
      //   actions: [
      //     IconButton(onPressed: (){
      //
      //
      //     }, icon: Icon(Icons.shopping_cart)),
      //   ],
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       UserAccountsDrawerHeader(
      //           accountName: Text("Ashique.k"),
      //           accountEmail: Text("ashikmessi3@gmail.com"),
      //   currentAccountPicture: CircleAvatar(
      //      backgroundImage: AssetImage("assets/images/Zayn.jpg"),
      //
      //     backgroundColor: Colors.white,
      //   ),
      // ),
      //       ListTile(
      //         title: Text("Best Seller",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black38),),
      //         onTap: (){},
      //       ),
      //       ListTile(
      //         title: Text("New Release",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black38),),
      //         onTap: (){},
      //       ),
      //       ListTile(
      //         title: Text("Best Seller",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black38),),
      //         onTap: (){},
      //       ),
      // ]
      //   ),
      // ),

     // drawer: Drawer(
     //    child: ListView(
     //      children: [
     //        UserAccountsDrawerHeader(accountName: Text("ASHIQUE.K"),
     //          accountEmail: Text("ashik12@gmail.com"),
     //          currentAccountPicture: CircleAvatar(
     //            backgroundImage: AssetImage("assets/images/Zayn.jpg"),
     //            backgroundColor: Colors.white,
     //
     //          ),
     //        ),
     //        ListTile(
     //          title: Text("Profile",style: TextStyle(fontSize: 14,color: Colors.black),),
     //          onTap: (){
     //            // Navigator.push(
     //            //   context,
     //            //   MaterialPageRoute(builder: (context) => const Profile()),
     //            // );
     //
     //          },
     //        ),
     //        ListTile(
     //          title: Text("My Orders",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
     //          onTap: (){},
     //        ),
     //        ListTile(
     //          title: Text("Settings",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
     //          onTap: (){},
     //        ),Container(
     //          color: Colors.blue,
     //          height: 2,
     //          width: 50,
     //          // child: ListTile(
     //          //         title: Text("Best Seller",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black38),),
     //          //         onTap: (){},
     //          //       ),
     //        ),
     //        ListTile(
     //          title: Text("New Release",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black38),),
     //          onTap: (){},
     //
     //        ),
     //        ListTile(
     //          title: Text("Hot Deals",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black38),),
     //          onTap: (){},
     //        ),
     //        ListTile(
     //          title: Text("Best Seller",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black38),),
     //          onTap: (){},
     //        ),
     //
     //
     //
     //      ],
     //    ),
     //  ),
           body: SingleChildScrollView(
             child: Column(
               children: [
                 SizedBox(
                   height: 25,
                 ),

                 Container(
                   height: 300,
                   width: MediaQuery.of(context).size.width,
                   child: Image.asset("assets/images/mok.jpg"),
                 ),
                 SizedBox(
                   height: 75,
                   width: 100,
                 ),
                 // Image.asset("assets/images/arrow.png"),
                 // SizedBox(
                 //   height: 25,
                 // ),
                 Text("Mokobara BagPack",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                 Container(
                   height: 150,
                   width: double.infinity,
                   child: GridView.builder(
                     itemCount: 4,

                     scrollDirection: Axis.horizontal,
                       gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(

                           crossAxisCount:1 ),
                       itemBuilder: (BuildContext context,int index)=>
                                   Card(
                                     child: Container(
                                       decoration: BoxDecoration(
                                           border: Border.all(
                                           width: 2,
                                           color: Colors.blue

                                         )
                                       ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Text("${tlist[index].siz}"),
                                            SizedBox(
                                                width: 50,
                                                height: 40,

                                                child: Image.asset("assets/images/big.jpg")),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text("${tlist[index].price}"),
                                            
                                          ],
                                        ),
                                     //   child: Text("10000/-",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                     // ),
                                   )

                   ),
                 ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   height: 5,
                   width: 500,
                   color: Colors.black12,
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 170),
                   child: Container(
                     height: 30,
                     width: 150,

                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8.0),
                       color: Colors.redAccent
                     ),
                     child: Center(child: Text("One Day Offer !",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 20),
                   child: Row(
                     children: [
                       Text("-15 %",style: TextStyle(fontSize: 30,color: Colors.red),),

                       Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Text("3999 /-",style: TextStyle(fontSize: 25,color: Colors.black),),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 40,
                   width: 300,


                   child: ElevatedButton(onPressed: (){}, child: Text("Add to Cart",style: TextStyle(fontSize: 15,color: Colors.black),),
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.yellow,
                   ),

                   ),
                 ),

                 SizedBox(
                   height: 20,
                 ),
                 SizedBox(
                   height: 40,
                   width: 300,

                   child: ElevatedButton(onPressed: () {}, child: Text("Buy Now",style: TextStyle(fontSize: 15,color: Colors.black),),
                                   style: ElevatedButton.styleFrom(
                                     shadowColor: Colors.black,
                    backgroundColor: Colors.orangeAccent,
                                   ),

                   ),
                 ),




               ],
             ),
           ),


    );
  }
}
class size{
  late String siz,price;
  size({required this.siz,required this.price});
}