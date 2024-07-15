import 'package:flutter/material.dart';

/// Figma tasarım ölçüleri (iPhone 12 Pro Max örneği)
const num FIGMA_DESIGN_WIDTH = 375; /// Figma'da kullanılan tasarım genişliği
const num FIGMA_DESIGN_HEIGHT = 812; /// Figma'da kullanılan tasarım yüksekliği
const num FIGMA_DESIGN_STATUS_BAR = 0; /// Figma'da kullanılan durum çubuğu yüksekliği

/// Num tipine genişletme: UI elemanlarının boyutlandırılması ve uyarlama işlemleri için
extension ResponsiveExtension on num {
  double get width => SizeUtils.width;
  double get height => SizeUtils.height;

  /// Yatay yönde boyutlandırma
  double get h => ((this * width) / FIGMA_DESIGN_WIDTH);

  /// Dikey yönde boyutlandırma (durum çubuğu göz ardı ediliyor)
  double get v => ((this * height) / (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR));

  /// Adaptif boyutlandırma için kullanılan genel boyut
  double get adaptSize {
    var heightValue = v;
    var widthValue = h;
    return heightValue > widthValue ? heightValue.toDoubleValue() : widthValue.toDoubleValue();
  }

  /// Font büyüklüğü için adaptif boyutlandırma
  double get fSize => adaptSize;
}

/// Num tipine genişletme: Sayıları belirli bir sayıda ondalık hanelere göre biçimlendirme
extension FormatExtension on num {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }

  /// Sayının sıfırdan büyük olup olmadığını kontrol eden genişletme
  double isNonZero({num defaultValue = 0}) {
    return this > 0 ? toDouble() : defaultValue.toDouble();
  }
}

/// Cihaz türleri için numaralandırma
enum DeviceType { mobile, tablet, desktop }

/// ResponsiveBuild tipine dönüşüm: UI yapılarını oluşturan fonksiyonlar için
typedef ResponsiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType);

/// Sizer: UI yapılarını boyutlandıran ve oluşturan bileşen
class Sizer extends StatelessWidget {
  const Sizer({super.key, required this.builder});

  /// UI yapısını oluşturan fonksiyon
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}

/// SizeUtils: Ekran boyutlarını yöneten yardımcı sınıf
class SizeUtils {
  static late BoxConstraints boxConstraints; /// Cihaz sınırlamaları
  static late Orientation orientation; /// Cihazın yönelimi
  static late DeviceType deviceType; /// Cihazın türü (mobil, tablet vs.)

  static late double height; /// Cihazın yüksekliği
  static late double width; /// Cihazın genişliği

  /// Ekran boyutlarını ayarlayan fonksiyon
  static void setScreenSize(
      BoxConstraints constraints, Orientation currentOrientation) {
    boxConstraints = constraints;
    orientation = currentOrientation;
    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = boxConstraints.maxHeight.isNonZero();
    } else {
      width = boxConstraints.maxHeight.isNonZero();
      height = boxConstraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
    }
    deviceType = DeviceType.mobile; /// Şu an sadece mobil cihazlar destekleniyor
  }
}
