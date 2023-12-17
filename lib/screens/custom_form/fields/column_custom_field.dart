import 'package:flutter/material.dart';

import 'package:chef/helpers/enum_helper.dart';
import 'package:chef/theme/theme.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';
import 'package:chef/models/models.dart';
import 'package:chef/services/services.dart';

enum ColumnType {
  single,
  twoColumn,
  threeColumn,
  section,
}

enum AlignmentType {
  top,
  center,
  bottom,
  distribute,
}

class ColumnCustomField extends StatelessWidget {
  ColumnCustomField({
    required String id,
    required List<Fields> children,
    required IRendererService rendererService,
    required ColumnType columnType,
    required FieldOnChange onChange,
    String? layoutFlex,
    List<FieldAlignment>? alignments,
    MainAxisAlignment alignment = MainAxisAlignment.start,
    bool isHidden = false,
    String? title,
    String? shortDescription,
    String? recordId,
    Key? key,
  })  : _id = id,
        _children = children,
        _alignment = alignment,
        _columnType = columnType,
        _rendererService = rendererService,
        _onChange = onChange,
        _layoutFlex = layoutFlex,
        _alignments = alignments,
        _shortDescription = shortDescription,
        _isHidden = isHidden,
        _title = title,
        _recordId = recordId,
        super(key: key) {
    if ((columnType == ColumnType.twoColumn ||
            columnType == ColumnType.threeColumn) &&
        (alignments == null || layoutFlex == null)) {
      throw Exception(
        'In ${EnumHelpers.humanize(columnType)} alignments and layoutFlex must be provided',
      );
    }
  }

  factory ColumnCustomField.single({
    required String id,
    required List<Fields> children,
    required IRendererService rendererService,
    required FieldOnChange onChange,
    String? recordId,
    Key? key,
  }) {
    return ColumnCustomField(
      id: id,
      children: children,
      rendererService: rendererService,
      columnType: ColumnType.single,
      onChange: onChange,
      recordId: recordId,
      key: key,
    );
  }

  factory ColumnCustomField.twoColumn({
    required String id,
    required List<Fields> children,
    required IRendererService rendererService,
    required String layoutFlex,
    required List<FieldAlignment> alignments,
    required FieldOnChange onChange,
    String? recordId,
    Key? key,
  }) {
    return ColumnCustomField(
      id: id,
      children: children,
      rendererService: rendererService,
      columnType: ColumnType.twoColumn,
      layoutFlex: layoutFlex,
      alignments: alignments,
      onChange: onChange,
      recordId: recordId,
      key: key,
    );
  }

  factory ColumnCustomField.threeColumn({
    required String id,
    required List<Fields> children,
    required IRendererService rendererService,
    required String layoutFlex,
    required List<FieldAlignment> alignments,
    required FieldOnChange onChange,
    String? recordId,
    Key? key,
  }) {
    return ColumnCustomField(
      id: id,
      children: children,
      rendererService: rendererService,
      columnType: ColumnType.threeColumn,
      layoutFlex: layoutFlex,
      alignments: alignments,
      onChange: onChange,
      recordId: recordId,
      key: key,
    );
  }

  factory ColumnCustomField.section({
    required String id,
    required List<Fields> children,
    required IRendererService rendererService,
    required FieldOnChange onChange,
    bool isHidden = false,
    String? title,
    String? shortDescription,
    String? recordId,
    Key? key,
  }) {
    return ColumnCustomField(
      id: id,
      children: children,
      rendererService: rendererService,
      columnType: ColumnType.section,
      isHidden: isHidden,
      title: title,
      shortDescription: shortDescription,
      onChange: onChange,
      recordId: recordId,
      key: key,
    );
  }

  final List<Fields> _children;
  final MainAxisAlignment _alignment;
  final IRendererService _rendererService;
  final ColumnType _columnType;
  final String _id;
  final String? _title;
  final String? _shortDescription;
  final bool _isHidden;
  final List<FieldAlignment>? _alignments;
  final String? _layoutFlex;
  final String? _recordId;
  final FieldOnChange _onChange;
  static const _layoutSplitter = '--';
  static const _defaultFlex = 1;

  @override
  Widget build(BuildContext context) {
    return _buildChildren(
      fields: _children,
    );
  }

  Widget _buildChildren({
    required List<Fields> fields,
  }) {
    final widgetTree = _buildWidgetTree(fields);

    switch (_columnType) {
      case ColumnType.single:
        return _buildOneColumn(
          widgetTree: widgetTree,
          alignment: _alignment,
        );
      case ColumnType.twoColumn:
      case ColumnType.threeColumn:
        return _buildTwoThreeColumn();
      case ColumnType.section:
        return _buildSection();
      default:
        return _buildOneColumn(
          widgetTree: widgetTree,
          alignment: _alignment,
        );
    }
  }

  List<Widget> _buildWidgetTree(List<Fields> fields) {
    const spacer = SizedBox(height: 5);
    final widgetTree = <Widget>[];

    for (var field in fields) {
      widgetTree.add(
        _rendererService.build(
          fieldData: field,
          recordId: _recordId,
          onValueChange: _onChange,
          fieldValues: field.properties != null
              ? _rendererService.fieldInputData[field.properties!.name]
              : null,
        ),
      );
      widgetTree.add(spacer);
    }
    return widgetTree;
  }

  Widget _buildOneColumn({
    required List<Widget> widgetTree,
    required MainAxisAlignment alignment,
  }) =>
      Column(
        mainAxisAlignment: alignment,
        children: [...widgetTree],
      );

  Widget _buildTwoThreeColumn() => IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildColumn(0),
            _buildColumn(1),
            if (_columnType == ColumnType.threeColumn) _buildColumn(2),
          ],
        ),
      );

  Widget _buildColumn(index) => Expanded(
        flex: _specifyFlex(_layoutFlex!, index) ?? _defaultFlex,
        child: _buildOneColumn(
          widgetTree: _buildWidgetTree(
            _children[index].children!,
          ),
          alignment: _checkAlignment(index)
              ? _specifyAlignment(_alignments![index].vertz)
              : MainAxisAlignment.start,
        ),
      );

  bool _checkAlignment(int index) =>
      _alignments != null &&
      _alignments!.isNotEmpty &&
      _alignments![index].vertz.isNotEmpty;

  MainAxisAlignment _specifyAlignment(String alignment) {
    if (alignment == EnumHelpers.humanize(AlignmentType.bottom)) {
      return MainAxisAlignment.end;
    } else if (alignment == EnumHelpers.humanize(AlignmentType.top)) {
      return MainAxisAlignment.start;
    } else if (alignment == EnumHelpers.humanize(AlignmentType.center)) {
      return MainAxisAlignment.center;
    } else {
      return MainAxisAlignment.spaceBetween;
    }
  }

  int? _specifyFlex(String flex, int index) => index == 0
      ? int.tryParse(flex.split(_layoutSplitter).first)
      : int.tryParse(flex.split(_layoutSplitter).last);

  Widget _buildSection() {
    const spacer = SizedBox(height: 10);
    const _padding = 8.0;
    return Visibility(
      key: Key(_id),
      visible: !_isHidden,
      child: Padding(
        padding: const EdgeInsets.all(_padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GeneralText(
              _title ?? '',
              typography: TypographyFamily.headline4,
            ),
            GeneralText(
              _shortDescription ?? '',
              typography: TypographyFamily.label4,
            ),
            spacer,
            _buildOneColumn(
              widgetTree: _buildWidgetTree(
                _children.isNotEmpty ? _children : <Fields>[],
              ),
              alignment: _alignment,
            ),
          ],
        ),
      ),
    );
  }
}
