import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:chef/constants/constants.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';
import 'package:chef/services/navigation/navigation_service.dart';
import 'package:chef/setup.dart';

abstract class DialogHelper {
  static void show<T>({
    required BuildContext context,
    String? title,
    String? barrierLabel,
    List<DialogAction>? actions,
    Widget? body,
    Widget? header,
    Widget? image,
    double? maxHeight,
    double? width,
    bool isDismissible = true,
    bool? isEnable,
    Alignment? alignment,
    bool Function()? canDismiss,
    GeneralComponentStyle dialogType = GeneralComponentStyle.primary,
    BuildContext? dcontext,
  }) {
    assert(
      !isDismissible || barrierLabel != null,
      'barrierLabel must be provided when dialog is dismissible',
    );
    showGeneralDialog(
      context: context,
      barrierDismissible: isDismissible,
      barrierLabel: barrierLabel,
      pageBuilder: (context, _, __) {
        return WillPopScope(
          onWillPop: () {
            if (canDismiss != null) {
              return Future.value(canDismiss.call());
            } else {
              return Future.value(true);
            }
          },
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: ExtoDialog(
              header: header,
              title: title,
              body: body,
              actions: actions,
              image: image,
              maxHeight: maxHeight,
              width: width,
              isEnable: isEnable ?? true,
              alignment: alignment ?? Alignment.center,
              dialogStyle: dialogType,
            ),
          ),
        );
      },
    );
  }

  static Future<dynamic> confirmationDialog({
    required BuildContext context,
    void Function()? onConfirm,
    void Function()? onDeny,
    String? confirmationMessage,
  }) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const GeneralText(Strings.confirmationTitle),
        content: GeneralText(confirmationMessage ?? Strings.confirmMessage),
        actions: <Widget>[
          GeneralButton.button(
            title: Strings.no,
            height: 40,
            styleType: ButtonStyleType.outline,
            onTap: onDeny ?? locateService<INavigationService>().pop,
          ),
          GeneralButton.button(
            title: Strings.yes,
            height: 40,
            onTap: onConfirm,
          ),
        ],
      ),
    );
  }

  static Future<dynamic> showBottomSheetDialog({
    required BuildContext context,
    required Widget body,
    double borderRadius = 16.0,
  }) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      builder: (_) => body,
    );
  }

  static Future<dynamic> showDate(
    BuildContext context,
    DateTime _initialDate,
    DateTime _firstDate,
    DateTime _lastDate,
  ) {
    return showDatePicker(
      context: context,
      initialDate: _initialDate,
      firstDate: _firstDate,
      lastDate: _lastDate,
    );
  }
}
