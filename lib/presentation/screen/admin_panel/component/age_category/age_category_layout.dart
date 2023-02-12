import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sleep_care/common/base/base_layout.dart';
import 'package:sleep_care/common/resource/strings.dart';
import 'package:sleep_care/common/resource/styles.dart';
import 'package:sleep_care/domain/controller/age_category_controller.dart';
import 'package:sleep_care/domain/model/age_category.dart';
import 'package:sleep_care/presentation/widget/option_item.dart';
import 'package:sleep_care/presentation/widget/rounded_button.dart';

class AgeCategoryLayout extends BaseLayout {
  @override
  State<StatefulWidget> createState() => _AgeCategoryLayoutState();
}

class _AgeCategoryLayoutState
    extends BaseLayoutState<AgeCategoryController, AgeCategoryLayout> {
  @override
  void onInit() => controller.loadList();

  @override
  Widget buildLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 40.0,
            top: 40.0,
          ),
          child: Row(
            children: [
              Text(Strings.title, style: Styles.s28SapphireW700),
              Spacer(),
              Text('min', style: Styles.s28SapphireW700),
              Spacer(),
              Text('max', style: Styles.s28SapphireW700),
              Spacer(flex: 6),
            ],
          ),
        ),
        ListView.separated(
          padding: EdgeInsets.all(40.0),
          itemCount: controller.ageCategories.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final indicator = controller.ageCategories[index];
            return Row(
              children: [
                Text(
                  indicator.title.toString(),
                  style: Styles.s28SapphireW400,
                ),
                Spacer(flex: 4),
                Text(
                  indicator.min.toString(),
                  style: Styles.s28SapphireW400,
                ),
                Spacer(flex: 4),
                Text(
                  indicator.max.toString(),
                  style: Styles.s28SapphireW400,
                ),
                Spacer(flex: 4),
                SizedBox(
                  width: 250,
                  child: OptionItem(
                    onTap: () => controller.deleteAgeCategory(index),
                    title: Strings.remove,
                    trailing: Icon(Icons.delete_forever),
                    textStyle: Styles.s28SapphireW400,
                  ),
                ),
                SizedBox(width: 75.0),
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
                          String unit = '';
                          String value = '';
                          String title = '';
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 25.0),
                              Text(
                                Strings.changeSm,
                                style: Styles.s28SapphireW700,
                              ),
                              SizedBox(height: 25.0),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 300.0,
                                ),
                                child: TextField(
                                  autofocus: true,
                                  decoration: Styles.roundInputBoxDecoration
                                      .copyWith(hintText: 'title'),
                                  onChanged: (input) => title = input,
                                ),
                              ),
                              SizedBox(height: 25.0),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 300.0,
                                ),
                                child: TextField(
                                  autofocus: true,
                                  decoration: Styles.roundInputBoxDecoration
                                      .copyWith(hintText: 'min'),
                                  onChanged: (input) => unit = input,
                                ),
                              ),
                              SizedBox(height: 25.0),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 300.0,
                                  ),
                                  child: TextField(
                                    autofocus: true,
                                    decoration: Styles.roundInputBoxDecoration
                                        .copyWith(hintText: 'max'),
                                    onChanged: (input) => value = input,
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 300.0, vertical: 25.0),
                                child: RoundedButton(
                                  text: Strings.save,
                                  onTap: () {
                                    controller.refactorAgeCategory(
                                      AgeCategory(
                                        max: int.tryParse(value) ?? 1,
                                        min: int.tryParse(unit) ?? 1,
                                        title: title,
                                        id: controller.ageCategories[index].id,
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
                  String unit = '';
                  String value = '';
                  String title = '';
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 25.0),
                      Text(
                        Strings.changeSm,
                        style: Styles.s28SapphireW700,
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 300.0,
                        ),
                        child: TextField(
                          autofocus: true,
                          decoration: Styles.roundInputBoxDecoration
                              .copyWith(hintText: 'title'),
                          onChanged: (input) => title = input,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 300.0,
                        ),
                        child: TextField(
                          autofocus: true,
                          decoration: Styles.roundInputBoxDecoration
                              .copyWith(hintText: 'min'),
                          onChanged: (input) => unit = input,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 300.0,
                          ),
                          child: TextField(
                            autofocus: true,
                            decoration: Styles.roundInputBoxDecoration.copyWith(
                              hintText: 'max',
                            ),
                            onChanged: (input) => value = input,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 300.0, vertical: 25.0),
                        child: RoundedButton(
                          text: Strings.save,
                          onTap: () {
                            controller.addAgeCategory(
                              AgeCategory(
                                max: int.tryParse(value) ?? 1,
                                min: int.tryParse(unit) ?? 1,
                                title: title,
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
    );
  }
}
