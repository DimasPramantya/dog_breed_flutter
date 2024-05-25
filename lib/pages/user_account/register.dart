import 'package:flutter/material.dart';
import 'package:latihan_responsi/models/user.dart';
import 'package:latihan_responsi/pages/user_account/login.dart';
import 'package:latihan_responsi/services/storage_service.dart';
import 'package:latihan_responsi/utils/colors.dart';
import 'package:latihan_responsi/widgets/buttons.dart';
import 'package:latihan_responsi/widgets/dialogs.dart';
import 'package:latihan_responsi/widgets/text_fields.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  //final api = ApiService();
  final storageService = StorageService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Register",
                  style: TextStyle(
                      color: darkBlueColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Welcome back, glad to see you again!",
                  style: TextStyle(
                      color: greyTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                    child: Column(
                  children: [
                    customTextFormField(
                      controller: _usernameController,
                      placeholder: "Username",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    customTextFormField(
                      controller: _passwordController,
                      placeholder: "Password",
                      isObscure: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    customButton(
                      context,
                      "Register",
                      darkBlueColor,
                      () async {
                        try {
                          print(_usernameController.text);
                          print(_passwordController.text);
                          var user = User(
                              username: _usernameController.text,
                              password: _passwordController.text);
                          await storageService.register(user, context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        } catch (e) {
                          print(e.toString());
                          failedDialog(context, e.toString());
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          const EdgeInsetsDirectional.only(end: 15, start: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsetsDirectional.only(end: 0.5),
                            child: const Text(
                              "Don’t have an account? ",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 12,
                                color: darkBlueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
