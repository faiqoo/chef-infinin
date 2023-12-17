import 'package:flutter/material.dart';

import 'package:chef/constants/constants.dart';
import 'package:chef/theme/theme.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';

class GeneralLabelContainer extends StatelessWidget {
  const GeneralLabelContainer({
    required bool isReadOnly,
    required bool isMandatory,
    required bool hideLabel,
    required String label,
    required Widget child,
    String? helpText,
    Key? key,
  })  : _isMandatory = isMandatory,
        _isReadOnly = isReadOnly,
        _hideLabel = hideLabel,
        _helpText = helpText,
        _label = label,
        _child = child,
        super(key: key);

  final bool _isReadOnly;
  final bool _isMandatory;
  final bool _hideLabel;
  final String _label;
  final String? _helpText;
  final Widget _child;

  static const _padding = 8.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    const spacer = SizedBox(height: 5);

    return Padding(
      padding: const EdgeInsets.all(_padding),
      child: AbsorbPointer(
        absorbing: _isReadOnly,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!_hideLabel)
              _buildLabel(
                appTheme: appTheme,
                context: context,
              ),
            spacer,
            _child,
            spacer,
            if (_helpText != null && _helpText!.isNotEmpty) _buildHelpText(),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel({
    required BuildContext context,
    required IAppThemeData appTheme,
  }) =>
      Padding(
        padding: const EdgeInsets.only(left: _padding),
        child: RichText(
          text: TextSpan(
            text: _label,
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              if (_isMandatory)
                TextSpan(
                  text: Strings.mandatoryIndicator,
                  style: appTheme.typographies
                      .byFontFamily(FontFamily.poppins)
                      .label2
                      .copyWith(color: appTheme.colors.errorBackground),
                ),
            ],
          ),
        ),
      );
  Widget _buildHelpText() => Padding(
        padding: const EdgeInsets.only(left: _padding),
        child: GeneralText(
          _helpText!,
          typography: TypographyFamily.label4,
        ),
      );
}
