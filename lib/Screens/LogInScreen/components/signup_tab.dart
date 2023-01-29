import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:news_app/Components/my_button.dart';
import 'package:news_app/Controller/signup_controller.dart';

class SignupTab extends StatefulWidget {
  const SignupTab({super.key});

  @override
  State<SignupTab> createState() => _SignupTabState();
}

class _SignupTabState extends State<SignupTab> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  SignUpController signUpController = Get.put(SignUpController());

  String _errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: ListView(
          reverse: true,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: HexColor("#4f4f4f"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: HexColor("#8d8d8d"),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: emailController,
                        onChanged: (value) {
                          validateEmail(value);
                          signUpController.setEmail(value);
                        },
                        onSubmitted: (value) {
                          signUpController.setEmail(value);
                        },
                        cursorColor: HexColor("#4f4f4f"),
                        decoration: InputDecoration(
                          hintText: "John Smith",
                          fillColor: HexColor("#f0f3f1"),
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15,
                            color: HexColor("#8d8d8d"),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Email",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: HexColor("#8d8d8d"),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: emailController,
                        onChanged: (value) {
                          validateEmail(value);
                          signUpController.setEmail(value);
                        },
                        onSubmitted: (value) {
                          signUpController.setEmail(value);
                        },
                        cursorColor: HexColor("#4f4f4f"),
                        decoration: InputDecoration(
                          hintText: "hello@gmail.com",
                          fillColor: HexColor("#f0f3f1"),
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15,
                            color: HexColor("#8d8d8d"),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          _errorMessage,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Mobile Number",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: HexColor("#8d8d8d"),
                        ),
                      ),
                      Column(
                        children: [
                          InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                            },
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            ignoreBlank: false,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            selectorTextStyle:
                                const TextStyle(color: Colors.black),
                            initialValue: number,
                            textFieldController: controller,
                            formatInput: true,
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            inputBorder: const OutlineInputBorder(),
                            onSaved: (PhoneNumber number) {
                              formKey.currentState?.save();
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Password",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: HexColor("#8d8d8d"),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        onChanged: (value) {
                          signUpController.setPassword(value);
                        },
                        onSubmitted: (value) {
                          signUpController.setPassword(value);
                        },
                        obscureText: true,
                        controller: passwordController,
                        cursorColor: HexColor("#4f4f4f"),
                        decoration: InputDecoration(
                          hintText: "*************",
                          fillColor: HexColor("#f0f3f1"),
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15,
                            color: HexColor("#8d8d8d"),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          focusColor: HexColor("#44564a"),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      MyButton(
                          buttonText: 'Register',
                          onPressed: () async {
                            if (signUpController.email != null &&
                                signUpController.password != null) {
                              bool isRegistered =
                                  await signUpController.registerUser(
                                      signUpController.email.toString(),
                                      signUpController.password.toString());
                              debugPrint(isRegistered.toString());
                              if (isRegistered) {
                                Get.snackbar("Success", "User Registered");
                              } else {
                                Get.snackbar(
                                    "Error", "Please fill all the fields");
                              }
                            }
                          }),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                        child: Row(
                          children: [
                            Text("Already have an account?",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: HexColor("#8d8d8d"),
                                )),
                            TextButton(
                              child: Text(
                                "Log In",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: HexColor("#44564a"),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
