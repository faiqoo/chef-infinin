import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';

import 'package:chef/services/services.dart';
import 'package:chef/constants/constants.dart';

import '../../../services/renderer/field_renderer_helpers.dart';

class ParagraphCustomField extends StatelessWidget {
  const ParagraphCustomField({
    required String content,
    required FieldHeightType fieldHeightType,
    required ParagraphSize paragraphSize,
    required Map<String, dynamic> style,
    Key? key,
  })  : _content = content,
        _heightType = fieldHeightType,
        _paragraphSize = paragraphSize,
        _style = style,
        super(key: key);

  final String _content;
  final FieldHeightType _heightType;
  final ParagraphSize _paragraphSize;
  final Map<String, dynamic> _style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _sepecifySize(),
      child: Html(
        data: _content,
      ),
    );
  }

  double? _sepecifySize() {
    switch (_heightType) {
      case FieldHeightType.fixed:
        return double.tryParse(_style[Strings.styleHeightKey] ?? '');
      case FieldHeightType.auto:
        return null;
      case FieldHeightType.basedOnSize:
        if (_paragraphSize == ParagraphSize.medium) {
          return 80.0;
        } else if (_paragraphSize == ParagraphSize.small) {
          return 40.0;
        } else {
          return null;
        }
    }
  }
}
