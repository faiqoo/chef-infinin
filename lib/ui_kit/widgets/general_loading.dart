import 'package:flutter/cupertino.dart';

import 'package:chef/theme/app_theme_widget.dart';

class GeneralLoading extends StatelessWidget {
  const GeneralLoading({
    bool isLazyLoader = false,
    Key? key,
  })  : _isLazyloader = isLazyLoader,
        super(key: key);

  final bool _isLazyloader;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = AppTheme.of(context).theme;
    return Container(
      width: size.width,
      height: _isLazyloader ? null : size.height,
      color: _isLazyloader ? null : appTheme.colors.shadow,
      child: const Center(
        child: CupertinoActivityIndicator(
          radius: 16,
        ),
      ),
    );
  }
}
