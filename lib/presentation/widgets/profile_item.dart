import 'package:flutter/material.dart';

class ProfileItem {
  Widget profileItem(String assets, String name, Function function) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(assets),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        color: (name == "Log out") ? Colors.red : Colors.white),
                  )
                ],
              ),
            ),
            if (!(name == "Log out"))
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
