import 'dart:convert';

import 'package:hive/hive.dart';
part 'employee.g.dart';

List<Employee> employeeFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class Employee {
  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.picture,
    required this.location,
    //required this.hire,
  });

  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String phone;
  @HiveField(4)
  String picture;
  @HiveField(5)
  String location;
  // @HiveField(6)
  // bool hire;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        picture: json["picture"],
        location: json["location"], 
        //hire: false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "picture": picture,
        "location": location,
        //"hire": hire,
      };
}
