import 'package:flutter/material.dart';
import 'package:sleep_care/common/base/base_layout.dart';
import 'package:sleep_care/common/resource/drawables.dart';
import 'package:sleep_care/common/resource/palette.dart';
import 'package:sleep_care/common/resource/strings.dart';
import 'package:sleep_care/common/resource/styles.dart';
import 'package:sleep_care/domain/controller/rating_controller.dart';
import 'package:sleep_care/presentation/screen/authorization/component/life_style_item.dart';
import 'package:sleep_care/presentation/widget/rounded_button.dart';

class RatingLayout extends BaseLayout {
  @override
  State<StatefulWidget> createState() => _RatingLayoutState();
}

class _RatingLayoutState
    extends BaseLayoutState<RatingController, RatingLayout> {
  final textContrroller = TextEditingController();

  @override
  Widget buildLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        Strings.rateDescription,
                        style: Styles.s32CobaltW500,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                        child: SizedBox(
                          height: 43.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (_, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GestureDetector(
                                onTap: () => controller.changeNewStar(index),
                                child: Drawables.getImage(
                                  Drawables.star,
                                  tint: (controller.newStar ?? -1) < index
                                      ? Palette.greySuit
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                        child: TextField(
                          controller: textContrroller,
                          maxLines: 2,
                          minLines: 2,
                          style: Styles.s14CharcoalW500,
                          decoration: Styles.roundInputBoxDecoration,
                          onChanged: (text) {
                            controller.newComment = text;
                          },
                        ),
                      ),
                      SizedBox(
                        child: RoundedButton(
                          text: Strings.save,
                          onTap: () {
                            controller.tryAddComment();
                            textContrroller.clear();
                          },
                        ),
                        height: 47,
                        width: 500,
                      ),
                      ListView.builder(
                        itemCount: controller.comments.length,
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          final comment = controller.comments[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(comment.userName,
                                        style: Styles.s28SapphireW700),
                                    const SizedBox(width: 6.0),
                                    Drawables.getImage(Drawables.star),
                                    const SizedBox(width: 6.0),
                                    Text(
                                      comment.stars.toString(),
                                      style: Styles.s28SapphireW400,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 4.0),
                                Text(comment.commentText,
                                    style: Styles.s28SapphireW400)
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(child: Drawables.getImage(Drawables.logo))
          ],
        ),
      ),
    );
  }
}
