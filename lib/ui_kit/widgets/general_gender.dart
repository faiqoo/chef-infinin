import 'package:flutter/material.dart';
import 'package:chef/theme/app_theme_widget.dart';
import 'package:chef/ui_kit/widgets/general_text.dart';

import 'dart:developer' as developer;

enum Gender {
  male,
  female,
}

class GeneralGender extends StatefulWidget {
  const GeneralGender({
    required String text,
    required Gender gender,
    required Gender selectedItem,
    required Function(String) onTap,
    required List<String> items,
    IconData? icon,
    Key? key,
  })  : _text = text,
        _gender = gender,
        _selectedItem = selectedItem,
        _icon = icon,
        _onTap = onTap,
        _items = items,
        super(key: key);
  final String _text;
  final Gender _gender;
  final Gender _selectedItem;
  final IconData? _icon;
  final Function(String) _onTap;
  final List<String> _items;

  @override
  _GeneralGenderState createState() => _GeneralGenderState();
}

class _GeneralGenderState extends State<GeneralGender> {
  late String selectedValue;

  @override
  void initState() {
    selectedValue = 'Male';
    developer.log(' Selected Value is ' + '$selectedValue');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return InkWell(
        onTap: () {
          widget._onTap.call(selectedValue);
        },
        child: SizedBox(
          height: 55,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget._items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = widget._items[index];

              return Row(
                children: [
                  InkWell(
                      //  InkWell(
                      onTap: () {
                        developer.log(' Clicked on this ');
                        setState(() {
                          selectedValue = widget._items[index];
                          widget._onTap.call(selectedValue);
                        });
                      },
                      child: Container(
                          height: 51,
                          width: 90,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: appTheme.colors
                                      .textFieldBorderColor // green as background color

                                  ),
                              borderRadius:
                                  BorderRadius.circular(8), // radius of 10

                              color: widget._items[index] == selectedValue
                                  ? appTheme.colors.textFieldBorderColor
                                  : appTheme.colors.primaryBackground),
                          child: GeneralText(
                            item,
                            textAlign: TextAlign.center,
                            style: appTheme
                                .typographies.interFontFamily.headline2
                                .copyWith(
                                    color: widget._items[index] == selectedValue
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                          ))),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              );
            },
          ),
        ));
  }
}
