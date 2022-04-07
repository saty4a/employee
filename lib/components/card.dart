import 'package:employee_app/models/employee.dart';
import 'package:flutter/material.dart';

class employeeCard extends StatefulWidget {
  const employeeCard({
    Key? key,
    required this.emp,
     //required this.hire,
  }) : super(key: key);

  final Employee emp;
  //final bool hire;

  @override
  State<employeeCard> createState() => _CardState();
}

class _CardState extends State<employeeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      shadowColor: Colors.black,
      color: Colors.white12,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black12,
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.emp.picture),
              radius: 50,
            ),
            ),
            SizedBox(height: 10),
            Text(
              widget.emp.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.emp.email,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            // Container(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       if (widget.emp.hire) {
            //         setState(() {
            //           widget.emp.hire = false;
            //         });
            //       } else {
            //         setState(() {
            //           widget.emp.hire = true;
            //         });
            //       }
            //     },
            //     child: Text(
            //       widget.emp.hire ? "Hired" : "Hire",
            //       style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black,
            //       ),
            //     ),
            //     style: ElevatedButton.styleFrom(
            //       primary: widget.emp.hire ? Colors.blue[400] : Colors.red[400],
            //     shape: 
            //       RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //     ),
            //     )
            //     ),
        ],),
              );
  }
}
