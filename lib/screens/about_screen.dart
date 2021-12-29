import 'package:flutter/material.dart';
import 'package:longoi_dot_ulun_kristian/widgets/app_bar_painter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  static const id = 'about_screen';
  const AboutScreen({Key? key}) : super(key: key);
  final String pageId = "199305283786450";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        toolbarHeight: 65.0,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColorLight.withOpacity(.08),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: 'Iti aplikasi diti minozo di buuk ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.apply(fontSizeFactor: 1.2),
                    ),
                    TextSpan(
                      text: 'Longoi Dot Ulun Kristian',
                      style: Theme.of(context).textTheme.bodyText1?.apply(
                          fontSizeFactor: 1.3,
                          color: IconTheme.of(context).color),
                    ),
                    TextSpan(
                        text:
                            '. Ong varo nunu-nunu ot pongitungan antawa varo nasala ko nunu nopo, obuli mangatod sid:',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.apply(fontSizeFactor: 1.2))
                  ]),
                ),
                const SizedBox(height: 20.0),
                OutlinedButton.icon(
                  icon: const Icon(Icons.email_outlined),
                  label: const Text('hukuton.pl@gmail.com'),
                  onPressed: () async {
                    launch("mailto:hukuton.pl@gmail.com");
                  },
                ),
                const SizedBox(height: 20.0),
                OutlinedButton.icon(
                  onPressed: () {
                    launch("fb://page/$pageId");
                  },
                  icon: const Icon(Icons.facebook),
                  label: const Text('facebook.com/hukuton'),
                ),
                const SizedBox(height: 20.0),
                const Text('App Version: 3.0.0'),
              ],
            ),
          ),
          CustomPaint(
            painter: AppBarPainter(color: Theme.of(context).primaryColor),
            child: Container(height: 0),
          ),
        ],
      ),
    );
  }
}
