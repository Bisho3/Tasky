import 'package:flutter/cupertino.dart';
import 'package:todo/core/util/app_import.dart';

Future showTakeImgOptions({
  required BuildContext context,
}) async {
  showCupertinoModalPopup(
    context: context,
    builder: (_) {
      return BlocProvider.value(
        value: context.read<TaskyCubit>(),
        child: BlocBuilder<TaskyCubit, TaskyState>(
          builder: (context, state) {
            return CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                  child: const Text(AppStrings.photoGallery),
                  onPressed: () {
                    context.pop();
                    context.read<TaskyCubit>().pickImage(isCamera: false);
                  },
                ),
                CupertinoActionSheetAction(
                  child: const Text(AppStrings.camera),
                  onPressed: () {
                    context.pop();
                    context.read<TaskyCubit>().pickImage(isCamera: true);
                  },
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
