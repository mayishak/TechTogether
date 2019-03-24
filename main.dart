import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'dart:convert' as JSON;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'FindFood'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var restaurant1;
  var restaurant2;
  var address1;
  var address2;
  var open1;
  var open2;

  final myController =TextEditingController();
   @override
   void dispose(){
     myController.dispose();
     super.dispose();
   }

  void getRestaurant() async {
    var location = await Location().getLocation();
    var latitude = location.latitude;
    var longitude = location.longitude;
    var client = http.Client();
    var test_food = myController.text;
    var food_data_unparsed = await client.get(
        'https://eatstreet.com/publicapi/v1/restaurant/search?access-token=c24b3265c91868e6&latitude=$latitude&longitude=$longitude&search=$test_food');
    var food_data = JSON.jsonDecode(food_data_unparsed.body);
    // print(food_data.toString());

    setState(() {
      restaurant1 = "1. "+(food_data['restaurants'][0]['name'].toString());
      address1 = (food_data['restaurants'][0]['streetAddress'].toString());
      open1 = "Open: "+(food_data['restaurants'][0]['open'].toString());
      restaurant2 = "2. "+(food_data['restaurants'][1]['name'].toString());
      address2 = (food_data['restaurants'][1]['streetAddress'].toString());
      open2 = "Open: "+(food_data['restaurants'][1]['open'].toString());
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.asset('assets/web_hi_res_512.png',),
            // new SizedBox(
            //   width: 100.0,
            //   height: 120.0,
            //   child: new FitImage(
            //     child: new Image.asset('asset/web_hi_res_512.png'),
            //     fit: fit,
            //   ),
            // ),

            Text(
              'What food are you looking for?',
              style: Theme.of(context).textTheme.display1,
              textAlign: TextAlign.center,
              textScaleFactor: 0.75,
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: TextField(
              controller:myController,
            ),
            ),
            RaisedButton(
              onPressed: getRestaurant,
              textColor: Colors.white,
              color: Colors.red,
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Find Food",
              ),
            ),

             Text( 
              '    ', 
            ),
            Text( 
              '$restaurant1', // Gives a string of the output from getRestaurant
              style: Theme.of(context).textTheme.display1,
              textAlign: TextAlign.center,
            ),
             Text( 
              '$address1', // Gives a string of the output from getRestaurant
              textAlign: TextAlign.center,
            ),
             Text( 
              '$open1', // Gives a string of the output from getRestaurant
              textAlign: TextAlign.center,
            ),
               Text( 
              '    ', 
            ),
             Text(
              '$restaurant2', // Gives a string of the output from getRestaurant
              style: Theme.of(context).textTheme.display1,
              textAlign: TextAlign.center,
            ),
            Text( 
              '$address2', // Gives a string of the output from getRestaurant
              textAlign: TextAlign.center,
            ),
            Text( 
              '$open2', // Gives a string of the output from getRestaurant
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
