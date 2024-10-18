import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';
import 'package:toast_order_app/views/starter/widgets/app_bar/address_button_widget.dart';
import 'package:toast_order_app/views/starter/widgets/app_bar/login_button_widget.dart';
import 'package:toast_order_app/views/starter/widgets/app_bar/order_type_button_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildAppBarShadow(),
      child: AppBar(
        backgroundColor: HexColor(yellow),
        leading: Padding(
          padding: EdgeInsets.all(context.dynamicHeight(0.001)),
          child: Image.asset('assets/logo.png', fit: BoxFit.contain),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const OrderTypeButtonWidget(),
            SizedBox(
              width: context.dynamicWidth(0.005),
            ),
            const AddressButtonWidget()
          ],
        ),
        centerTitle: true,
        actions: const [LoginButtonWidget()],
      ),
    );
  }

  // Gölge için metod
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
