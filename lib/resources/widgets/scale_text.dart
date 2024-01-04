import '../helpers/all_imports.dart';

class ScaleText extends StatelessWidget {
  const ScaleText(
    this.text, {
    super.key,
    this.style,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textDirection,
    this.showTooltip = true,
    this.tooltipText,
    this.tooltipTriggerMode = TooltipTriggerMode.tap,
    this.isFromDialog = false,
  });

  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow overflow;
  final TextDirection? textDirection;
  final bool showTooltip;
  final String? tooltipText;
  final TooltipTriggerMode tooltipTriggerMode;
  final bool isFromDialog;

  @override
  Widget build(BuildContext context) {
    final TextSpan span = TextSpan(
      text: text,
      style: style,
    );
    if (!isFromDialog) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final TextPainter tp = TextPainter(
            maxLines: maxLines,
            textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
            textAlign: textAlign,
            textDirection:
                textDirection ?? (Components.isRTL() ? TextDirection.rtl : TextDirection.ltr),
            text: span,
          );
          tp.layout(maxWidth: constraints.maxWidth);
          final bool isOnOverflow = tp.didExceedMaxLines;

          return Tooltip(
            message: isOnOverflow && showTooltip ? tooltipText ?? text : '',
            triggerMode: tooltipTriggerMode,
            child: getText(span, context),
          );
        },
      );
    }
    return getText(span, context);
  }

  Text getText(TextSpan span, BuildContext context) {
    return Text.rich(
      span,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      softWrap: softWrap,
      textDirection: textDirection,
      textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
    );
  }
}

class ScaleSize {
  static double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    final double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
