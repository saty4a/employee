import 'package:employee_app/screens/login/components/loginform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

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
              "Log in",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            //height: MediaQuery.of(context).size.height * 0.26,
            child: LoginForm(),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Container(child:
              Container(
                margin: EdgeInsets.only(left: 70.0),
                child: Text("Don't have an account? Create one"),
                //padding: EdgeInsets.only(left: 10.0),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.0),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    //           Login()),
                    // );
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
