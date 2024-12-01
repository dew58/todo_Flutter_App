import 'package:flutter/material.dart';
import 'package:todo/presentation/screens/loginUI.dart';

import 'package:todo/constans/texts.dart';
import 'package:todo/presentation/screens/signIN.dart';

class Welcomeui extends StatefulWidget {
  const Welcomeui({super.key});

  @override
  State<Welcomeui> createState() => _WelcomeuiState();
}

class _WelcomeuiState extends State<Welcomeui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0XFF121212),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              TextOfOnBording().welcomeMainText,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              TextOfOnBording().welcomeSecondText,
              style: const TextStyle(color: Color.fromARGB(174, 255, 255, 255)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.5,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Loginui()),
                );
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: MediaQuery.sizeOf(context).height * 0.07,
                decoration: const BoxDecoration(
                  color: Color(0xff8875FF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signin()),
                );
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: MediaQuery.sizeOf(context).height * 0.07,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff8875FF),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: const Center(
                    child: Text(
                  "CREATE ACCOUNT",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
