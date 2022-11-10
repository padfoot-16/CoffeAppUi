// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:coffee_ui/utils/coffe_categor.dart';
import 'package:coffee_ui/utils/coffeetile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   final List coffeeType=[
    [
      'Macciato',true
    ],
    [
      'Latte',false
    ],
    [
      'Black',false
    ],
    ] ;


  void coffeeTypeSelected(int index){
    setState(() {
      for(int i=0;i<coffeeType.length;i++){
        coffeeType[i][1]=false;
      }
      coffeeType[index][1]= true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 53, 53),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
      actions: [Padding(
        padding: const EdgeInsets.only(right:25.0),
        child: Icon(Icons.person),
      )],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon:Icon(Icons.home),
          label: ""),
        BottomNavigationBarItem(
          icon:Icon(Icons.favorite),
          label: ""),
        BottomNavigationBarItem(
          icon:Icon(Icons.notifications),
          label: ""),
    ]),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            colorFilter: ColorFilter.mode(Color.fromARGB(168, 0, 0, 0), BlendMode.darken),
            fit: BoxFit.cover
            )
        ),
        child: Column(children: [
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text("Find The Best Coffee For You",
            style:GoogleFonts.bebasNeue(
              fontSize: 60,
            ),

            ),
          ),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, ),
                hintText: "Find Your Coffee",
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(height: 25,),

          Container(
            height: 50,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
              return CoffeeType(
                coffeeType: coffeeType[index][0],
                 isSelected: coffeeType[index][1],
                  onTap: (() {
                    coffeeTypeSelected(index);
                  }
                  ));
            }
            )
            ),
          

          Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeeImagePath: "assets/images/macciato.jpg",
                coffeeName: "Macciato",
                coffeePrice: "4",
              ),
              CoffeeTile(
                coffeeImagePath: "assets/images/latte.jpg",
                coffeeName: "Latte",
                coffeePrice: "6",
              ),
              CoffeeTile(
                coffeeImagePath: "assets/images/black.jpg",
                coffeeName: "black",
                coffeePrice: "5",
              ),
            ],
          )
          )
        ],)
        )
    );
    
  }
}