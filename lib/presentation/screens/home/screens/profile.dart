import 'package:flutter/material.dart';
import 'package:todo/constans/my_colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
            child: Column(children: [
              const CircleAvatar(
                radius: 35,
              ),
              const Text(
                "Martha Hays",
                style: TextStyle(color: Colors.white),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: MediaQuery.sizeOf(context).height * 0.07,
                  decoration: const BoxDecoration(
                    color: MyColors.liteGray,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "10 Task left",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: MediaQuery.sizeOf(context).height * 0.07,
                  decoration: const BoxDecoration(
                    color: MyColors.liteGray,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "10 Task done",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              profileItem("assets/icons/setting-2.png", "App Settings", () {}),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Account",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              profileItem(
                  "assets/icons/user.png", "Change account name", () {}),
              profileItem(
                  "assets/icons/key.png", "Change account password", () {}),
              profileItem(
                  "assets/icons/camera.png", "Change account image", () {}),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Uptodo",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              profileItem("assets/icons/menu.png", "About US", () {}),
              profileItem("assets/icons/info-circle.png", "FAQ", () {}),
              profileItem("assets/icons/flash.png", "Help & Feedback", () {}),
              profileItem("assets/icons/like.png", "Support US", () {}),
              profileItem("assets/icons/logout.png", "Log out", () {}),
            ],
          )
        ],
      )),
    );
  }

  Widget profileItem(String assets, String name, Function function) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {
          function;
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
