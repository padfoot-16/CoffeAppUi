// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:coffee_ui/utils/coffe_categor.dart';
import 'package:coffee_ui/utils/coffee_popup.dart';
import 'package:coffee_ui/utils/coffeedata.dart';
import 'package:coffee_ui/utils/hero_dialog_route.dart';
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
      'All',true
    ],
    [
      'Macchiato',false
    ],
    [
      'Latte',false
    ],
    [
      'Black',false
    ],
    [
      'Iced',false
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
      resizeToAvoidBottomInset: false,
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
    ],
    selectedItemColor: Colors.orange),
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
          SizedBox(height: 55),
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
          SizedBox(height: 13,),

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
            child:_Coffecontent(data:coffeedata) 
            )
        ],)
        )
    );
    
  }
}
class _Coffecontent extends StatelessWidget {
  const _Coffecontent({
    Key? key,
    required this.data
  }) : super(key: key);

  final List<CoffeeCard> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        final _data=data[index];
        return _Coffcard(coff:_data);
      }
      ); 
  }
}
class _Coffcard extends StatelessWidget {
  const _Coffcard({
    Key? key,
    required this.coff,
    }) : super(key: key);
    final CoffeeCard coff;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          HeroDialogRoute(
          builder: (context) =>Center(
            child: _Opencard(coff:coff),
          )
        )
        );
      },
      child: Hero(
        tag: coff.tag,
        
         child: Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        width: 200,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //coffee image
            Container(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(coff.coffeeImagePath),
              ),
            ),
            //coffe name
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Column(
                children: [
                  Text(
                    coff.coffeeName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "With Almond milk",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            //price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$'+ coff.coffeeprice),
                  Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(4)),
                      child: Icon(Icons.favorite)),
                  Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(4)),
                      child: Icon(Icons.add)),
                ],
              ),
            )
          ],
        ),
      ),
    )
         ),
    );
  }
}

class _Opencard extends StatelessWidget {
  const _Opencard({
    Key? key,
    required this.coff
    }) : super(key: key);
    final CoffeeCard coff;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: coff.tag,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color:Colors.orange
              ),borderRadius: BorderRadius.circular(16)
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black
                        )
                      ),
                      child: Image.asset(coff.coffeeImagePath)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                        children: [
                          Text(coff.coffeeName,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                          Text('\$${coff.coffeeprice}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    
                    const SizedBox(
                      height: 8,
                    ),
                    
                    Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                          width: 2
                        ),
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(coff.coffeedescr,style: TextStyle(fontSize: 18, )),
                      ),
                      
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(4)),
                      child: Icon(Icons.favorite)),
                  Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(4)),
                      child: Icon(Icons.add)),
                    ],)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    
  }
}