import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/bloc/navigatin_bar/bottom_navigation_bloc.dart';
import 'package:toast_order_app/bloc/order_type_button/order_type_bloc.dart';
import 'package:toast_order_app/bloc/order_type_button/order_type_state.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/views/starter/widgets/app_bar/app_bar_widget.dart';
import 'package:toast_order_app/views/starter/widgets/body/body_content_widget.dart';
import 'package:toast_order_app/views/starter/widgets/bottom/bottom_navigation_bar_widget.dart';
import 'package:toast_order_app/views/starter/widgets/bottom/bottom_sheet_widget.dart';

class Starter extends StatelessWidget {
  const Starter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderTypeBloc, OrderTypeState>(
      listener: (context, state) {
        if (state is BottomSheetOpenState) {
          BottomSheetWidget.showOrderTypeBottomSheet(context);
        }
      },
      builder: (context, state) {
        return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: HexColor(white),
              appBar: const AppBarWidget(),
              body: BodyContentWidget(state: state),
              bottomNavigationBar: BottomNavigationBarWidget(state: state),
            );
          },
        );
      },
    );
  }
}
