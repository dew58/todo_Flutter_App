import 'package:flutter/material.dart';
import 'package:todo/core/helper/spacing.dart';
import 'package:todo/presentation/widgets/calenar_helper.dart';
import '../../../../core/constans/texts.dart';
import '../../../../core/themes/my_colors.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainBackGround,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            Texts.calendar,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: MyColors.mainBackGround,
      ),
      body: SafeArea(
        child: Scrollable(viewportBuilder: (context, offset) {
          return Column(
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
              verticalSpace(15),
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
                        backgroundColor:
                            WidgetStateProperty.all(MyColors.purpel),
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
                        Texts.today,
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
                        Texts.completed,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
