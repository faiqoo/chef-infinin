import 'package:flutter/material.dart';

import 'package:chef/constants/strings.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';
import 'package:chef/theme/app_theme_widget.dart';

Future<T?> showTextDialog<T>(
  BuildContext context, {
  required String title,
  required String value,
  dynamic inputType,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => TextDialogWidget(
        title: title,
        value: value,
        inputType: inputType,
      ),
    );

class TextDialogWidget extends StatefulWidget {
  const TextDialogWidget({
    required this.title,
    required this.value,
    this.inputType,
    Key? key,
  }) : super(key: key);
  final String title;
  final String value;
  final dynamic inputType;

  @override
  _TextDialogWidgetState createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<TextDialogWidget> {
  late TextController controller;

  @override
  void initState() {
    super.initState();
    controller = TextController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return AlertDialog(
      title: GeneralText(widget.title),
      content: GeneralTextInput(
        controller: controller,
        inputType:
            widget.inputType != null ? (widget.inputType)! : InputType.text,
        valueStyle: appTheme.typographies.interFontFamily.body2M,
        hintStyle: appTheme.typographies.interFontFamily.body2R,
        inputBorder: appTheme.focusedBorder,
      ),
      actions: [
        GeneralButton(
          title: Strings.workflowDoneText,
          onTap: () => Navigator.of(context).pop(controller.text),
          isEnable: true,
          isBusy: false,
          buttonType: ButtonType.button,
        ),
      ],
    );
  }
}
