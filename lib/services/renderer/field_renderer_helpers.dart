import 'package:flutter/material.dart';

import 'package:chef/constants/constants.dart';
import 'package:chef/helpers/enum_helper.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';

enum FieldType {
  text,
  number,
  date,
  paragraph,
  checkbox,
  radioButton,
  select,
  section,
  column,
  twoColumn,
  threeColumn,
  checkList,
  table,
  externalField,
  autoComplete,
}

enum ParagraphSize {
  auto,
  small,
  medium,
}

enum FieldHeightType {
  auto,
  fixed,
  basedOnSize,
}

enum FieldDirectionType {
  horizontal,
  vertical,
}

enum FieldOrientation {
  horizontal,
  vertical,
}

enum ControlAffinity {
  leading,
  trailing,
}

abstract class FieldRendererHelpers {
  static FieldType specifyFieldType(String type) {
    const _sectionLayout = 'SECTION_LAYOUT';
    const _twoColumnLayout = 'TWO_COL_LAYOUT';
    const _threeColumnLayout = 'THREE_COL_LAYOUT';
    const _externalField = 'EXT_FIELD';
    const _autoComplete = 'AUTO_COMPLETE';

    if (type == EnumHelpers.humanize(FieldType.text)) {
      return FieldType.text;
    } else if (type == EnumHelpers.humanize(FieldType.date)) {
      return FieldType.date;
    } else if (type == EnumHelpers.humanize(FieldType.number)) {
      return FieldType.number;
    } else if (type == EnumHelpers.humanize(FieldType.paragraph)) {
      return FieldType.paragraph;
    } else if (type == EnumHelpers.humanize(FieldType.column)) {
      return FieldType.column;
    } else if (type == _twoColumnLayout) {
      return FieldType.twoColumn;
    } else if (type == _threeColumnLayout) {
      return FieldType.threeColumn;
    } else if (type == _sectionLayout) {
      return FieldType.section;
    } else if (type == EnumHelpers.humanize(FieldType.checkbox)) {
      return FieldType.checkbox;
    } else if (type == EnumHelpers.humanize(FieldType.radioButton)) {
      return FieldType.radioButton;
    } else if (type == EnumHelpers.humanize(FieldType.select)) {
      return FieldType.select;
    } else if (type == EnumHelpers.humanize(FieldType.checkList)) {
      return FieldType.checkList;
    } else if (type == EnumHelpers.humanize(FieldType.checkbox)) {
      return FieldType.checkbox;
    } else if (type == _externalField) {
      return FieldType.externalField;
    } else if (type == EnumHelpers.humanize(FieldType.table)) {
      return FieldType.table;
    } else if (type == _autoComplete) {
      return FieldType.autoComplete;
    } else {
      return FieldType.text;
    }
  }

  static FieldHeightType specifyHeightType(String heightType) {
    if (heightType == EnumHelpers.humanize(FieldHeightType.auto)) {
      return FieldHeightType.auto;
    } else if (heightType == EnumHelpers.humanize(FieldHeightType.fixed)) {
      return FieldHeightType.fixed;
    } else {
      return FieldHeightType.basedOnSize;
    }
  }

  static ParagraphSize specifyParagraphSize(String paragraphSize) {
    if (paragraphSize == EnumHelpers.humanize(ParagraphSize.auto)) {
      return ParagraphSize.auto;
    } else if (paragraphSize == EnumHelpers.humanize(ParagraphSize.small)) {
      return ParagraphSize.small;
    } else {
      return ParagraphSize.medium;
    }
  }

  static Axis specifyDirection(String direction) {
    if (direction == EnumHelpers.humanize(FieldDirectionType.vertical)) {
      return Axis.vertical;
    } else {
      return Axis.horizontal;
    }
  }

  static List<ContextMenuAction> specifyActions(dynamic item) {
    final actions = <ContextMenuAction>[];
    if ((item.attachments?.show)!) {
      actions.add(
        ContextMenuAction(
          icon: Icons.attach_file,
          onTap: () {},
          title: Strings.checkListAttachmentActionLabel,
        ),
      );
    }
    if ((item.linkedModules?.modules?.isNotEmpty)!) {
      actions.add(
        ContextMenuAction(
          icon: Icons.shield,
          onTap: () {},
          title: Strings.checkListIssueActionLabel,
        ),
      );
    }
    return actions;
  }

  static FieldOrientation specifyOrientation(String direction) {
    if (direction == EnumHelpers.humanize(FieldDirectionType.vertical)) {
      return FieldOrientation.vertical;
    } else {
      return FieldOrientation.horizontal;
    }
  }

  static String? validatorFunction(String? str) {
    if (str!.isEmpty) {
      return Api.requiredField;
    }
    return null;
  }
}
