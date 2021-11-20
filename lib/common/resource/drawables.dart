import 'package:flutter/material.dart';

class Drawables {
  Drawables._();

  static const _imagesPath = 'assets/images/';
  static const _imageExtension = '.png';

  static const edu = 'edu';
  static const bag = 'bag';
  static const portfolio = 'portfolio';
  static const calendar = 'calendar';
  static const tip = 'tip';
  static const download = 'download';
  static const bannerGrow = 'banner_grow';
  static const bannerSpec = 'banner_spec';
  static const bannerList = 'banner_list';
  static const question = 'question';
  static const infoBlack = 'info_black';
  static const whiteLeftArrow = 'white_left_arrow';
  static const specialization = 'specialization';
  static const trash = 'trash';
  static const attentionNotAllDataOnEvent = 'attention_not_all_data_on_event';
  static const arrowRight = 'arrow_right';
  static const smallArrowRight = 'small_arrow_right';
  static const archive = 'archive';
  static const cross = 'cross';
  static const search = 'search';
  static const portfolioIcon = 'portfolio_icon';
  static const profile = 'profile';
  static const message = 'message';
  static const logOut = 'log_out';
  static const languageCheck = 'language_check';
  static const notification = 'notification';
  static const blackLeftArrow = 'black_left_arrow';
  static const add = 'add';
  static const specAdd = 'spec_add';
  static const event = 'event';
  static const greyAdd = 'grey_add';
  static const whiteCross = 'white_cross';
  static const orangeAdd = 'orange_add';
  static const iconCalender = 'icon_calender';
  static const info = 'info';
  static const git = 'git';
  static const telegram = 'telegram';
  static const smile = 'smile';
  static const sad = 'sad';
  static const takoe = 'takoe';
  static const star = 'star';
  static const logo = 'logo';
  static const whiteCheck = 'white_check';

  static Widget getImage(
    String name, {
    Color? tint,
    double? width,
    double? height,
  }) {
    final path = '$_imagesPath$name$_imageExtension';
    if (width == null && height == null) {
      return Image.asset(path, color: tint);
    } else {
      return SizedBox(
        width: width,
        height: height,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(path, color: tint),
        ),
      );
    }
  }
}
