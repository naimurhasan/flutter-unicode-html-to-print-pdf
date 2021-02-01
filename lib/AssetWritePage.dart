import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class AssetWritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write in Asset File'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Write in asset file'),
          onPressed: () async {
            final indexHTML = await rootBundle.loadString('assets/index.html');
            print(indexHTML);
          },
        ),
      ),
    );
  }
}
