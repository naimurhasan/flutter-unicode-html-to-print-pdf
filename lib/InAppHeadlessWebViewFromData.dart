import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:math';

class InAppHeadlessWebViewData extends StatefulWidget {
  @override
  _InAppHeadlessWebViewDataState createState() =>
      new _InAppHeadlessWebViewDataState();
}

class _InAppHeadlessWebViewDataState extends State<InAppHeadlessWebViewData> {
  HeadlessInAppWebView headlessWebView;
  String url = "";
  bool isPrinting = false;

  @override
  void initState() {
    super.initState();

    headlessWebView = new HeadlessInAppWebView(
      initialUrl: "",
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(),
      ),
      onWebViewCreated: (controller) {
        print('HeadlessInAppWebView created!');
        // controller.loadFile(assetFilePath: "assets/index.html");
        var random = Random();
        controller.loadData(
            data:
                "<p> এখানে যুক্ত বর্ণ ভাঙছে না। This is some text with random number as <font color='red' size='20px'>${random.nextInt(999)}</font></p>");
      },
      onConsoleMessage: (controller, consoleMessage) {
        print("CONSOLE MESSAGE: " + consoleMessage.message);
      },
      onLoadStart: (controller, url) async {
        print("onLoadStart $url");
        setState(() {
          this.url = url ?? '';
        });
      },
      onLoadStop: (controller, url) async {
        print("onLoadStop $url");
        setState(() {
          this.url = url ?? '';
        });
        if (!isPrinting) {
          this.headlessWebView.webViewController.printCurrentPage();
        }
        isPrinting = !isPrinting;
      },
      onUpdateVisitedHistory: (controller, url, androidIsReload) {
        print("onUpdateVisitedHistory $url");
        setState(() {
          this.url = url ?? '';
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    headlessWebView?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "HeadlessInAppWebView",
        )),
        body: SafeArea(
            child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
                "CURRENT URL\n${(url.length > 50) ? url.substring(0, 50) + "..." : url}"),
          ),
          Center(
            child: RaisedButton(
                onPressed: () async {
                  await headlessWebView?.dispose();
                  await headlessWebView?.run();
                },
                child: Text("HTML2PDF HeadlessInAppWebView")),
          ),
        ])));
  }
}
