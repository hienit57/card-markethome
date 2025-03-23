import 'package:card_markethome/index.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class CustomInAppWebView extends StatefulWidget {
  const CustomInAppWebView({super.key, required this.url});

  final String url;

  @override
  State<CustomInAppWebView> createState() => _CustomInAppWebViewState();
}

class _CustomInAppWebViewState extends State<CustomInAppWebView> {
  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
    allowsInlineMediaPlayback: true,
    mediaPlaybackRequiresUserGesture: false,
    javaScriptEnabled: true,
    iframeAllow: "camera; microphone",
    // for camera and microphone permissions
    iframeAllowFullscreen: true,
  );
  late final PlatformWebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PlatformWebViewController(
      AndroidWebViewControllerCreationParams(),
    )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setPlatformNavigationDelegate(
        PlatformNavigationDelegate(
          const PlatformNavigationDelegateCreationParams(),
        )
          ..setOnProgress((int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          })
          ..setOnPageStarted((String url) {
            debugPrint('Page started loading: $url');
          })
          ..setOnPageFinished((String url) {
            // await _changeTextSize(2.0);
          })
          ..setOnUrlChange((UrlChange change) {
            debugPrint('url change to ${change.url}');
          }),
      )
      ..setBackgroundColor(Colors.white)
      ..setOnPlatformPermissionRequest(
        (PlatformWebViewPermissionRequest request) {
          debugPrint(
            'requesting permissions for ${request.types.map((WebViewPermissionResourceType type) => type.name)}',
          );
          request.grant();
        },
      );
  }

  /// Changes the text size by injecting JavaScript
  Future<void> _changeTextSize(double scaleFactor) async {
    final script = """
      document.body.style.transform = 'scale($scaleFactor)';
      document.body.style.transformOrigin = '0 0';
    """;
    await _controller.runJavaScript(script);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: WebUri(widget.url)),
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                initialSettings: settings,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
