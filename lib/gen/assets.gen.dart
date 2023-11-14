/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arayeshgah-category.svg
  SvgGenImage get arayeshgahCategory =>
      const SvgGenImage('assets/icons/arayeshgah-category.svg');

  /// File path: assets/icons/arrow-left.svg
  SvgGenImage get arrowLeft => const SvgGenImage('assets/icons/arrow-left.svg');

  /// File path: assets/icons/bloom-left.svg
  SvgGenImage get bloomLeft => const SvgGenImage('assets/icons/bloom-left.svg');

  /// File path: assets/icons/bloom-right.svg
  SvgGenImage get bloomRight =>
      const SvgGenImage('assets/icons/bloom-right.svg');

  /// File path: assets/icons/cake-category.svg
  SvgGenImage get cakeCategory =>
      const SvgGenImage('assets/icons/cake-category.svg');

  /// File path: assets/icons/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/icons/calendar.svg');

  /// File path: assets/icons/gol-category.svg
  SvgGenImage get golCategory =>
      const SvgGenImage('assets/icons/gol-category.svg');

  /// File path: assets/icons/google.svg
  SvgGenImage get google => const SvgGenImage('assets/icons/google.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/lebas-category.svg
  SvgGenImage get lebasCategory =>
      const SvgGenImage('assets/icons/lebas-category.svg');

  /// File path: assets/icons/mashin-category.svg
  SvgGenImage get mashinCategory =>
      const SvgGenImage('assets/icons/mashin-category.svg');

  /// File path: assets/icons/photography-category.svg
  SvgGenImage get photographyCategory =>
      const SvgGenImage('assets/icons/photography-category.svg');

  /// File path: assets/icons/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/icons/profile.svg');

  /// File path: assets/icons/services.svg
  SvgGenImage get services => const SvgGenImage('assets/icons/services.svg');

  /// File path: assets/icons/talar-category.svg
  SvgGenImage get talarCategory =>
      const SvgGenImage('assets/icons/talar-category.svg');

  /// File path: assets/icons/tasks.svg
  SvgGenImage get tasks => const SvgGenImage('assets/icons/tasks.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        arayeshgahCategory,
        arrowLeft,
        bloomLeft,
        bloomRight,
        cakeCategory,
        calendar,
        golCategory,
        google,
        home,
        lebasCategory,
        mashinCategory,
        photographyCategory,
        profile,
        services,
        talarCategory,
        tasks
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/images/calendar.svg');

  /// File path: assets/images/gradiant-main.svg
  SvgGenImage get gradiantMain =>
      const SvgGenImage('assets/images/gradiant-main.svg');

  /// File path: assets/images/timeline.svg
  SvgGenImage get timeline => const SvgGenImage('assets/images/timeline.svg');

  /// File path: assets/images/user-profile.svg
  SvgGenImage get userProfile =>
      const SvgGenImage('assets/images/user-profile.svg');

  /// File path: assets/images/wedding-card.svg
  SvgGenImage get weddingCard =>
      const SvgGenImage('assets/images/wedding-card.svg');

  /// File path: assets/images/wedding-planner.svg
  SvgGenImage get weddingPlanner =>
      const SvgGenImage('assets/images/wedding-planner.svg');

  /// File path: assets/images/wewed.svg
  SvgGenImage get wewed => const SvgGenImage('assets/images/wewed.svg');

  /// File path: assets/images/wewed_logo.svg
  SvgGenImage get wewedLogo =>
      const SvgGenImage('assets/images/wewed_logo.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        calendar,
        gradiantMain,
        timeline,
        userProfile,
        weddingCard,
        weddingPlanner,
        wewed,
        wewedLogo
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
