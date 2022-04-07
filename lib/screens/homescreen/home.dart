import 'dart:convert';

import 'package:employee_app/components/card.dart';
import 'package:employee_app/models/employee.dart';
import 'package:employee_app/models/response.dart';
import 'package:employee_app/services/api.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 60.0),
            child: Row(
              children: [
                Text(
                  "HomeScreen",
                  style: TextStyle(
                    //appbar title
                    fontWeight: FontWeight.bold,
                    //letterSpacing: 0.,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.only(left: 65.0),
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        //appbar title
                        fontWeight: FontWeight.bold,
                        //letterSpacing: 1.0,
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder<Response>(
          future: Api.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Response response = snapshot.data!;
              List<Employee> employees = employeeFromJson(jsonEncode(response.data));
              return Container(
                child: ListView.builder(
                  itemCount: employees.length,
                  itemBuilder: (context, index) {
                    return employeeCard(
                      emp: employees[index],
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
