// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:toast_order_app/bloc/product_detail/ingredient_bloc.dart'
    as _i1055;
import 'package:toast_order_app/services/direct_cart_service.dart' as _i593;
import 'package:toast_order_app/utilities/general_utils.dart' as _i815;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i1055.IngredientBloc>(() => _i1055.IngredientBloc());
    gh.factory<_i593.IDirectCartService>(() => _i593.DirectCartService());
    gh.factory<_i815.IGeneralUtils>(() => _i815.GeneralUtils());
    return this;
  }
}
