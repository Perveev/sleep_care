import 'package:flutter/material.dart';
import 'package:sleep_care/common/base/base_layout.dart';
import 'package:sleep_care/common/resource/drawables.dart';
import 'package:sleep_care/common/resource/palette.dart';
import 'package:sleep_care/common/resource/strings.dart';
import 'package:sleep_care/common/resource/styles.dart';
import 'package:sleep_care/domain/controller/statistics_controller.dart';
import 'package:sleep_care/domain/model/indicators.dart';
import 'package:sleep_care/presentation/screen/graphic/graphic_screen.dart';
import 'package:sleep_care/presentation/screen/statistics/component/indicators_item.dart';
import 'package:sleep_care/presentation/widget/rounded_button.dart';

class StatisticsLayout extends BaseLayout {
  final String locale;

  StatisticsLayout(this.locale);
  @override
  State<StatefulWidget> createState() => _StatisticsLayoutState();
}

class _StatisticsLayoutState
    extends BaseLayoutState<StatisticsController, StatisticsLayout> {
  @override
  Widget buildLayout(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(keepScrollOffset: false),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24.0),
            Center(
              child: Text(
                Strings.welcomeStatistics,
                style: Styles.s38CobaltW500,
              ),
            ),
            const SizedBox(height: 64.0),
            if (controller.sleepScores.isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  Strings.weekSleepStatisctik,
                  style: Styles.s38SapphireW500,
                ),
              ),
              const SizedBox(height: 36.0),
              SizedBox(
                height: 280.0,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.sleepScores.length,
                  itemBuilder: (_, index) {
                    final sleepScore = controller.sleepScores[index];
                    return GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        padding: const EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          color: Palette.whisper,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: Column(
                          children: [
                            Drawables.getImage(getSmile(sleepScore.score)),
                            const SizedBox(height: 16.0),
                            Text(
                              '${Strings.score} ${sleepScore.score}',
                              style: Styles.s28SapphireW400,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${Strings.date} ${sleepScore.date}',
                              style: Styles.s28SapphireW400,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${Strings.interval} ${sleepScore.interval}h',
                              style: Styles.s28SapphireW400,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 60.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  Strings.statistikCategory,
                  style: Styles.s38SapphireW500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 40.0),
                child: RoundedButton(
                  text: Strings.lookStatistick,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GraphicScreen()),
                    );
                  },
                ),
              )
            ],
            SizedBox(height: 68.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                Strings.yourRecommendation,
                style: Styles.s38SapphireW500,
              ),
            ),
            const SizedBox(height: 36.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Drawables.getImage(Drawables.logo),
                  const SizedBox(
                    width: 90,
                  ),
                  IndicatorsItem(
                    locale: widget.locale,
                    indicator: IndicatorsValue.test(),
                    textStyle: Styles.s32CobaltW700,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getSmile(int score) {
    if (score < 4) {
      return Drawables.sad;
    } else if (score <= 7) {
      return Drawables.takoe;
    } else {
      return Drawables.smile;
    }
  }
}
