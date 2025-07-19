import 'package:day_21_state_management/presentation/inherited_widget/province_inherited_widget.dart';
import 'package:flutter/material.dart';

class ProvinceCount extends StatelessWidget {
  const ProvinceCount({super.key});

  @override
  Widget build(BuildContext context) {
    final provinceInheritedWidget = ProvinceInheritedWidget.of(context);
    
    return Text('Province count is ${provinceInheritedWidget.provinceData.length}',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}