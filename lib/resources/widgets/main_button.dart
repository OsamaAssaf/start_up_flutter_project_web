import '../helpers/all_imports.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.titleWidget,
    required this.onPressed,
    this.backgroundColor,
    this.color,
    this.buttonWidth,
    this.borderSide,
    this.elevation,
    this.tooltip,
    this.showTooltip = true,
  });

  final String title;
  final Widget? titleWidget;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? color;
  final double? buttonWidth;
  final BorderSide? borderSide;
  final double? elevation;
  final String? tooltip;
  final bool showTooltip;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (showTooltip) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Tooltip(
          message: tooltip ?? title,
          child: _buildButton(width),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: _buildButton(width),
    );
  }

  ElevatedButton _buildButton(double width) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: borderSide ?? BorderSide.none,
        ),
        elevation: elevation,
        surfaceTintColor: Colors.transparent,
        backgroundColor: backgroundColor ?? theme.colorScheme.primary,
        minimumSize: Size(width * 0.20, 46.0),
        maximumSize: Size(width * 0.50, 46.0),
        fixedSize: buttonWidth == null ? null : Size(buttonWidth!, 46.0),
      ),
      onPressed: onPressed,
      child: titleWidget ??
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              color: color ?? customTheme.white,
            ),
          ),
    );
  }
}
