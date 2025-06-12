import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';

class RatingsBar extends StatefulWidget {
  final double rating;
  final int totalStars;
  final double starSize;
  final Color filledColor;
  final Color emptyColor;
  final Duration animationDuration;

  const RatingsBar({
    super.key,
    required this.rating,
    this.totalStars = 5,
    this.starSize = 24.0,
    this.filledColor = ColorsManager.mainColor,
    this.emptyColor = ColorsManager.grey,
    this.animationDuration = const Duration(milliseconds: 500),
  });

  @override
  State<RatingsBar> createState() => _RatingsBarState();
}

class _RatingsBarState extends State<RatingsBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _slideAnimations = List.generate(widget.totalStars, (index) {
      return Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * 0.2, 1.0, curve: Curves.easeOut),
        ),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.totalStars, (index) {
        if (index < widget.rating) {
          if (index + 1 <= widget.rating) {
            return SlideTransition(
              position: _slideAnimations[index],
              child: Icon(
                Icons.star,
                size: widget.starSize,
                color: widget.filledColor,
              ),
            );
          } else {
            final double fraction = widget.rating - index;
            return SlideTransition(
              position: _slideAnimations[index],
              child: SizedBox(
                width: widget.starSize,
                height: widget.starSize,
                child: Stack(
                  children: [
                    Icon(
                      Icons.star,
                      size: widget.starSize,
                      color: widget.emptyColor,
                    ),
                    ClipRect(
                      clipper: _PartialStarClipper(fraction),
                      child: Icon(
                        Icons.star,
                        size: widget.starSize,
                        color: widget.filledColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        } else {
          return SlideTransition(
            position: _slideAnimations[index],
            child: Icon(
              Icons.star,
              size: widget.starSize,
              color: widget.emptyColor,
            ),
          );
        }
      }),
    );
  }
}

class _PartialStarClipper extends CustomClipper<Rect> {
  final double fraction;

  _PartialStarClipper(this.fraction);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      0,
      0,
      size.width * fraction,
      size.height,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
