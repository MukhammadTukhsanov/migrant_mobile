import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthPagesBtn extends StatelessWidget {
  // text widget
  Function() onPressed;
  AuthPagesBtn({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(MediaQuery.of(context).size.width, 50),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(16),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.blueGrey,
        ),
      ),
      child: const Text('Create Account',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400)),
    );
  }
}
