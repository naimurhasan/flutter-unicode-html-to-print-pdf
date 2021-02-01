import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebViewAsset extends StatefulWidget {
  @override
  _InAppWebViewAssetState createState() => _InAppWebViewAssetState();
}

class _InAppWebViewAssetState extends State<InAppWebViewAsset> {
  InAppWebViewController webView;
  String url = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InAppWebView Asset Previw'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: InAppWebView(
              initialFile: "assets/index.html",
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
              onLoadStop:
                  (InAppWebViewController controller, String url) async {
                setState(() {
                  this.url = url;
                  this.webView.printCurrentPage();
                });
              },
              // initialData: InAppWebViewInitialData(
              //     data:
              //         "<!DOCTYPE html><html><head></head><body>যুক্ত বর্ণ পরীক্ষা</body></html>"),
            ),
          ))
        ],
      ),
    );
  }
}
