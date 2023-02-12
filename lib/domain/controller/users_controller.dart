import 'package:sleep_care/common/base/base_controller.dart';
import 'package:sleep_care/data/repository/admin_panel_repository.dart';
import 'package:sleep_care/data/source/remote/api/admin_panel_api.dart';
import 'package:sleep_care/domain/model/sleep_mode.dart';
import 'package:sleep_care/domain/model/user.dart';

class UsersController extends BaseController {
  final AdminPanelRepository _adminPanelRepository;
  List<User> users = [
    User(
      name: 'Daria',
      surname: 'Koshkina',
      email: 'daria.koshkina@nure.ua',
      phone: '380964729983',
      password: 'password',
      gender: 'gender',
      age: 19,
      sleepingModeId: 3,
      lifeStyleId: 3,
    ),
    User(
      name: 'Andrey',
      surname: 'Koshkin',
      email: 'andry@gmail.com',
      phone: 'phone',
      password: 'password',
      gender: 'gender',
      age: 30,
      sleepingModeId: 3,
      lifeStyleId: 3,
    ),
    User(
      name: 'Test',
      surname: 'Test',
      email: 'test@gmail.com',
      phone: 'phone',
      password: 'password',
      gender: 'gender',
      age: 19,
      sleepingModeId: 3,
      lifeStyleId: 3,
    ),
  ];

  UsersController(this._adminPanelRepository);

  void loadList() {
    execute<List<User>>(
      _adminPanelRepository.getUserList(),
      onSuccess: (users) {
        this.users = users;
      },
    );
  }
}
