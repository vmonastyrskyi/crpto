import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/core/utils/theme/themes.dart';
import 'package:flutter/material.dart';

class CrptoSearchBar extends StatefulWidget {
  const CrptoSearchBar({super.key, this.hintText, this.onChanged});

  final String? hintText;
  final ValueChanged<String>? onChanged;

  @override
  State<CrptoSearchBar> createState() => _CrptoSearchBarState();
}

class _CrptoSearchBarState extends State<CrptoSearchBar> {
  final TextEditingController _controller = TextEditingController();

  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (mounted) {
        setState(() => _showClearButton = _controller.text.isNotEmpty);
      }
    });

    _showClearButton = _controller.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _controller,
      onChanged: widget.onChanged,
      constraints: const BoxConstraints(),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(4.0)),
      backgroundColor: WidgetStatePropertyAll(
        context.appColors.primaryWidgetColor,
      ),
      overlayColor: WidgetStatePropertyAll(context.appColors.splashColorLight),
      shadowColor: WidgetStatePropertyAll(context.appColors.shadowColor),
      elevation: const WidgetStatePropertyAll(1.0),
      textStyle: WidgetStatePropertyAll(
        TextStyle(color: context.appColors.primaryTextColor, fontSize: 14.0),
      ),
      hintStyle: WidgetStatePropertyAll(
        TextStyle(color: context.appColors.hintTextColor, fontSize: 14.0),
      ),
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 4.0, 0.0),
        child: Icon(
          size: 20.0,
          color: context.appColors.iconColor,
          Icons.search,
        ),
      ),
      trailing: <Widget>[if (_showClearButton) _buildClearButton()],
      hintText: widget.hintText,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildClearButton() {
    return InkWell(
      onTap: () {
        setState(() => _showClearButton = false);

        widget.onChanged?.call(emptyString);

        _controller.clear();
      },
      customBorder: const CircleBorder(side: BorderSide.none),
      child: Icon(
        Icons.close,
        color: context.appColors.iconColor,
        size: 20.0,
      ).withPaddingAll(2.0),
    ).withPadding(4.0, 0.0, 8.0, 0.0);
  }
}
