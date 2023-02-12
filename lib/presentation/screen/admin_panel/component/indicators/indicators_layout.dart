import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sleep_care/common/base/base_layout.dart';
import 'package:sleep_care/common/resource/strings.dart';
import 'package:sleep_care/common/resource/styles.dart';
import 'package:sleep_care/domain/controller/indicators_controller.dart';
import 'package:sleep_care/domain/model/indicator.dart';
import 'package:sleep_care/presentation/widget/option_item.dart';
import 'package:sleep_care/presentation/widget/rounded_button.dart';

class IndicatorsLayout extends BaseLayout {
  final String locale ;

  IndicatorsLayout(this.locale);

  @override
  State<StatefulWidget> createState() => _IndicatorsLayoutState();
}

class _IndicatorsLayoutState
    extends BaseLayoutState<IndicatorsController, IndicatorsLayout> {

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
            child: Row(
              children: [
                Text(Strings.title, style: Styles.s28SapphireW700),
                Spacer(),
                Text('Unit'.tr(), style: Styles.s28SapphireW700),
                Spacer(),
                Text('default value'.tr(), style: Styles.s28SapphireW700),
                Spacer(flex: 6),
              ],
            ),
          ),
          ListView.separated(
            padding: EdgeInsets.all(40.0),
            itemCount: controller.indicators.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final indicator = controller.indicators[index];
              return Row(
                children: [
                  Text(
                    indicator.title.toString(),
                    style: Styles.s28SapphireW400,
                  ),
                  Spacer(),
                  Text(
                    getUnit(indicator.unit),
                    style: Styles.s28SapphireW400,
                  ),
                  Spacer(),
                  Text(
                    getValue(indicator.defaultValue, indicator.unit).toString(),
                    style: Styles.s28SapphireW400,
                  ),
                  Spacer(),
                  SizedBox(
                    width: 250,
                    child: OptionItem(
                      onTap: () => controller.deleteIndicator(index),
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
                                        .copyWith(hintText: 'unit'),
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
                                          .copyWith(hintText: 'value'),
                                      onChanged: (input) => value = input,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 300.0, vertical: 25.0),
                                  child: RoundedButton(
                                    text: Strings.save,
                                    onTap: () {
                                      controller.refactorIndicator(
                                        Indicator(
                                          defaultValue:
                                              double.tryParse(value) ?? 1,
                                          unit: unit,
                                          title: title,
                                          id: controller.indicators[index].id,
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
                                .copyWith(hintText: 'unit'),
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
                                  .copyWith(hintText: 'value'),
                              onChanged: (input) => value = input,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 300.0, vertical: 25.0),
                          child: RoundedButton(
                            text: Strings.save,
                            onTap: () {
                              controller.addIndicator(
                                Indicator(
                                  defaultValue: double.tryParse(value) ?? 1,
                                  unit: unit,
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
      ),
    );
  }

  String getUnit(String unit) {
    if (unit.toLowerCase() == 'кг') {
      if (widget.locale == 'en') {
        return 'Pd';
      } else {
        return 'Кг';
      }
    } else if (unit.toLowerCase() == 'c') {
      if (widget.locale == 'en') {
        return 'F';
      } else {
        return 'C';
      }
    } else {
      return unit;
    }
  }

  double getValue(double unitValue, String unit) {
    if (widget.locale == 'en' && (unit == 'C' || unit == 'Кг')) {
      return unitValue * 2.205;
    } else {
      return unitValue;
    }
  }
}
