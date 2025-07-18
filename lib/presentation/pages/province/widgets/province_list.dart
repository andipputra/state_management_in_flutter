import 'package:day_21_state_management/presentation/inherited_widget/province_inherited_widget.dart';
import 'package:flutter/material.dart';

class ProvinceList extends StatelessWidget {
  const ProvinceList({super.key, });


  @override
  Widget build(BuildContext context) {
    final provinceInheritedWidget = ProvinceInheritedWidget.of(context);

    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.all(16),
      itemCount: provinceInheritedWidget.provinceData.length,
      itemBuilder: (context, index) {
        final province = provinceInheritedWidget.provinceData[index];
        return ListTile(
          title: Text(province.name),
          subtitle: Text('ID: ${province.id}'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}
