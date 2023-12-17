import 'package:flutter/material.dart';

import 'package:chef/theme/theme.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';
import 'package:chef/models/models.dart';
import 'package:chef/services/services.dart';

class DateCustomField extends StatefulWidget {
  const DateCustomField({
    required FieldProperties properties,
    required FieldOnChange onChange,
    String? initValue,
    Key? key,
  })  : _properties = properties,
        _onChange = onChange,
        _initValue = initValue ?? '',
        super(key: key);

  final FieldProperties _properties;
  final FieldOnChange _onChange;
  final String _initValue;
  static const _padding = 8.0;

  @override
  _DateCustomFieldState createState() => _DateCustomFieldState();
}

class _DateCustomFieldState extends State<DateCustomField> {
  late DateTime _selectedDate;
  final _dateIconSize = 30.0;
  final _firstDate = DateTime(2000);
  final _lasttDate = DateTime(2100);
  final _padding = const EdgeInsets.all(DateCustomField._padding);

  @override
  void initState() {
    _selectedDate = widget._initValue.isNotEmpty
        ? DateTime.parse(widget._initValue)
        : DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    final decoration = BoxDecoration(
      border: Border.all(color: appTheme.colors.defaultText),
      borderRadius: const BorderRadius.all(
        Radius.circular(DateCustomField._padding),
      ),
    );
    return GeneralLabelContainer(
      isReadOnly: widget._properties.isReadOnly,
      isMandatory: widget._properties.isMandatory,
      hideLabel: widget._properties.hideLabel,
      label: widget._properties.label,
      child: InkWell(
        onTap: () async {
          await _selectDate(context);
        },
        child: Container(
          decoration: decoration,
          padding: _padding,
          margin: _padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildDateDisplay(),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: _firstDate,
      lastDate: _lasttDate,
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        widget._onChange.call(
          key: widget._properties.name,
          value: _selectedDate.toString(),
        );
      });
    }
  }

  List<Widget> _buildDateDisplay() => [
        GeneralText('${_selectedDate.toLocal()}'.split(' ')[0]),
        Icon(
          Icons.date_range_rounded,
          size: _dateIconSize,
        ),
      ];
}
