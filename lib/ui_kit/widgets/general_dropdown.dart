import 'package:flutter/material.dart';

import 'package:dropdown_search/dropdown_search.dart';

import 'package:chef/services/services.dart';
import 'package:chef/constants/constants.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_theme_data/app_theme_data.dart';
import '../../theme/app_theme_widget.dart';

class GeneralDropdown<T> extends StatefulWidget {
  const GeneralDropdown({
    required List<String> items,
    required String name,
    required FieldOnChange onChange,
    TextStyle? style,
    Color? borderColor,
    List<String>? selectedItems,
    String? selectedItem,
    bool isSearchable = false,
    bool isMultiSelect = false,
    bool isMandatory = false,
    bool isExpanded = true,
    double margin = 0.0,
    String? Function(List<String>?)? validator,
    double borderWidth = 2.0,
    double dropDownHeight = 53.0,
    Key? key,
  })  : _items = items,
        _name = name,
        _isSearchable = isSearchable,
        _isMultiSelect = isMultiSelect,
        _onChange = onChange,
        _borderColor = borderColor,
        _isMandatory = isMandatory,
        _isExpanded = isExpanded,
        _margin = margin,
        _selectedItems = selectedItems,
        _selectedItem = selectedItem,
        _validator = validator,
        _borderWidth = borderWidth,
        _style = style,
        _dropDownHeight = dropDownHeight,
        super(key: key);

  final String _name;
  // final List<dynamic> _items;
  final List<String> _items;
  final bool _isSearchable;
  final bool _isMultiSelect;
  final bool _isMandatory;
  final bool _isExpanded;
  final Color? _borderColor;
  final FieldOnChange _onChange;
  final double _margin;
  final List<String>? _selectedItems;
  final String? _selectedItem;
  final String? Function(List<String>?)? _validator;
  final double _borderWidth;
  final TextStyle? _style;
  final double _dropDownHeight;

  @override
  _GeneralDropdownState createState() => _GeneralDropdownState();
}

class _GeneralDropdownState extends State<GeneralDropdown> {
  late String selectedValue;
  late String currentChoice;

  @override
  void initState() {
    selectedValue = widget._selectedItem ?? '';
    currentChoice = widget._items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Padding(
        padding: EdgeInsets.all(widget._margin),
        child: widget._isMultiSelect
            ? DropdownSearch<String>.multiSelection(
                autoValidateMode: AutovalidateMode.always,
                items: widget._items,
                popupProps: PopupPropsMultiSelection.menu(
                  showSearchBox: widget._isSearchable,
                ),
                selectedItems: widget._selectedItems ?? <String>[],
                validator: widget._isMandatory
                    ? widget._validator ??
                        (List<String>? items) {
                          if (items == null || items.isEmpty) {
                            return Strings.requiredField;
                          } else {
                            return null;
                          }
                        }
                    : null,
                onChanged: (values) {
                  widget._onChange.call(
                    key: widget._name,
                    value: values.toString(),
                  );
                },
              )
            : SizedBox(
                height: widget._dropDownHeight,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: widget._borderColor ??
                            const Color.fromRGBO(0, 0, 0, 0.57),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: widget._borderColor ??
                              const Color.fromRGBO(0, 0, 0, 0.57),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          dropdownColor: appTheme.colors.textFieldFilledColor,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          style: widget._style,
                          value: currentChoice,
                          iconEnabledColor: widget._borderColor,
                          underline: Container(),
                          onChanged: (value) {
                            setState(() => currentChoice = value!);
                            widget._onChange.call(
                              key: widget._name,
                              value: value.toString(),
                            );
                          },
                          items: widget._items
                              .map((data) => DropdownMenuItem(
                                  value: data,
                                  child: Text(
                                    data,
                                  )))
                              .toList(),
                        )))));
  }

  String? validatorFunctionMultiple(List<String?>? str) {
    if (str!.isEmpty) {
      return Api.requiredField;
    }
    return null;
  }
}
