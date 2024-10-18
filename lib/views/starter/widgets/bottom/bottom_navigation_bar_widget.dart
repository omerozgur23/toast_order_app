import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/bloc/navigatin_bar/bottom_navigation_bloc.dart';
import 'package:toast_order_app/bloc/navigatin_bar/bottom_navigation_event.dart';
import 'package:toast_order_app/constants/color.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final BottomNavigationState state;
  const BottomNavigationBarWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    int currentIndex = _determineCurrentIndex(state);

    return BottomNavigationBar(
      items: _buildBottomNavigationBarItems(),
      type: BottomNavigationBarType.fixed,
      backgroundColor: HexColor(yellow),
      selectedItemColor: HexColor(white),
      unselectedItemColor: HexColor(black),
      onTap: (index) {
        context.read<BottomNavigationBloc>().add(TabChangedEvent(index));
      },
      currentIndex: currentIndex,
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Anasayfa",
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined), label: 'Sepetim'),
      BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Fırsatlar'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Hesabım'),
    ];
  }

  int _determineCurrentIndex(BottomNavigationState state) {
    if (state is HomeScreenState) {
      return 0;
    } else if (state is CartScreenState) {
      return 1;
    } else if (state is OfferScreenState) {
      return 2;
    } else if (state is AccountScreenState) {
      return 3;
    } else {
      return 0;
    }
  }
}
