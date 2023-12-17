part of 'exto_context_menu.dart';

class _ExtoContextMenuItem extends StatefulWidget {
  const _ExtoContextMenuItem({
    IconData? icon,
    String? title,
    String? subtitle,
    Function()? onTap,
    Key? key,
  })  : _icon = icon,
        _title = title,
        _subtitle = subtitle,
        _onTap = onTap,
        super(key: key);

  final IconData? _icon;
  final String? _title;
  final String? _subtitle;
  final Function()? _onTap;

  static const _listTilePadding = 14.0;
  static const _titleVerticalPadding = 4.0;

  @override
  _ExtoContextMenuItemState createState() => _ExtoContextMenuItemState();
}

class _ExtoContextMenuItemState extends State<_ExtoContextMenuItem> {
  @override
  Widget build(BuildContext context) {
    final apptheme = AppTheme.of(context).theme;
    final titleColor = apptheme.colors.foregroundColor;
    final subtitleColor = apptheme.colors.subtitleText;

    return _buildContentWidget(
      icon: widget._icon,
      title: widget._title,
      subtitle: widget._subtitle,
      titleColor: titleColor,
      subtitleColor: subtitleColor,
      onTap: widget._onTap,
    );
  }

  Widget _buildContentWidget({
    IconData? icon,
    String? title,
    String? subtitle,
    Color? titleColor,
    Color? subtitleColor,
    Function()? onTap,
  }) {
    assert(
      icon != null || title != null,
      'Either icon or title should be provided',
    );
    final hasText = title != null || subtitle != null;
    final iconRightPadding =
        hasText ? _ExtoContextMenuItem._listTilePadding : 0.0;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: _ExtoContextMenuItem._listTilePadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: iconRightPadding),
            child: icon != null
                ? Icon(
                    icon,
                    color: titleColor,
                  )
                : null,
          ),
          if (hasText)
            _buildTextSection(
              title: title,
              titleColor: titleColor,
              subtitle: subtitle,
              subtitleColor: subtitleColor,
            )
        ],
      ),
    );
  }

  Widget _buildTextSection({
    String? title,
    String? subtitle,
    Color? titleColor,
    Color? subtitleColor,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: _ExtoContextMenuItem._titleVerticalPadding,
              ),
              child: GeneralText(
                title,
                typography: TypographyFamily.label2,
                color: titleColor,
              ),
            ),
          if (subtitle != null)
            GeneralText(
              subtitle,
              typography: TypographyFamily.label2,
              color: subtitleColor,
            ),
        ],
      ),
    );
  }
}
