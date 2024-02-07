import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/screens/bags.dart';
import 'package:miniproject/screens/contacts.dart';
import 'package:miniproject/screens/profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexnum = 0;
  List <images> clist=[
    images(img: "assets/images/shoe.jpg",name:"shoes"),
   images(img: "assets/images/jacket.jpg",name:"Jackets"),
   images(img: "assets/images/cargo.jpg",name:"Cargos"),
    images(img: "assets/images/watches.webp",name:"Watches"),
    images(img: "assets/images/perfumes.avif",name:"Perfumes"),
    images(img: "assets/images/mok.jpg",name:"Bagpack"),
    // images(img: "data:image/jpeg;base64,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",name:"Spects"),
    images(img: "assets/images/dior.jpg",name:"Spects"),


  ];
  List tabs =[
    contact(),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        
        title: Text("MINI SHOPING",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text("ASHIQUE.K"),
                accountEmail: Text("ashik12@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/Zayn.jpg"),
              backgroundColor: Colors.white,

            ),
            ),
            ListTile(
              title: Text("Profile",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );

              },
            ),
      ListTile(
        title: Text("My Orders",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
        onTap: (){},
      ),
      ListTile(
        title: Text("Settings",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
            onTap: (){},
      ),Container(
              color: Colors.blue,
              height: 2,
               width: 50,
        // child: ListTile(
        //         title: Text("Best Seller",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black38),),
        //         onTap: (){},
        //       ),
      ),
            ListTile(
              title: Text("New Release",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
              onTap: (){},

            ),
            ListTile(
              title: Text("Hot Deals",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
              onTap: (){},
            ),
      ListTile(
                title: Text("Best Seller",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                onTap: (){},
              ),

            
            
          ],
        ),
      ),

      body:


      SingleChildScrollView(


        child: Container(

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))

                    ),
                    suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  ),
                ),

              ),   //search textfield........

              // Padding(
              //   padding: const EdgeInsets.all(1.0),
              //   child: SizedBox(
              //       height: 230,
              //       width: 500,
              //       child: Image.asset("assets/images/shoes.jpg")),
              //
              // ),

              SingleChildScrollView(
                child: Container(
                  height: 500,
                  width: double.infinity,
                  child: ListView(
                    children: [
                      CarouselSlider(
                          items:[
                            Container(
                
                
                              child: Image.asset("assets/images/laptop.jpg")
                
                            ),
                            Container(
                
                              child: Image.asset("assets/images/eye.jpg")
                            ),
                            Container(
                              width: 400,
                              child: Image.asset("assets/images/headphones.jpg")
                            ),
                            Container(
                              child: Image.asset("assets/images/phone.jpg")
                            ),
                          ] ,
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 16/9,
                            height: 180,scrollDirection: Axis.horizontal,
                            autoPlayAnimationDuration: Duration(milliseconds: 400),
                            viewportFraction: 0.8,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            pageSnapping: true,
                          ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: 200,
                        width: 400,
                        child: Image.asset("assets/images/shoes.jpg"),
                      ),
                    ),

                
                
                    Container(
                      height: 200,


                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(



                            crossAxisCount: 1,),
                            itemCount: clist.length,
                            itemBuilder: (BuildContext context,int index)=>
                        Card(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: 200,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Pants()),
    );







                                  },
                                  child: Container(
                                    height:140,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage("${clist[index].img}"))
                                    ),

                                    child:Stack(
                                      children: [
                                        Positioned

                                          (
                                           width: 45,
                                            height: 45,
                                            top: 5,

                                            child: Image.asset("assets/images/dis20.png")),
                                        Positioned(
                                            height: 20,
                                            width: 20,
                                            right: 15,
                                            bottom: 0,


                                            child: Image.asset("assets/images/heart.png")),

                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text("${clist[index].name}"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                        ),
                        
                      ),
                      
                      
                    ),
                      Container(

                        height: 300,
                        width: 400,
                        child: Image.asset("assets/images/cargo.jpg"),
                      ),
                    ],
                  ),
                ),
              )
    ]
          ),
      ),
      ),
      );


  }
}
class images{
  late String img,name;
  images({required this.img,required this.name});
}
