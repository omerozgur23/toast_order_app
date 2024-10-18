import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast_order_app/bloc/carousel/carousel_bloc.dart';
import 'package:toast_order_app/bloc/category/category_bloc.dart';
import 'package:toast_order_app/bloc/category/category_event.dart';
import 'package:toast_order_app/bloc/navigatin_bar/bottom_navigation_bloc.dart';
import 'package:toast_order_app/bloc/order_type_button/order_type_bloc.dart';
import 'package:toast_order_app/bloc/product/product_bloc.dart';
import 'package:toast_order_app/bloc/product/product_event.dart';
import 'package:toast_order_app/firebase_options.dart';
import 'package:toast_order_app/repository/category_repository.dart';
import 'package:toast_order_app/repository/product_repository.dart';
import 'package:toast_order_app/views/starter/starter.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => CarouselBloc(),
    ),
    BlocProvider(
      create: (context) => BottomNavigationBloc(),
    ),
    BlocProvider(
        create: (context) =>
            CategoryBloc(CategoryRepository())..add(FetchCategoriesEvent())),
    BlocProvider(
        create: (context) =>
            ProductBloc(ProductRepository())..add(FetchProductsEvent())),
    BlocProvider(
      create: (context) => OrderTypeBloc(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tostum Benim',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Starter(),
    );
  }
}
