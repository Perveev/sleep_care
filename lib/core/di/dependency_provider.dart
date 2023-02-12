import 'package:get_it/get_it.dart';
import 'package:sleep_care/core/di/component/database_component.dart';
import 'package:sleep_care/data/mapper/age_category_dto_to_age_category_mapper.dart';
import 'package:sleep_care/data/mapper/indicators_dto_to_indicators_mapper.dart';
import 'package:sleep_care/data/mapper/life_style_dto_to_life_style_mapper.dart';
import 'package:sleep_care/data/mapper/sleep_model_dto_to_sleep_model_mapper.dart';
import 'package:sleep_care/data/mapper/user_dto_to_user_mapper.dart';
import 'package:sleep_care/data/repository/admin_panel_repository.dart';
import 'package:sleep_care/data/repository/authorization_repository.dart';
import 'package:sleep_care/data/repository/life_style_repository.dart';
import 'package:sleep_care/data/source/remote/api/admin_panel_api.dart';
import 'package:sleep_care/data/source/remote/api/authorization_api.dart';
import 'package:sleep_care/data/source/remote/api/life_style_api.dart';
import 'package:sleep_care/data/use_case/get_life_style_use_case.dart';
import 'package:sleep_care/data/use_case/get_sleep_mode_use_case.dart';
import 'package:sleep_care/data/use_case/login_user_use_case.dart';
import 'package:sleep_care/data/use_case/registration_user_use_case.dart';

import 'component/network_service_component.dart';

T get<T extends Object>() => GetIt.I<T>();

Future<void> setupDI({bool isDebug = true}) async {
  GetIt.I..registerSingleton(createNetworkService(isDebug: isDebug));

  //Api
  GetIt.I
    ..registerFactory(() => LifeStileApi(get()))
    ..registerFactory(() => AdminPanelApi(get()))
    ..registerFactory(() => AuthorizationApi(get()));

  //Repository
  GetIt.I
    ..registerFactory(() => LifeStyleRepository(get(), get(), get()))
    ..registerFactory(
        () => AdminPanelRepository(get(), get(), get(), get(), get(),get()))
    ..registerFactory(() => AuthorizationRepository(get()));

  //UseCase
  GetIt.I
    ..registerFactory(() => GetLifeStyleUseCase(get()))
    ..registerFactory(() => RegistrationUserUseCase(get()))
    ..registerFactory(() => LoginUserUseCase(get()))
    ..registerFactory(() => GetSleepModesUseCase(get()));

  //Mapper
  GetIt.I
    ..registerFactory(() => LifeStyleDtoToLifeStyleMapper())
    ..registerFactory(() => IndicatorDtoToIndicatorMapper())
    ..registerFactory(() => UserDtoToUserMapper())
    ..registerFactory(() => AgeCategoryDtoToAgeCategoryMapper())
    ..registerFactory(() => SleepModeDtoToSleepModeMapper());
}
