import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/constans/texts.dart';
import 'welcome_ui.dart';

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
        backgroundColor: const Color(0XFF121212),
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Welcomeui()),
            );
          },
          child: const Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "SKIP",
              style: TextStyle(color: Color.fromARGB(179, 255, 255, 255)),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0XFF121212),
      body: Center(
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
                    itemCount: TextOfOnBording().mainText.length,
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Image.asset(
                                TextOfOnBording().assetsOnBording[index]),
                            const SizedBox(
                              height: 40,
                            ),
                            SmoothPageIndicator(
                              controller: _controller,
                              count: TextOfOnBording().mainText.length,
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
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              TextOfOnBording().mainText[index],
                              style: const TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              TextOfOnBording().secondText[index],
                              style: const TextStyle(
                                color: Color(0xffFFFFFF),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            Container(
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
                    child: Container(
                      child: const Text(
                        "BACK",
                        style: TextStyle(
                            color: Color.fromARGB(132, 255, 255, 255)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (_controller.page! < 3) {
                          _controller.nextPage(
                              duration: const Duration(microseconds: 300),
                              curve: Curves.bounceIn);
                        }
                      });
                      setState(() {
                        if (_controller.page! >= 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Welcomeui()),
                          );
                        }
                      });
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.17,
                      height: MediaQuery.sizeOf(context).height * 0.06,
                      decoration: const BoxDecoration(
                          color: Color(0xff8875FF),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: const Center(
                        child: Text(
                          "NEXT",
                          style: TextStyle(color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
