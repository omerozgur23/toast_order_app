import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/bloc/cart/cart_bloc.dart';
import 'package:toast_order_app/bloc/cart/cart_state.dart';
import 'package:toast_order_app/bloc/navigatin_bar/bottom_navigation_bloc.dart';
import 'package:toast_order_app/bloc/navigatin_bar/bottom_navigation_event.dart';
import 'package:toast_order_app/constants/color.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final BottomNavigationState state;
  // final int cartItemCount;

  const BottomNavigationBarWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    int currentIndex = _determineCurrentIndex(state);

    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, navState) {
      int cartItemCount = navState.cartItemCount;

      return BottomNavigationBar(
        items: _buildBottomNavigationBarItems(cartItemCount),
        type: BottomNavigationBarType.fixed,
        backgroundColor: HexColor(yellow),
        selectedItemColor: HexColor(white),
        unselectedItemColor: HexColor(black),
        onTap: (index) {
          context.read<BottomNavigationBloc>().add(TabChangedEvent(index));
        },
        currentIndex: currentIndex,
      );
    });
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems(
      int cartItemCount) {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Anasayfa",
      ),
      // BottomNavigationBarItem(
      //     icon: Icon(Icons.shopping_bag_outlined), label: 'Sepetim'),
      BottomNavigationBarItem(
          icon: badges.Badge(
            showBadge: cartItemCount > 0,
            badgeContent: Text(
              cartItemCount.toString(),
              style: TextStyle(color: HexColor(white), fontSize: 12),
            ),
            badgeStyle: badges.BadgeStyle(
                badgeColor: HexColor(red), padding: const EdgeInsets.all(5)),
            child: const Icon(Icons.shopping_bag_outlined),
          ),
          label: "Sepetim"),
      const BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Fırsatlar'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Hesabım'),
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
