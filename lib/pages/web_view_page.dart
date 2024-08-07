import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  const WebViewPage({
    super.key,
    required this.url,
  });

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final WebViewController webViewController = WebViewController();
  bool isLoading = true;
  double progress = 0;
  String pageTitle = '';
  @override
  void initState() {
    webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController.setBackgroundColor(Colors.white);
    webViewController.loadRequest(Uri.parse(widget.url));
    webViewController.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (progress) {
          setState(() {
            this.progress = progress / 100;
          });
        },
        onPageStarted: (url) {
          setState(() {
            pageTitle = 'Loading...';
          });
        },
        onPageFinished: (url) {
          setState(() {
            pageTitle = url;
            progress = 0;
          });
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close_rounded,
            color: Colors.amber,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            if (progress > 0 && progress < 1)
              LinearProgressIndicator(
                value: progress,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.amber,
                ),
                color: Colors.amber,
                backgroundColor: Colors.amber.withOpacity(.4),
              ),
            Expanded(
              child: WebViewWidget(
                controller: webViewController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
