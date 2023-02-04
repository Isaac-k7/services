import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool disabled;
  final bool loading;
  final Widget? icon;
  final Widget? label;
  final Color? color;

  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    this.icon,
    this.label,
    this.disabled = false,
    this.loading = false,
    this.color,
  })  : assert(
          icon != null || label != null,
          'At least one of icon or label should be defined',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = color ?? Theme.of(context).colorScheme.primary;
    return OutlinedButton(
      onPressed: (disabled || loading) ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor, disabledForegroundColor: color ??
            Theme.of(context)
                .colorScheme
                .onSurface.withOpacity(0.38), // Disabled text, icon, and fill color
      ).copyWith(
        side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
          return BorderSide(
            width: 2,
            color: primaryColor.withOpacity(
              states.contains(MaterialState.disabled) ? 0.12 : 1,
            ),
          );
        }),
      ),
      child: loading
          ? SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: color ?? Theme.of(context).colorScheme.onSurface,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) icon!,
                if (icon != null && label != null)
                  const SizedBox(
                    width: 8,
                  ), // https://api.flutter.dev/flutter/material/OutlinedButton/OutlinedButton.icon.html
                if (label != null) label!,
              ],
            ),
    );
  }
}
