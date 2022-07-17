import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({Key? key, this.BlogUrl}) : super(key: key);
  final BlogUrl;

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          children: const [
            SizedBox(
              width: 65,
            ),
            Text(
              'Flutter',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              'News',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.BlogUrl,
          onWebViewCreated: (WebViewController webviewController) {
            _completer.complete(webviewController);
          },
        ),
      ),
    );
  }
}
