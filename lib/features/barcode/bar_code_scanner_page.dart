import 'package:card_markethome/index.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:qr_code_dart_scan/qr_code_dart_scan.dart' as qr_code_dart_scan;

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen>
    with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController(
    autoStart: false,
    useNewCameraSelector: true,
  );

  StreamSubscription<Object?>? _subscription;

  void _handleBarcode(BarcodeCapture barcodes) async {
    if (mounted &&
        (await Navigation.getCurrentRoute() ==
            NavigationRouter.barCodeScanner.path)) {
      Navigation.pop(context, result: barcodes.barcodes.first.displayValue);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _subscription = controller.barcodes.listen(_handleBarcode);

    unawaited(controller.start());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!controller.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        _subscription = controller.barcodes.listen(_handleBarcode);

        unawaited(controller.start());
      case AppLifecycleState.inactive:
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(controller.stop());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black.withOpacity(0.2),
      body: Stack(
        children: [
          _buildQRWrapper(),
          Container(
            width: context.maxWidth,
            height: context.maxHeight,
            color: AppColors.black.withOpacity(0.2),
          ),
          // Center(
          //   child: Container(
          //     height: 203,
          //     width: 203,
          //     decoration: BoxDecoration(
          //       // Thêm dòng này để làm container trong suốt

          //       borderRadius: BorderRadius.circular(20),
          //       border: Border.all(
          //         color: AppColors.textAccent,
          //         width: 6,
          //       ),
          //     ),
          //   ),
          // ),
          Positioned(
            top: kToolbarHeight,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigation.pop(context);
                    },
                    child: const AppImage(
                      assetImage: Assets.lib_assets_icons_ic_close,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Text(
                    'Quét mã QR',
                    style: context.text.titleLarge?.copyWith(
                      color: AppColors.white,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(width: 20),
                  // IconButton(
                  //   onPressed: () async {
                  //     final imagePicker = ImagePicker();

                  //     final XFile? image = await imagePicker.pickImage(
                  //         source: ImageSource.gallery);

                  //     if (image != null) {
                  //       final decoder = qr_code_dart_scan.QRCodeDartScanDecoder(
                  //           formats: [
                  //             qr_code_dart_scan.BarcodeFormat.qrCode,
                  //             qr_code_dart_scan.BarcodeFormat.code128
                  //           ]);
                  //       final qr_code_dart_scan.Result? result =
                  //           await decoder.decodeFile(image);

                  //       print('resqr_code_dart_scanult: ${result>=.text}');

                  //       if (result != null) {
                  //         Navigation.pop(context, result: result.text);
                  //       }
                  //     }
                  //     showToastMessage(
                  //       'Mã QR không hợp lệ',
                  //       ToastMessageType.error,
                  //     );
                  //   },
                  //   icon: const Icon(Icons.photo),
                  // ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: GestureDetector(
                onTap: () {
                  controller.toggleTorch();
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.color8A8A8A.withOpacity(0.39),
                  ),
                  child: const Center(
                    child: AppImage(
                      assetImage: Assets.lib_assets_icons_ic_flash_light,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    _subscription = null;
    super.dispose();
    await controller.dispose();
  }

  Widget _buildQRWrapper() {
    return MobileScanner(
      controller: controller,
      errorBuilder: (BuildContext p0, MobileScannerException p1, Widget? p2) {
        Future.delayed(
          const Duration(milliseconds: 300),
          () {
            controller.stop();
            controller.start();
          },
        );

        final errorMsg =
            p1.errorDetails?.message ?? 'Có lỗi xảy ra, vui lòng thử lại ';

        return Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Text(
                    'Lỗi: $errorMsg',
                    style: context.text.titleMedium!.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                CustomSolidButton(
                  title: 'Đồng ý',
                  onTap: () {
                    Navigation.pop(context);
                  },
                  disabled: false,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
        );
      },
      onDetect: (BarcodeCapture capture) {
        final List<Barcode> barcodes = capture.barcodes;

        for (final Barcode barcode in barcodes) {
          debugPrint('Barcode found! ${barcode.rawValue}');
          final String value = barcode.rawValue ?? '';
          //_handleListener(value);
        }
      },
      overlayBuilder: (context, constraints) =>
          QRScannerOverlay(overlayColour: AppColors.black.withOpacity(0.5)),
    );
  }
}

class ScannerErrorWidget extends StatelessWidget {
  const ScannerErrorWidget({super.key, required this.error});

  final MobileScannerException error;

  @override
  Widget build(BuildContext context) {
    String errorMessage;

    switch (error.errorCode) {
      case MobileScannerErrorCode.controllerUninitialized:
        errorMessage = 'Controller not ready.';
      case MobileScannerErrorCode.permissionDenied:
        errorMessage = 'Permission denied';
      case MobileScannerErrorCode.unsupported:
        errorMessage = 'Scanning is unsupported on this device';
      default:
        errorMessage = 'Generic Error';
    }

    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Icon(Icons.error, color: Colors.white),
            ),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              error.errorDetails?.message ?? '',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class QRScannerOverlay extends StatelessWidget {
  const QRScannerOverlay({super.key, required this.overlayColour});

  final Color overlayColour;

  @override
  Widget build(BuildContext context) {
    // Kích thước cố định cho vùng quét
    const double scanArea = 250;

    return Stack(children: [
      ColorFiltered(
        colorFilter: ColorFilter.mode(overlayColour, BlendMode.srcOut),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black, backgroundBlendMode: BlendMode.dstOut),
            ),
            Align(
              child: Container(
                height: scanArea,
                width: scanArea,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
      // Viền xanh dương
      Align(
        child: Container(
          height: scanArea,
          width: scanArea,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.blue,
              width: 6,
            ),
          ),
        ),
      ),
    ]);
  }
}

// Creates the white borders
class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const width = 4.0;
    const radius = 20.0;
    const tRadius = 3 * radius;
    final rect = Rect.fromLTWH(
      width,
      width,
      size.width - 2 * width,
      size.height - 2 * width,
    );
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(radius));
    final clippingRect0 = Rect.fromLTWH(
      0,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect1 = Rect.fromLTWH(
      size.width - tRadius,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect2 = Rect.fromLTWH(
      0,
      size.height - tRadius,
      tRadius,
      tRadius,
    );
    final clippingRect3 = Rect.fromLTWH(
      size.width - tRadius,
      size.height - tRadius,
      tRadius,
      tRadius,
    );

    final path = Path()
      ..addRect(clippingRect0)
      ..addRect(clippingRect1)
      ..addRect(clippingRect2)
      ..addRect(clippingRect3);

    canvas.clipPath(path);
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = AppColors.textAccent
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BarReaderSize {
  static double width = 200;
  static double height = 200;
}

class OverlayWithHolePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black54;
    canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
          Path()
            ..addOval(Rect.fromCircle(
                center: Offset(size.width - 44, size.height - 44), radius: 40))
            ..close(),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

@override
bool shouldRepaint(CustomPainter oldDelegate) {
  return false;
}
