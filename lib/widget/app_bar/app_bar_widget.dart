import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/bloc/navigatin_bar/bottom_navigation_bloc.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';
import 'package:toast_order_app/widget/app_bar/address_button_widget.dart';
import 'package:toast_order_app/widget/app_bar/login_button_widget.dart';
import 'package:toast_order_app/widget/app_bar/order_type_button_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
      return Container(
        decoration: _buildAppBarShadow(),
        child: AppBar(
          backgroundColor: HexColor(yellow),
          leading: Padding(
            padding: EdgeInsets.all(context.dynamicHeight(0.001)),
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
            ),
          ),
          title: _getTitle(state, context),
          centerTitle: true,
          actions: const [LoginButtonWidget()],
        ),
      );
    });
  }

  Widget _getTitle(BottomNavigationState state, BuildContext context) {
    String? title;

    if (state is CartScreenState) {
      title = "Sepetim";
    } else if (state is OfferScreenState) {
      title = "Fırsatlar";
    } else if (state is AccountScreenState) {
      title = "Hesabım";
    } else if (state is OrderConfirmationScreenState) {
      title = "Sipariş Onayı";
    }

    if (title != null) {
      return Text(
        title,
        style: TextStyle(
            fontSize: context.dynamicHeight(
              0.015,
            ),
            fontWeight: FontWeight.bold),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const OrderTypeButtonWidget(),
        SizedBox(
          width: context.dynamicWidth(0.005),
        ),
        const AddressButtonWidget()
      ],
    );
  }

  BoxDecoration _buildAppBarShadow() {
    return BoxDecoration(
      color: HexColor(black),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          spreadRadius: 0,
          blurRadius: 5,
          offset: const Offset(0, 3),
        )
      ],
    );
  }
}
