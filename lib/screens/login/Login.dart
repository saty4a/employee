import 'package:employee_app/screens/login/body.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.6,
          elevation: 0,
          snap: true,
          floating: true,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [
              StretchMode.zoomBackground,
            ],
            background: Image(
                image: AssetImage("assets/sunset.jpg"), fit: BoxFit.cover),
          ),
          bottom: PreferredSize(
              child: Transform.translate(
                offset: Offset(0, 1),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                      child: Container(
                    width: 50,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )),
                ),
              ),
              preferredSize: Size.fromHeight(45)),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                color: Colors.black45,
                child: Body(),
              )
            ],
          ),
        )
      ]),
    );
  }
}
