import 'package:employee_app/screens/signup/components/Signinform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import '../login/Login.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 2.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            child: Text(
              "Sign up",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            //height: MediaQuery.of(context).size.height * 0.34,
            child: SignForm(),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Container(child:
              Container(
                margin: EdgeInsets.only(left: 100.0),
                child: Text("Have an account? Sign In"),
                //padding: EdgeInsets.only(left: 10.0),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.0),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "here",
                      style: new TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
