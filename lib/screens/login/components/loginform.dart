import 'package:employee_app/screens/HomePage.dart';
import 'package:employee_app/services/api.dart';
import 'package:employee_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/defaultbutton.dart';
import '../../../constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: isLoading == false
          ? Column(
              children: [
                buildEmailFormField(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                buildPasswordFormField(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                DefaultButton(
                    text: "Log In",
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        setState(() {
                          isLoading = true;
                        });
                        AuthClass()
                            .signIN(
                                email: email!.trim(),
                                password: password!.trim())
                            .then(
                          (value) {
                            if (value == "Welcome") {
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (route) => false);
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                        );
                      }
                      ;
                    }),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Container(
                  child: SignInButton(Buttons.Google,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // <-- Radius
                      ), onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    AuthClass()
                        //.signWithGoogle()
                        .signInWithGoogle()
                        .then((UserCredential value) async {
                      final displayName = value.user!.email;

                      print(displayName);

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (route) => false);
                      await Api.loginUser(value.user!);
                    });
                  }),
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: SvgPicture.asset("assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: SvgPicture.asset("assets/icons/Mail.svg"),
      ),
    );
  }
}
