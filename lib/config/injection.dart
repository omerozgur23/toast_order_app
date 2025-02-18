import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:toast_order_app/config/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
