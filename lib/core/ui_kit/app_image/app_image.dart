import 'package:card_markethome/core/extentions/index.dart';
import 'package:card_markethome/index.dart';
import 'package:flutter_svg/svg.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    this.imageUrl,
    this.assetImage,
    this.height,
    this.width,
    this.errorWidget,
    this.usePlaceHolder,
    this.fit,
    this.quality,
    this.color,
  });

  final String? imageUrl;

  final dynamic assetImage;

  final double? height;
  final double? width;
  final Widget? errorWidget;
  final BoxFit? fit;
  final bool? usePlaceHolder;
  final int? quality;
  final Color? color;

  Widget _buildWidget(BuildContext context) {
    final imagePath =
        AppConfigSingleton.isDev ? assetImage?.path : assetImage?.keyName;

    if (imageUrl?.isValidUrl() ?? false) {
      return CachedNetworkImage(
        key: key ?? ValueKey(imageUrl),
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        imageUrl: imageUrl ?? '',
        maxWidthDiskCache: kSizeImageCache,
        memCacheWidth: kSizeImageCache,
        cacheKey: imageUrl,
        placeholder: (BuildContext context, String url) => const Center(
          child: Icon(Icons.error),
        ),
        errorWidget: (BuildContext context, String url, Object err) {
          CachedNetworkImage.evictFromCache(url, cacheKey: url);
          return SizedBox(
            height: height,
            width: width,
            child: errorWidget ??
                const Center(
                  child: Icon(Icons.error),
                ),
          );
        },
      );
    }

    if (imagePath?.contains('.svg') ?? false) {
      return SvgPicture.asset(
        imagePath ?? '',
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
      );
    }

    return Image.asset(
      imagePath ?? '',
      height: height,
      width: width,
      color: color,
      fit: fit ?? BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        debugPrint('[AppImage] error: $error');
        return errorWidget ??
            const Center(
              child: Icon(Icons.error),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildWidget(context);
  }
}
