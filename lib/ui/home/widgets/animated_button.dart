import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class AnimatedButton extends ConsumerStatefulWidget {
  const AnimatedButton({
    super.key,
    required this.onPressed,
    this.title,
    this.icon,
    this.image,
    this.backgroundColor,
    required this.textColor,
  });

  final String? title;
  final IconData? icon;
  final String? image;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;

  @override
  ConsumerState<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends ConsumerState<AnimatedButton> {
  bool _isHovered = false;

  Widget _buildButtonDefault() {
    return Container(
      constraints: BoxConstraints.expand(),
      key: UniqueKey(),
      decoration: BoxDecoration(color: widget.backgroundColor, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [Icon(widget.icon, color: widget.textColor), Text(widget.title ?? '', style: TextStyle(color: widget.textColor))],
        ),
      ),
    );
  }

  Widget _buildButtonHover() {
    return Container(
      constraints: BoxConstraints.expand(),
      key: UniqueKey(),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(widget.image ?? ''), fit: BoxFit.cover),
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [Icon(widget.icon, color: widget.textColor), Text(widget.title ?? '', style: TextStyle(color: widget.textColor))],
        ),
      ),
    );
  }

  void onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        onEnter: (event) => onHover(true),
        onExit: (event) => onHover(false),

        child: AnimatedSwitcher(duration: const Duration(seconds: 1), child: _isHovered ? _buildButtonDefault() : _buildButtonHover()),
      ),
    );
  }
}
