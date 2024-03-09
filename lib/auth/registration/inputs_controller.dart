import 'package:flutter/material.dart';
import 'package:migrant/auth/registration/text_fields.dart';

// ignore: must_be_immutable
class RegistrationPageInputs extends StatefulWidget {
  // controller first name
  final TextEditingController firstNameController;
  // controller last name
  final TextEditingController lastNameController;
  // controller email
  final TextEditingController emailController;
  // controller password
  final TextEditingController passwordController;
  // controller confirm password
  final TextEditingController confirmPasswordController;
  // obsecure text
  bool passwordObscureText = true;
  // obsecure text consfirm paswword
  bool confirmPasswordObscureText = true;

  RegistrationPageInputs(
      {super.key,
      required this.firstNameController,
      required this.lastNameController,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.passwordObscureText,
      required this.confirmPasswordObscureText});

  @override
  State<RegistrationPageInputs> createState() => _RegistrationPageInputsState();
}

class _RegistrationPageInputsState extends State<RegistrationPageInputs> {
  // send email controller to registration page

  @override
  Widget build(BuildContext context) {
    checkValidateToEmpty(String? value) {
      if (value!.isEmpty) {
        return 'Please enter your first name';
      }
    }

    checkValidateToEmail(String? value) {
      if (value!.isEmpty) {
        return 'Please enter an email address';
      } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
          .hasMatch(value)) {
        return 'Please enter a valid email address';
      }
      return null; // Return null if the input is valid
    }

    checkValidateToPassword(String? value) {
      if (value!.isEmpty) {
        return 'Please enter a password';
      } else if (value.length < 6) {
        return 'Password must be at least 6 characters long';
      } else if (widget.passwordController.text !=
          widget.confirmPasswordController.text) {
        return 'Passwords do not match';
      }
      return null; // Return null if the input is valid
    }

    final List<MyTextFields> registrationPageInputs = [
      MyTextFields(
        label: 'First Name',
        controller: widget.firstNameController,
        prefixIcon: Icons.person,
        suffixIcon: Icons.clear,
        keyboardType: TextInputType.name,
        type: "text",
      ),
      MyTextFields(
        label: 'Last Name',
        controller: widget.lastNameController,
        prefixIcon: Icons.person,
        suffixIcon: Icons.clear,
        keyboardType: TextInputType.name,
        type: "text",
      ),
      MyTextFields(
        label: 'Email',
        controller: widget.emailController,
        prefixIcon: Icons.email,
        suffixIcon: Icons.clear,
        keyboardType: TextInputType.emailAddress,
        type: "email",
      ),
      MyTextFields(
        label: 'Password',
        controller: widget.passwordController,
        prefixIcon: Icons.lock,
        suffixIcon: Icons.remove_red_eye_outlined,
        keyboardType: TextInputType.visiblePassword,
        type: 'password',
      ),
      MyTextFields(
        label: 'Confirm Password',
        controller: widget.confirmPasswordController,
        prefixIcon: Icons.lock,
        suffixIcon: Icons.remove_red_eye_outlined,
        keyboardType: TextInputType.visiblePassword,
        type: 'confirmPassword',
      ),
    ];
    return Column(
      children: [
        for (var input in registrationPageInputs)
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              validator: input.type == 'text'
                  ? checkValidateToEmpty
                  : input.type == 'email'
                      ? checkValidateToEmail
                      : checkValidateToPassword,
              controller: input.controller,
              keyboardType: input.keyboardType,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide:
                        const BorderSide(color: Colors.blueGrey, width: .5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide:
                        const BorderSide(color: Colors.blueGrey, width: 1)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide:
                      const BorderSide(color: Colors.blueGrey, width: .5),
                ),
                contentPadding: const EdgeInsets.all(16.0),
                labelText: input.label,
                labelStyle: const TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.w400),
                // input cleare button
                prefixIcon: Icon(input.prefixIcon,
                    size: 20, color: Colors.blueGrey.shade400),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (input.type == 'password') {
                      setState(() {
                        widget.passwordObscureText =
                            !widget.passwordObscureText;
                      });
                    } else if (input.type == 'confirmPassword') {
                      setState(() {
                        widget.confirmPasswordObscureText =
                            !widget.confirmPasswordObscureText;
                      });
                    } else {
                      input.controller.clear();
                    }
                  },
                  icon: Icon(input.suffixIcon,
                      size: 20, color: Colors.blueGrey.shade400),
                ),
              ),
              obscureText: input.type == 'password'
                  ? widget.passwordObscureText
                  : input.type == 'confirmPassword'
                      ? widget.confirmPasswordObscureText
                      : false,
            ),
          ),
      ],
    );
  }
}
