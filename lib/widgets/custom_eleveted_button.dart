import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool disabled;
  final bool loading;
  final Widget? icon;
  final Widget? label;
  final Color? backgroundColor;
  final Color? color;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    this.icon,
    this.label,
    this.disabled = false,
    this.loading = false,
    this.backgroundColor,
    this.color,
  })  : assert(
          icon != null || label != null,
          'At least one of icon or label should be defined',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (disabled || loading) ? null : onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: color ??
            Theme.of(context)
                .colorScheme
                .onPrimary, backgroundColor: backgroundColor ??
            Theme.of(context).colorScheme.primary, disabledForegroundColor: backgroundColor ??
            Theme.of(context)
                .colorScheme
                .onSurface.withOpacity(0.38), disabledBackgroundColor: backgroundColor ??
            Theme.of(context)
                .colorScheme
                .onSurface.withOpacity(0.12), // Disabled text, icon, and fill color
      ),
      child: loading
          ? SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color:
                    backgroundColor ?? Theme.of(context).colorScheme.onSurface,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) icon!,
                if (icon != null && label != null)
                  const SizedBox(
                    width: 8,
                  ), // https://api.flutter.dev/flutter/material/ElevatedButton/ElevatedButton.icon.html
                if (label != null) label!,
              ],
            ),
    );
  }
}
