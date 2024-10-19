import 'package:todo/core/util/app_import.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> listItems;
  final FormFieldValidator validator;
  final Function onChange;
  final String? initialValue;
  final String descriptionDropDown;
  final String textHint;
  const CustomDropDown({
    super.key,
    required this.listItems,
    required this.validator,
    required this.onChange,
    this.initialValue,
    required this.descriptionDropDown, required this.textHint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          descriptionDropDown,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        verticalSpace(AppDouble.three),
        DropdownButtonFormField(
          isExpanded: true,
          value: initialValue,
          hint: Text(
            textHint.toString(),
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          dropdownColor: Theme.of(context).scaffoldBackgroundColor,
          validator: validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 1.sw > 600 ? 0.03.sw : 0.05.sw,
              vertical: 1.sw > 600 ? 0.025.sh : 0.013.sh,
            ),
          ),
          items: listItems
              .toSet()
              .map(
                (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e.toString(),
                  style: Theme.of(context).textTheme.labelSmall),
            ),
          )
              .toList(),
          icon: Icon(
            Icons.expand_more_outlined,
            color: Theme.of(context).primaryColor,
            size: AppDouble.fifteen.w,
          ),
          style: Theme.of(context).textTheme.bodySmall,
          onChanged: (e) {
            onChange(e);
          },
        ),
      ],
    );
  }
}
