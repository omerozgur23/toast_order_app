import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/bloc/carousel/carousel_bloc.dart';
import 'package:toast_order_app/bloc/carousel/carousel_event.dart';
import 'package:toast_order_app/bloc/carousel/carousel_state.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  final List<String> imgList = const [
    'assets/tostum-benim-qr-2.png',
    'assets/tostum-benim-qr.png',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselBloc, CarouselState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: context.dynamicHeight(0.25),
                viewportFraction: 1.0,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  context.read<CarouselBloc>().add(CarouselChangeEvent(index));
                },
              ),
              items: imgList.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            _buildIndicator(state.currentIndex, context),
          ],
        );
      },
    );
  }

  Widget _buildIndicator(int currentIndex, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.dynamicHeight(0.007)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => context
                .read<CarouselBloc>()
                .add(CarouselChangeEvent(entry.key)), // Olayı tetikle
            child: Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    (entry.key == currentIndex) ? HexColor(black) : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
