import 'package:todo/core/util/app_import.dart';

class ScanTaskScreen extends StatefulWidget {
  const ScanTaskScreen({super.key});

  @override
  State<ScanTaskScreen> createState() => _ScanTaskScreenState();
}

class _ScanTaskScreenState extends State<ScanTaskScreen> {
  final MobileScannerController controller = MobileScannerController();
  bool isApiCalled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        leading: CustomBack(),
        textTitle: AppStrings.scanTask,
      ),
      body: MobileScanner(
        controller: controller,
        fit: BoxFit.cover,
        onDetect: (BarcodeCapture barcodeCapture) {
          if (!isApiCalled && barcodeCapture.barcodes.isNotEmpty) {
            isApiCalled = true;
            final barcode = barcodeCapture.barcodes.first;
            if (barcode.rawValue != null) {
              context
                  .pushNamed(routeName: Routes.taskDetailsScreen, arguments: {
                KeyRouter.taskIdInTaskDetailsScreen: barcode.rawValue!,
                KeyRouter.contextInTaskDetailsScreen: context
              });
            }
          }
        },
      ),
    );
  }
}
