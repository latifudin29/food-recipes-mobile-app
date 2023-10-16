import 'package:flutter/material.dart';
import 'package:food_recipe/res/custom_color.dart';
import 'package:food_recipe/screens/data_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.0),
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Welcome",
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                    TextSpan(
                      text: "\nFind the recipe you want",
                      // text: auth.currentUser!.email,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.search, size: 18, color: CustomColor.green),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColor.green),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Search for recipes"),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.zero,
                child: Container(
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: CustomColor.green,
                              style: BorderStyle.solid,
                              width: 3.0))),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Popular Recipes',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                          Text('This Week',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 0.0),
                height: 125.0,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _foodCard(),
                    SizedBox(width: 10.0),
                    _foodCard(),
                    SizedBox(width: 10.0),
                    _foodCard(),
                    SizedBox(width: 10.0),
                  ],
                ),
              ),
              SizedBox(height: 35.0),
              Row(
                children: <Widget>[
                  Text("Recommended Today",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0)),
                ],
              ),
              SizedBox(height: 15),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 280.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.35),
                                BlendMode.multiply,
                              ),
                              image: AssetImage('assets/images/breakfast.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Center(
                    child: Container(
                        padding: EdgeInsets.only(top: 120),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'BEST OF THE DAY',
                              style: TextStyle(
                                  fontSize: 35.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Color.fromARGB(218, 136, 191, 168),
                                onPressed: () {
                                  Route route = MaterialPageRoute(
                                      builder: (context) => DataScreen());
                                  Navigator.push(context, route);
                                },
                                child: Text("Let's See",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Colors.white)))
                          ],
                        )),
                  )
                ],
              ),
            ],
          )),
    );
  }

  Widget _foodCard() {
    return Container(
      height: 125.0,
      width: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: CustomColor.green,
      ),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage('assets/images/balanced.png'))),
            height: 125.0,
            width: 100.0,
          ),
          SizedBox(width: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Grilled Chicken',
                style: TextStyle(fontFamily: 'Quicksand'),
              ),
              Text(
                'with Fruit Salad',
                style: TextStyle(fontFamily: 'Quicksand'),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 2.0,
                width: 75.0,
                color: Colors.white,
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        image: DecorationImage(
                            image: AssetImage('assets/images/chris.jpg'))),
                  ),
                  SizedBox(width: 10.0),
                  Text('James Oliver',
                      style: TextStyle(fontFamily: 'Quicksand'))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
