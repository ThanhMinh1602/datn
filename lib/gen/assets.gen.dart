/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/car.png
  AssetGenImage get car => const AssetGenImage('assets/images/car.png');

  /// File path: assets/images/distance.jpg
  AssetGenImage get distance =>
      const AssetGenImage('assets/images/distance.jpg');

  /// File path: assets/images/engine_coolant.png
  AssetGenImage get engineCoolant =>
      const AssetGenImage('assets/images/engine_coolant.png');

  /// File path: assets/images/engine_speed_warning.jpg
  AssetGenImage get engineSpeedWarning =>
      const AssetGenImage('assets/images/engine_speed_warning.jpg');

  /// File path: assets/images/fuel_level.jpg
  AssetGenImage get fuelLevel =>
      const AssetGenImage('assets/images/fuel_level.jpg');

  /// File path: assets/images/gas_station.png
  AssetGenImage get gasStation =>
      const AssetGenImage('assets/images/gas_station.png');

  /// File path: assets/images/logo_app.png
  AssetGenImage get logoApp =>
      const AssetGenImage('assets/images/logo_app.png');

  /// File path: assets/images/logo_login.png
  AssetGenImage get logoLogin =>
      const AssetGenImage('assets/images/logo_login.png');

  /// File path: assets/images/tempurature_warning.jpg
  AssetGenImage get tempuratureWarning =>
      const AssetGenImage('assets/images/tempurature_warning.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        car,
        distance,
        engineCoolant,
        engineSpeedWarning,
        fuelLevel,
        gasStation,
        logoApp,
        logoLogin,
        tempuratureWarning
      ];
}

class Assets {
  Assets._();

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
