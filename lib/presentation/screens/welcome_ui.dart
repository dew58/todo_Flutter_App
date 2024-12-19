import 'package:flutter/material.dart';
import 'package:todo/core/helper/extenstion.dart';
import 'package:todo/core/helper/spacing.dart';

import '../../core/constans/texts.dart';
import '../../core/routes/settings.dart';
import '../../core/themes/my_colors.dart';

class Welcomeui extends StatelessWidget {
  const Welcomeui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainBackGround,
      appBar: AppBar(
        surfaceTintColor: MyColors.mainBackGround,
        backgroundColor: MyColors.mainBackGround,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  Texts.welcomeMainText,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                verticalSpace(20),
                const Text(
                  Texts.welcomeSecondText,
                  style: TextStyle(color: Color.fromARGB(174, 255, 255, 255)),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(370),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routers.logIn);
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: MediaQuery.sizeOf(context).height * 0.07,
                    decoration: BoxDecoration(
                      color: MyColors.lighterPurpel,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        Texts.logInInWelcomePage,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                verticalSpace(20),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routers.singUp);
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: MediaQuery.sizeOf(context).height * 0.07,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: MyColors.lighterPurpel,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4))),
                    child: const Center(
                        child: Text(
                      Texts.creatAccount,
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
