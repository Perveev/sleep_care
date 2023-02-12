import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sleep_care/common/base/base_layout.dart';
import 'package:sleep_care/common/resource/strings.dart';
import 'package:sleep_care/common/resource/styles.dart';
import 'package:sleep_care/domain/controller/sleepmode_controller.dart';
import 'package:sleep_care/domain/model/sleep_mode.dart';
import 'package:sleep_care/presentation/widget/option_item.dart';
import 'package:sleep_care/presentation/widget/rounded_button.dart';

class SleepModeLayout extends BaseLayout {
  @override
  State<StatefulWidget> createState() => _ActivitiesLayoutState();
}

class _ActivitiesLayoutState
    extends BaseLayoutState<SleepModeController, SleepModeLayout> {
  @override
  void onInit() {
    controller.loadList();
  }

  @override
  Widget buildLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
              top: 40.0,
            ),
            child: Text(Strings.sleepInterval, style: Styles.s28SapphireW700),
          ),
          ListView.separated(
            padding: EdgeInsets.all(40.0),
            itemCount: controller.sleepsMode.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final sleepMode = controller.sleepsMode[index];
              return Row(
                children: [
                  Text(
                    sleepMode.sleepInterval.toString(),
                    style: Styles.s28SapphireW400,
                  ),
                  Spacer(),
                  SizedBox(
                    width: 250,
                    child: OptionItem(
                      onTap: () => controller.deleteActivity(index),
                      title: Strings.remove,
                      trailing: Icon(Icons.delete_forever),
                      textStyle: Styles.s28SapphireW400,
                    ),
                  ),
                  SizedBox(width: 100.0),
                  SizedBox(
                    width: 250,
                    child: OptionItem(
                      textStyle: Styles.s28SapphireW400,
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: false,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24.0),
                            ),
                          ),
                          context: context,
                          builder: (_) {
                            String text = '';
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 50.0),
                                Text(
                                  Strings.changeSm,
                                  style: Styles.s28SapphireW700,
                                ),
                                SizedBox(height: 50.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 300.0),
                                  child: TextField(
                                    autofocus: true,
                                    decoration: Styles.roundInputBoxDecoration,
                                    onChanged: (input) => text = input,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 300.0, vertical: 50.0),
                                  child: RoundedButton(
                                    text: Strings.save,
                                    onTap: () {
                                      controller.refactorActivity(
                                        SleepMode(
                                          sleepInterval:
                                              double.tryParse(text) ?? 0,
                                          id: controller.sleepsMode[index].id,
                                        ),
                                        index,
                                      );
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      title: Strings.change,
                      trailing: Icon(Icons.settings),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (_, index) => Divider(height: 1.0, thickness: 1.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 800.0, right: 50),
            child: RoundedButton(
              text: Strings.add,
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: false,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.0),
                    ),
                  ),
                  context: context,
                  builder: (_) {
                    String text = '';
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 50.0),
                        Text(Strings.addSm, style: Styles.s28SapphireW700),
                        SizedBox(height: 50.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 300.0),
                          child: TextField(
                            autofocus: true,
                            decoration: Styles.roundInputBoxDecoration,
                            onChanged: (input) => text = input,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 300.0,
                            vertical: 50.0,
                          ),
                          child: RoundedButton(
                            text: Strings.save,
                            onTap: () {
                              controller.addActivity(
                                SleepMode(
                                  sleepInterval: double.tryParse(text) ?? 0,
                                ),
                              );
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
