import 'package:flutter/material.dart';
import 'package:latihan_responsi/pages/home/home_page.dart';
import 'package:latihan_responsi/pages/user_account/register.dart';
import 'package:latihan_responsi/services/storage_service.dart';
import 'package:latihan_responsi/utils/colors.dart';
import 'package:latihan_responsi/widgets/buttons.dart';
import 'package:latihan_responsi/widgets/dialogs.dart';
import 'package:latihan_responsi/widgets/text_fields.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  "Login",
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
                      "Login",
                      darkBlueColor,
                      () async {
                        try {
                          //await api.login(_emailController.text, _passwordController.text, context);
                          await storageService.login(_usernameController.text,
                              _passwordController.text, context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        } catch (e) {
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
