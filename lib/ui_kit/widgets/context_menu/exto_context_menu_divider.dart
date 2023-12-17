part of 'exto_context_menu.dart';

class _ExtoContextMenuDivider extends PopupMenuDivider {
  const _ExtoContextMenuDivider({Key? key}) : super(key: key);

  static const _menuDividerPadding = 15.0;
  static const _menuDividerHeight = 0.0;

  @override
  _ExtoContextMenuDividerState createState() => _ExtoContextMenuDividerState();
}

class _ExtoContextMenuDividerState extends State<_ExtoContextMenuDivider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _ExtoContextMenuDivider._menuDividerPadding,
      ),
      child: GeneralDivider.horizontal(
        height: _ExtoContextMenuDivider._menuDividerHeight,
      ),
    );
  }
}
