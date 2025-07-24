import 'package:baseApp/common/slidable_widget/slidable_widget.dart';
import 'package:baseApp/common/text_style/app_text_style.dart';
import 'package:baseApp/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

const bool _kCloseOnTap = true;

/// Abstract class for slide actions that can close after [onTap] occurred.
abstract class ClosableSlideAction extends StatelessWidget {
  /// Creates a slide that closes when a tap has occurred if [closeOnTap]
  /// is [true].
  ///
  /// The [closeOnTap] argument must not be null.
  const ClosableSlideAction({
    super.key,
    this.color,
    this.onTap,
    this.closeOnTap = _kCloseOnTap,
    this.borderRadius,
  });

  /// The background color of this action.
  final Color? color;

  final BorderRadius? borderRadius;

  /// A tap has occurred.
  final VoidCallback? onTap;

  /// Whether close this after tap occurred.
  ///
  /// Defaults to true.
  final bool closeOnTap;

  /// Calls [onTap] if not null and closes the closest [Slidable]
  /// that encloses the given context.
  void _handleCloseAfterTap(BuildContext context) {
    onTap?.call();
    Slidable.of(context)?.close();
  }

  @override
  Widget build(BuildContext context) {
    final SlidableData? data = SlidableData.of(context);
    EdgeInsets margin;

    if (data != null) {
      // Nếu là primary actions (kéo từ trái qua phải) thì margin left
      // Nếu là secondary actions (kéo từ phải qua trái) thì margin right
      margin = data.actionType == SlideActionType.primary
          ? const EdgeInsets.only(left: 16)
          : const EdgeInsets.only(right: 16);
    } else {
      margin = const EdgeInsets.only(left: 16);
    }

    return GestureDetector(
      child: Container(
        margin: margin,
        decoration: BoxDecoration(color: color, borderRadius: borderRadius),
        child: InkWell(
          onTap: !closeOnTap ? onTap : () => _handleCloseAfterTap(context),
          child: buildAction(context),
        ),
      ),
    );
  }

  /// Builds the action.
  @protected
  Widget buildAction(BuildContext context);
}

/// A basic slide action with a background color and a child that will
/// be center inside its area.
class SlideAction extends ClosableSlideAction {
  /// Creates a slide action with a child.
  ///
  /// The `color` argument is a shorthand for `decoration:
  /// BoxDecoration(color: color)`, which means you cannot supply both a `color`
  /// and a `decoration` argument. If you want to have both a `color` and a
  /// `decoration`, you can pass the color as the `color` argument to the
  /// `BoxDecoration`.
  ///
  /// The [closeOnTap] argument must not be null.
  SlideAction({
    super.key,
    required this.child,
    super.onTap,
    Color? color,
    Decoration? decoration,
    super.closeOnTap,
  })  : assert(decoration == null || decoration.debugAssertIsValid()),
        assert(
            color == null || decoration == null,
            'Cannot provide both a color and a decoration\n'
            'The color argument is just a shorthand for "decoration:  BoxDecoration(color: color)".'),
        decoration =
            decoration ?? (color != null ? BoxDecoration(color: color) : null),
        super(
          color: color ?? Colors.transparent,
        );

  /// The decoration to paint behind the [child].
  ///
  /// A shorthand for specifying just a solid color is available in the
  /// constructor: set the `color` argument instead of the `decoration`
  /// argument.
  final Decoration? decoration;

  /// The [child] contained by the slide action.
  final Widget child;

  @override
  Widget buildAction(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Center(
        child: child,
      ),
    );
  }
}

/// A basic slide action with an icon, a caption and a background color.
class IconSlideAction extends ClosableSlideAction {
  /// Creates a slide action with an icon, a [caption] if set and a
  /// background color.
  ///
  /// The [closeOnTap] argument must not be null.
  const IconSlideAction({
    super.key,
    this.icon,
    this.iconWidget,
    this.caption,
    Color? color,
    this.foregroundColor,
    super.borderRadius,
    super.onTap,
    super.closeOnTap,
  })  : assert(icon != null || iconWidget != null,
            'Either set icon or iconWidget.'),
        super(color: color ?? Colors.white);

  /// The icon to show.
  final IconData? icon;

  /// A custom widgets to represent the icon.
  /// If both [icon] and [iconWidget] are set, they will be shown at the same
  /// time.
  final Widget? iconWidget;

  /// The caption below the icon.
  final String? caption;

  /// The color used for [icon] and [caption].
  final Color? foregroundColor;

  @override
  Widget buildAction(BuildContext context) {
    final Color estimatedColor =
        ThemeData.estimateBrightnessForColor(color!) == Brightness.light
            ? Colors.black
            : Colors.white;

    final List<Widget> widgets = [];

    if (icon != null) {
      widgets.add(
        Flexible(
          child: Icon(
            icon,
            color: foregroundColor ?? estimatedColor,
            size: 24,
          ),
        ),
      );
    }

    if (iconWidget != null) {
      widgets.add(
        Flexible(child: iconWidget!),
      );
    }

    if (caption != null) {
      widgets.add(
        Flexible(
          child: Text(
            caption!,
            overflow: TextOverflow.ellipsis,
            // style: Theme.of(context).primaryTextTheme.caption!.copyWith(color: foregroundColor ?? estimatedColor),
            style: AppTextStyles.textStyle14.copyWith(color: AppColors.grey),
          ),
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    );
  }
}
