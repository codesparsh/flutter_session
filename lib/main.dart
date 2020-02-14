import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'basket.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         title: Text('Real Estate'),
         centerTitle: true,
      ),
      body: Houses(),
    );
  }
}

class Houses extends StatefulWidget {
  @override
  _HousesState createState() => _HousesState();
}

class _HousesState extends State<Houses> {
  var count=0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      child: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Container(
            alignment: Alignment.topLeft,
            child: Text('Find Your Perfect Home..',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.black,fontStyle: FontStyle.italic)
            ),
          ),
          SizedBox(height: 40,),
          
          CarouselSlider(
            height: 500,
            viewportFraction: 0.55,
            items:[
                cards('assets/house1.png', 100),
                cards('assets/house2.png', 200),
                cards('assets/house3.png', 300),
                cards('assets/house4.png', 500),
                cards('assets/house5.png', 700),
                // new AssetImage('assets/house2.png'),
                // new AssetImage('assets/house3.png'),
                // new AssetImage('assets/house4.png'),
                // new AssetImage('assets/house5.png'),
            ].map((con){
              return Column(
                              children: [
                                
                                Container(
                    decoration: BoxDecoration(
                      
                      gradient: LinearGradient(colors: [Colors.amber[100],Colors.amber],begin: Alignment.topCenter),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white
                    ),  
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    child:con,
                    
                ),
                           ]
              );
            }).toList(),
          ),
          RaisedButton(
                  color: Colors.amber,
                  
                  child: Text('Add to Cart'),
                  onPressed: (){
                  setState(() {
                    count++;
                  });
                  print(count);
                }),
                
          Container(
              alignment: Alignment(0.9,1),
              child: FloatingActionButton(
                
                child: Icon(Icons.shopping_basket),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=> Basket() ));
                }),
            ),
             
        ],
      ),
    );
  }
}
Widget cards(String path,int price){
  return Column(
     children:[

       Image(image: new AssetImage(path.toString()),
       height: 400,
       width: 200,
       ),
       Text("\$"+price.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
     ],
  );
}