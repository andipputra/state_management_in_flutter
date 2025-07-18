import 'package:day_21_state_management/data/model/province_response.dart';
import 'package:flutter/material.dart';

class ProvinceInheritedWidget extends InheritedWidget {
  final List<ProvinceResponse> provinceData;
  final bool isLoading;

  const ProvinceInheritedWidget({
    super.key,
    required super.child,
    required this.provinceData,
    required this.isLoading,
  });

  static ProvinceInheritedWidget of(BuildContext context) {
    final ProvinceInheritedWidget? result = context
        .dependOnInheritedWidgetOfExactType<ProvinceInheritedWidget>();
    assert(result != null, 'No ProvinceInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProvinceInheritedWidget oldWidget) {
    return provinceData != oldWidget.provinceData ||
        isLoading != oldWidget.isLoading;
  }
}
