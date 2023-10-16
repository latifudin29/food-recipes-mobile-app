import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipe/res/custom_color.dart';
import 'package:food_recipe/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  registerSubmit() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text.toString().trim(),
          password: passwordController.text);
    } catch (e) {
      print(e);
      SnackBar(content: Text(e.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 123),
            Text(
              "Welcome, create your account",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7),
            Text(
              "and enjoy exploring food recipes",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80),
              width: 365.0,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColor.green),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter your email"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 22),
              width: 365.0,
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColor.green),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter your password"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 22),
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
                  registerSubmit();
                  Get.toNamed(RouteName.page2);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text(
                    'Register',
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
            SizedBox(height: 40),
            Row(
              children: <Widget>[
                Text(
                  "Already have account?",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextButton(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.green,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(RouteName.page2);
                    })
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 365.0,
              child: Row(
                children: <Widget>[
                  buildDivider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "OR",
                      style: TextStyle(
                          color: CustomColor.green,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  buildDivider(),
                ],
              ),
            ),
            SizedBox(height: 30),
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
                  icon: 'assets/icons/google-plus.svg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
        child: Divider(
      color: CustomColor.green,
      height: 1.5,
    ));
  }
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
