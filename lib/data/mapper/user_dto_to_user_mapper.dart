import 'package:sleep_care/data/model/remote/user_dto.dart';
import 'package:sleep_care/domain/model/user.dart';

import 'mapper.dart';

class UserDtoToUserMapper with Mapper<UserDto, User> {
  @override
  User map(UserDto model) {
    print('ok UserDtoToUserMapper');
    return User(
      name: model.name ?? '',
      surname: model.surname ?? '',
      email: model.email ?? '',
      age: model.age ?? 0,
      sleepingModeId: 0,
      password: '',
      phone: '',
      lifeStyleId: 0,
      gender: '',
    );
  }
}
