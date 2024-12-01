import 'package:flutter/material.dart';

import 'package:todo/constans/my_colors.dart';
import 'package:todo/presentation/widgets/calenar_helper.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          actions: const [Icon(Icons.verified_user)],
          elevation: 0,
          leading: Image.asset("assets/icons/sort.png"),
          title: const Center(
            child: Text(
              "Calendar",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.black),
      body: Scrollable(viewportBuilder: (context, offset) {
        return Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.17,
              decoration: const BoxDecoration(color: MyColors.liteGray),
              child: Column(children: [
                HorizontalWeekCalendar(
                  minDate: DateTime(2023, 12, 31),
                  maxDate: DateTime(2024, 1, 31),
                  initialDate: DateTime(2024, 1, 15),
                  onDateChange: (date) {},
                  showTopNavbar: true,
                  monthFormat: "MMMM yyyy",
                  showNavigationButtons: true,
                  weekStartFrom: WeekStartFrom.Sunday,
                  borderRadius: BorderRadius.circular(4),
                  activeBackgroundColor: MyColors.purpel,
                  activeTextColor: Colors.white,
                  inactiveBackgroundColor: Colors.black.withOpacity(.3),
                  inactiveTextColor: Colors.white,
                  disabledTextColor: Colors.grey,
                  disabledBackgroundColor: Colors.black.withOpacity(.3),
                  activeNavigatorColor: Colors.white,
                  inactiveNavigatorColor: Colors.grey,
                  monthColor: Colors.white,
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.75,
              height: MediaQuery.sizeOf(context).height * 0.1,
              decoration: const BoxDecoration(
                color: MyColors.liteGray,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(MyColors.purpel),
                      elevation: WidgetStateProperty.all(5), // Set elevation
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(4), // Set border radius
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Today",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.liteGray,
                      side: const BorderSide(width: 1, color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Completed",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
