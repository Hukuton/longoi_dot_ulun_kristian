import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:longoi_dot_ulun_kristian/database/app_database.dart';
import 'package:longoi_dot_ulun_kristian/models/models_notifier/active_list_provider.dart';
import 'package:longoi_dot_ulun_kristian/utility/connectivity_service.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewNotationScreen extends StatelessWidget {
  static const id = 'view_notation_screen';

  const ViewNotationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Hymn hymn =
        Provider.of<ActiveListProvider>(context, listen: false).getItem();
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          hymn.title,
          //style: const TextStyle(fontSize: 30),
          maxLines: 2,
        ),
      ),
      body: NotationPlayer(notationUrl: hymn.notationHtml),
    );
  }
}

class NotationPlayer extends StatefulWidget {
  final String notationUrl;
  const NotationPlayer({Key? key, required this.notationUrl}) : super(key: key);

  @override
  State<NotationPlayer> createState() => _NotationPlayerState();
}

class _NotationPlayerState extends State<NotationPlayer> {
  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  int progress = 0;
  bool progressBarVisibility = true;

  @override
  Widget build(BuildContext context) {
    // Get our connection status from the provider
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    AwesomeDialog awesomeDialog = createDialog();

    if (connectionStatus == ConnectivityStatus.wiFi ||
        connectionStatus == ConnectivityStatus.cellular) {
      return createView(context);
    }
    if (connectionStatus == ConnectivityStatus.offline) {
      Future.delayed(Duration.zero, () => awesomeDialog.show());
    }
    return const Center(child: CircularProgressIndicator());
  }

  Widget createView(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 2;
    String url =
        widget.notationUrl.replaceAll('height="100%', 'height="$height');
    return Column(
      children: [
        Expanded(
          flex: 99,
          child: WebView(
            initialUrl:
                Uri.dataFromString(url, mimeType: 'text/html').toString(),
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (progress) {
              setState(() {
                this.progress = progress;
              });
            },
            onPageFinished: (_) {
              progressBarVisibility = false;
            },
          ),
        ),
        Visibility(
          visible: progressBarVisibility,
          child: Expanded(
            flex: 2,
            child: LinearPercentIndicator(
              width: width,
              lineHeight: 8.0,
              percent: progress / 100,
              progressColor: Theme.of(context).indicatorColor,
            ),
          ),
        ),
      ],
    );
  }

  AwesomeDialog createDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.RIGHSLIDE,
      headerAnimationLoop: true,
      title: 'ERROR',
      desc: 'Aso Internet!',
      onDissmissCallback: (DismissType type) {
        if (type == DismissType.OTHER) {
          Navigator.of(context).pop();
        }
      },
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
      btnOkIcon: Icons.cancel,
      btnOkText: 'OK',
      btnOkColor: Theme.of(context).primaryColor,
      customHeader: const Icon(
        Icons.signal_wifi_connected_no_internet_4,
        size: 50.0,
      ),
    );
  }
}
