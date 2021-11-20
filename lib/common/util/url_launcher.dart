import 'package:url_launcher/url_launcher.dart';

mixin UrlLauncher {
  Future<void> tryLaunch(String url) async {
    if (await canLaunch(url)) await launch(url);
  }

  Future<void> tryPhoneCall(String phone) async =>
      await tryLaunch('tel:$phone');

  Future<void> tryOpenMailClient(String mail) async =>
      await tryLaunch('mailto:$mail');
}
