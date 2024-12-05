import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo/core/constans/texts.dart';
import 'package:todo/core/helper/extenstion.dart';
import 'package:todo/core/helper/spacing.dart';
import 'package:todo/core/routes/settings.dart';
import 'package:todo/core/themes/my_colors.dart';

class OnbordingUi extends StatefulWidget {
  const OnbordingUi({super.key});

  @override
  State<OnbordingUi> createState() => _OnbordingUiState();
}

class _OnbordingUiState extends State<OnbordingUi> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.mainBackGround,
        leading: InkWell(
          onTap: () {
            context.pushNamed(Routers.welcome);
          },
          child: const Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              Texts.skip,
              style: TextStyle(color: Color.fromARGB(179, 255, 255, 255)),
            ),
          ),
        ),
      ),
      backgroundColor: MyColors.mainBackGround,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      _controller.position.moveTo(
                        _controller.position.pixels - details.delta.dx,
                      );
                    },
                    child: PageView.builder(
                        itemCount: Texts.mainText.length,
                        controller: _controller,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                            child: Column(
                              children: [
                                verticalSpace(15),
                                Image.asset(Texts.assetsOnBording[index]),
                                verticalSpace(40),
                                SmoothPageIndicator(
                                  controller: _controller,
                                  count: Texts.mainText.length,
                                  effect: const SlideEffect(
                                    spacing: 8.0,
                                    radius: 4.0,
                                    dotWidth:
                                        24.0, // Adjust the width to make it look like a dash
                                    dotHeight:
                                        3.0, // Adjust the height to make it look like a dash
                                    paintStyle: PaintingStyle.fill,
                                    dotColor: Colors.grey,
                                    activeDotColor: Colors.white,
                                  ),
                                ),
                                verticalSpace(40),
                                Text(
                                  Texts.mainText[index],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                verticalSpace(40),
                                Text(
                                  Texts.secondText[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (_controller.page! >= 1) {
                              _controller.previousPage(
                                  duration: const Duration(microseconds: 300),
                                  curve: Curves.bounceIn);
                            }
                          });
                        },
                        child: const SizedBox(
                          child: Text(
                            Texts.back,
                            style: TextStyle(
                                color: Color.fromARGB(132, 255, 255, 255)),
                          ),
                        ),
                      ),
                      horizontalSpace(200),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (_controller.page! < 3) {
                              _controller.nextPage(
                                  duration: const Duration(microseconds: 300),
                                  curve: Curves.bounceIn);
                            } else if (_controller.page! >= 3) {
                              context.pushNamed(Routers.welcome);
                            }
                          });
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.17,
                          height: MediaQuery.sizeOf(context).height * 0.06,
                          decoration: const BoxDecoration(
                              color: MyColors.lighterPurpel,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: const Center(
                            child: Text(
                              Texts.next,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
