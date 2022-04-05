import 'package:flutter/material.dart';
import 'package:lipid/presentation/screens/connexion/tools/bottom_sheet.dart';
import 'package:lipid/presentation/theme/design_systems.dart';
import 'package:lipid/presentation/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = PageController();

  double? currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page;
      });
    });

    return Scaffold(
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.62,
        ),
        Expanded(
            child: Container(
                width: double.infinity,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    boxShadow: [kShadowThree],
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(120))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(27.0),
                      child: SmoothPageIndicator(
                          controller: _controller, // PageController
                          count: 3,
                          effect: ExpandingDotsEffect(
                              dotColor: kGreyTwo,
                              activeDotColor:
                                  kPrimaryColorOne), // your preferred effect
                          onDotClicked: (index) {
                            _controller.animateToPage(index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                            setState(() {
                              currentPage = index.toDouble();
                            });
                          }),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          PageView(
                            controller: _controller,
                            children: [
                              Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text("Track your body weight",
                                      style: kLinkMedium.copyWith(
                                          color: kPrimaryColorOne,
                                          fontSize: 20)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      (MediaQuery.of(context).size.height /
                                              1.5) *
                                          0.01),
                                  child: Text(
                                      '    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi euismod consectetur quam massa diam. Elit tellus ultricies nibh cond',
                                      style: ktextxSmall.copyWith(
                                        color: kPrimaryColorThree,
                                      )),
                                )
                              ]),
                              Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text("Count what you eat",
                                      style: kLinkMedium.copyWith(
                                          color: kPrimaryColorOne,
                                          fontSize: 20)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      (MediaQuery.of(context).size.height /
                                              1.5) *
                                          0.01),
                                  child: Text(
                                      '   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi euismod consectetur quam massa diam. Elit tellus ultricies nibh cond',
                                      style: ktextxSmall.copyWith(
                                        color: kPrimaryColorThree,
                                      )),
                                )
                              ]),
                              Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text("Get Started",
                                      style: kLinkMedium.copyWith(
                                          color: kPrimaryColorOne,
                                          fontSize: 20)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      (MediaQuery.of(context).size.height /
                                              1.5) *
                                          0.01),
                                  child: Text(
                                      '   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi euismod consectetur quam massa diam. Elit tellus ultricies nibh cond',
                                      style: ktextxSmall.copyWith(
                                        color: kPrimaryColorThree,
                                      )),
                                )
                              ]),
                            ],
                          ),
                          Positioned(
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            right: currentPage! >= 1.50 ? 35 : 52,
                            child: currentPage! >= 1.50
                                ? CustomButton(
                                    text: 'Get Started',
                                    onPressed: () {
                                      showSheet(context, true);
                                    })
                                : InkWell(
                                    onTap: () {
                                      _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut);
                                    },
                                    child: Container(
                                        height: 54,
                                        width: 54,
                                        padding: const EdgeInsets.all(17),
                                        child: Container(
                                            height: 20,
                                            width: 20,
                                            padding: const EdgeInsets.all(2),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              size: 12,
                                            )),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kPrimaryColorOne,
                                        )),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )))
      ]),
    );
  }
}
