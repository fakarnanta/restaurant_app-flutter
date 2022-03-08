import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:line_icons/line_icons.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.height;
    final pages;
    int _current = 0;
    return Scaffold(
        body: SafeArea(
            top: true,
            left: true,
            right: true,
            child: Padding(
              padding: EdgeInsets.only(left: 18),
              child: Column(
                children: [
                  Stack(
                    children: [
                      FutureBuilder(
                        future: Future.value(true),
                        builder:
                            (BuildContext context, AsyncSnapshot<void> snap) {
                          //If we do not have data as we wait for the future to complete,
                          //show any widget, eg. empty Container
                          if (!snap.hasData) {
                            return Container();
                          }

                          //Otherwise the futu  re completed, so we can now safely use the controller.page
                          return Container();
                        },
                      ),
                      Positioned(
                          top: 18,
                          left: 18,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(LineIcons.backward))),
                      Container(
                        child: CarouselSlider(
                          carouselController: _controller,
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.4,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          ),
                          items: [
                            Container(
                              child:
                                  Image.asset('assets/images/burgerimage.png'),
                            ),
                            Container(
                              child:
                                  Image.asset('assets/images/burgerimage2.jpg'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SmoothPageIndicator(
                    count: _current,
                    controller: PageController(viewportFraction: 0.8),
                    effect: WormEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.grey,
                    ),
                  )
                ],
              ),
            )));
  }
}
