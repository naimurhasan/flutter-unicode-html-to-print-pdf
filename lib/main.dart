import 'package:flutter/material.dart';
import 'package:html_to_pdf/AssetWritePage.dart';
import 'package:html_to_pdf/FlutterBasicExample.dart';
import 'package:html_to_pdf/InAppBrowserMethod.dart';
import 'package:html_to_pdf/InAppHeadlessWebViewFromAsset.dart';
import 'package:html_to_pdf/InAppHeadlessWebViewFromData.dart';
import 'package:html_to_pdf/InAppWebViewFromAsset.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter HTML to PDF Test'),
        ),
        body: MyListView(),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        RaisedButton(
          child: Text('Flutter First Example'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => FlutterBasicExample()));
          },
        ),
        RaisedButton(
          child: Text('Flutter InAppBrowserExample'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => InAppBrowserMethod()));
          },
        ),
        RaisedButton(
          child: Text('InAppWebView from Asset'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => InAppWebViewAsset()));
          },
        ),
        RaisedButton(
          child: Text('InApp Headless Webview'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => InAppHeadlessWebViewAsset()));
          },
        ),
        RaisedButton(
          child: Text('Asset Write Page'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => AssetWritePage()));
          },
        ),
        RaisedButton(
          child: Text('Hidden Webview from data.'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => InAppHeadlessWebViewData()));
          },
        )
      ],
    );
  }
}
