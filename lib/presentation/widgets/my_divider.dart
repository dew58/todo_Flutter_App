import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 1,
            endIndent: 10,
            indent: 40,
          ),
        ),
        Text("or", style: TextStyle(color: Colors.white)),
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 1,
            endIndent: 40,
            indent: 10,
          ),
        )
      ],
    );
  }
}
