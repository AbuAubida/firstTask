import 'package:flutter/material.dart';
import 'package:login_page/domain/widgets/default_text_filed.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 final TextEditingController emailController = TextEditingController();
final  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Builder(
                builder: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login Page",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultTextField(
                        controller: emailController,
                        labelText: "email",
                        isPassword: false),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultTextField(
                        controller: passController,
                        labelText: "password",
                        isPassword: true),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (passController.text == "admin" &&
                                emailController.text == "admin") {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.greenAccent,
                                    title: Text('Congratulations'),
                                    content: Text('Successfull Login'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close dialog
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // Text color
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,

                          elevation: 10, // Shadow depth
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.login_outlined,
                                  size: 20,
                                  color: Colors.white,
                                ), // Icon
                                const SizedBox(width: 10),
                                Text(
                                  "Login",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
