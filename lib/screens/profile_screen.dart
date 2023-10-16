import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipe/res/custom_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipe/routes/route_name.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final double coverHeight = 150;
  final double imageHeight = 120;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomColor.green,
        elevation: 0,
      ),
      body: ListView(padding: EdgeInsets.zero, children: <Widget>[
        buildTop(),
        SizedBox(height: 80),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Latifudin Ma'arif",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Android and Web Developer",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon: 'assets/icons/facebook.svg',
            ),
            Icon(
              icon: 'assets/icons/twitter.svg',
            ),
            Icon(
              icon: 'assets/icons/instagram.svg',
            ),
          ],
        ),
        SizedBox(height: 45),
        Container(
          child: Padding(
            padding: EdgeInsets.only(left: 22),
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "About me \n",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        "Hello, I'm latif. I am an android and web developer, I think developing applications is fun. I aspire to work in big companies, such as google, amazon, and microsoft.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 22),
          padding: EdgeInsets.only(top: 15),
          child: Text("Skills",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Skills(
              skill: 'assets/icons/flutter.svg',
            ),
            Skills(
              skill: 'assets/icons/codeigniter.svg',
            ),
            Skills(
              skill: 'assets/icons/java.svg',
            ),
            Skills(
              skill: 'assets/icons/laravel.svg',
            ),
          ],
        ),
        SizedBox(height: 50),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 22),
          width: 365.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                CustomColor.green,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: () {
              _signOut().then((value) => Get.toNamed(RouteName.page2));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                'LOGOUT',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget buildTop() {
    final top = coverHeight - imageHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: <Widget>[
        cover(),
        Positioned(top: top, child: profile()),
      ],
    );
  }

  Widget cover() => Container(
        height: coverHeight,
        decoration: BoxDecoration(
            color: CustomColor.green,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
      );

  Widget profile() => CircleAvatar(
        radius: imageHeight / 2,
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      );
}

class Icon extends StatelessWidget {
  final String icon;
  const Icon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: CustomColor.green),
            shape: BoxShape.circle),
        child: SvgPicture.asset(
          icon,
          color: CustomColor.green,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}

class Skills extends StatelessWidget {
  final String skill;
  const Skills({
    Key? key,
    required this.skill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: CustomColor.green),
            shape: BoxShape.circle),
        child: SvgPicture.asset(
          skill,
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
