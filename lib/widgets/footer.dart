import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      color: Color.fromARGB(17, 49, 49, 49),
      padding: EdgeInsets.fromLTRB(40, 5, 20, 5),
      height: 40,
      child: Text(
        'Copyright 2023 © HAI AN',
        style: TextStyle(color: const Color.fromARGB(255, 77, 77, 77)),
      ),
    );
  }
}
