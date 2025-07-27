import 'package:day_21_state_management/presentation/controllers/home_controller/home_controller.dart';
import 'package:day_21_state_management/presentation/pages/province/province_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends GetResponsiveView<HomeController> {
  MyHomePage({super.key, required this.title});
  final String title;

  static const routeName = '/home';

  @override
  HomeController get controller => Get.put(HomeController());

  @override
  Widget? phone() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('This is phone'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('hello_world'.tr),

            const Text('You have pushed the button this many times:'),
            Obx(() => Text('${controller.counter.value}')),
            SizedBox(height: 16),
            Obx(
              () => controller.counterString.value.isNotEmpty
                  ? Text(controller.counterString.value)
                  : SizedBox(),
            ),
            SizedBox(height: 48),
            ElevatedButton(
              onPressed: () => Get.toNamed(
                ProvincePage.routeName,
                arguments: <String, dynamic>{
                  'title': 'Halaman Province Yang Baru',
                },
              ),
              child: const Text('Redirect to province page'),
            ),
            ElevatedButton(
              onPressed: () async {
                final dataDialog = await Get.defaultDialog(
                  confirm: TextButton(
                    onPressed: () {
                      Get.back(result: 'Ada Data nih');
                    },
                    child: Text('Kembali Dengan Data'),
                  ),
                  cancel: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Kembali'),
                  ),
                  title: 'Title Dialog',
                  middleText: 'ini middle text',
                );

                if (dataDialog != null) {
                  Get.snackbar(
                    'Data dari dialog',
                    dataDialog,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Text('show dialog'),
            ),
            FilledButton(
              onPressed: () {
                Get.bottomSheet(
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.back(result: 'Ada Data nih');
                          },
                          child: Text('Kembali Dengan Data'),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Kembali'),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                );
              },
              child: Text('Show Bottomsheet'),
            ),
            // OutlinedButton(onPressed: () {}, child: Text('Show Snackbar')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  Widget? tablet() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('This is tablet'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Obx(() => Text('${controller.counter.value}')),
            SizedBox(height: 16),
            Obx(
              () => controller.counterString.value.isNotEmpty
                  ? Text(controller.counterString.value)
                  : SizedBox(),
            ),
            SizedBox(height: 48),
            ElevatedButton(
              onPressed: () => Get.toNamed(
                ProvincePage.routeName,
                arguments: <String, dynamic>{
                  'title': 'Halaman Province Yang Baru',
                },
              ),
              child: const Text('Redirect to province page'),
            ),
            ElevatedButton(
              onPressed: () async {
                final dataDialog = await Get.defaultDialog(
                  confirm: TextButton(
                    onPressed: () {
                      Get.back(result: 'Ada Data nih');
                    },
                    child: Text('Kembali Dengan Data'),
                  ),
                  cancel: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Kembali'),
                  ),
                  title: 'Title Dialog',
                  middleText: 'ini middle text',
                );

                if (dataDialog != null) {
                  Get.snackbar(
                    'Data dari dialog',
                    dataDialog,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Text('show dialog'),
            ),
            FilledButton(
              onPressed: () {
                Get.bottomSheet(
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.back(result: 'Ada Data nih');
                          },
                          child: Text('Kembali Dengan Data'),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Kembali'),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                );
              },
              child: Text('Show Bottomsheet'),
            ),
            // OutlinedButton(onPressed: () {}, child: Text('Show Snackbar')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {

  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       title: Text(title),
  //       automaticallyImplyLeading: false,
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           const Text('You have pushed the button this many times:'),
  //           Obx(
  //             () => Text(
  //               '${controller.counter.value}',
  //               style: Theme.of(context).textTheme.headlineMedium,
  //             ),
  //           ),
  //           SizedBox(height: 16),
  //           Obx(
  //             () => controller.counterString.value.isNotEmpty
  //                 ? Text(controller.counterString.value)
  //                 : SizedBox(),
  //           ),
  //           SizedBox(height: 48),
  //           ElevatedButton(
  //             onPressed: () => Get.toNamed(
  //               ProvincePage.routeName,
  //               arguments: <String, dynamic>{
  //                 'title': 'Halaman Province Yang Baru',
  //               },
  //             ),
  //             child: const Text('Redirect to province page'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () async {
  //               final dataDialog = await Get.defaultDialog(
  //                 confirm: TextButton(
  //                   onPressed: () {
  //                     Get.back(result: 'Ada Data nih');
  //                   },
  //                   child: Text('Kembali Dengan Data'),
  //                 ),
  //                 cancel: TextButton(
  //                   onPressed: () {
  //                     Get.back();
  //                   },
  //                   child: Text('Kembali'),
  //                 ),
  //                 title: 'Title Dialog',
  //                 middleText: 'ini middle text',
  //               );

  //               if (dataDialog != null) {
  //                 Get.snackbar(
  //                   'Data dari dialog',
  //                   dataDialog,
  //                   snackPosition: SnackPosition.BOTTOM,
  //                 );
  //               }
  //             },
  //             child: Text('show dialog'),
  //           ),
  //           FilledButton(
  //             onPressed: () {
  //               Get.bottomSheet(
  //                 SizedBox(
  //                   width: double.infinity,
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       TextButton(
  //                         onPressed: () {
  //                           Get.back(result: 'Ada Data nih');
  //                         },
  //                         child: Text('Kembali Dengan Data'),
  //                       ),
  //                       TextButton(
  //                         onPressed: () {
  //                           Get.back();
  //                         },
  //                         child: Text('Kembali'),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 backgroundColor: Colors.white,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.vertical(
  //                     top: Radius.circular(16),
  //                   ),
  //                 ),
  //               );
  //             },
  //             child: Text('Show Bottomsheet'),
  //           ),
  //           // OutlinedButton(onPressed: () {}, child: Text('Show Snackbar')),
  //         ],
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: controller.increment,
  //       tooltip: 'Increment',
  //       child: const Icon(Icons.add),
  //     ),
  //   );
  // }
}
