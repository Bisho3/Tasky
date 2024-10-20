import 'package:todo/core/util/app_import.dart';
import 'package:todo/tasky_app/presentation/component/home/app_bar/home_app_bar_component.dart';
import 'package:todo/tasky_app/presentation/component/home/floating_bottom/floating_bottom_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: HomeAppBarComponent(),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingBottomComponent(),
      ),
    );
  }
}
