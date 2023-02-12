import 'package:sleep_care/common/base/base_layout.dart';
import 'package:sleep_care/common/resource/styles.dart';
import 'package:sleep_care/domain/controller/users_controller.dart';
import 'package:flutter/material.dart';

class UsersLayout extends BaseLayout {
  @override
  State<StatefulWidget> createState() => _UsersLayoutState();
}

class _UsersLayoutState extends BaseLayoutState<UsersController, UsersLayout> {
  @override
  Widget buildLayout(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 40.0,
            left: 40.0,
            top: 20.0,
          ),
          child: Row(
            children: [
              Text(
                'Name',
                style: Styles.s28SapphireW700,
              ),
              Spacer(),
              Text(
                'Surname',
                style: Styles.s28SapphireW700,
              ),
              Spacer(),
              Text(
                'Email',
                style: Styles.s28SapphireW700,
              ),
              Spacer(),
              Text(
                'Age',
                style: Styles.s28SapphireW700,
              ),
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.all(40.0),
          itemBuilder: (_, index) {
            final user = controller.users[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Text(
                    user.name.toString(),
                    style: Styles.s28SapphireW400,
                  ),
                  Spacer(),
                  Text(
                    user.surname.toString(),
                    style: Styles.s28SapphireW400,
                  ),
                  Spacer(),
                  Text(
                    user.email.toString(),
                    style: Styles.s28SapphireW400,
                  ),
                  Spacer(),
                  Text(
                    user.age.toString(),
                    style: Styles.s28SapphireW400,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (_, index) {
            return Divider(height: 1.0, thickness: 1.0);
          },
          itemCount: controller.users.length,
        ),
      ],
    );
  }
}
