import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mera_partners/view/car_details/custom_tab/size_detector_widget.dart';

class SizedPageView extends StatefulWidget {
  final List<Widget> children;
  final PageController pageController;
  final DragStartBehavior dragStartBehavior;
  final ScrollPhysics physics;
  final Function() onTap;
  final int listLength;
  final RxBool showMore;

  const SizedPageView({
    super.key,
    required this.children,
    required this.pageController,
    required this.dragStartBehavior,
    required this.physics,
    required this.onTap,
    required this.listLength,
    required this.showMore,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SizedPageViewState createState() => _SizedPageViewState();
}

class _SizedPageViewState extends State<SizedPageView>
    with TickerProviderStateMixin {
  late List<double> _heights;
  int _currentIndex = 0;
  bool showViewIssue = false;

  double get _currentHeight => _heights[_currentIndex];

  @override
  void initState() {
    super.initState();
    _heights = List.generate(widget.children.length, (index) => 0.0);

    widget.pageController.addListener(() {
      final newIndex = widget.pageController.page?.round();
      if (_currentIndex != newIndex) {
        if (!mounted) {
          return;
        }
        setState(() => _currentIndex = newIndex!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 100),
      tween: Tween<double>(begin: _heights[0], end: _currentHeight),
      builder: (context, value, child) => SizedBox(height: value, child: child),
      child: PageView(
        controller: widget.pageController,
        physics: widget.physics,
        dragStartBehavior: widget.dragStartBehavior,
        children: List.generate(widget.children.length, (index) {
          return OverflowBox(
            minHeight: 0,
            maxHeight: double.infinity,
            alignment: Alignment.topCenter,
            child: SizeDetectorWidget(
              listLength: widget.listLength,
              showViewIssue: (widget.children.length == 2 && index == 0)?true:false,
              showMore: widget.showMore,
              onTap: widget.onTap,
              onSizeDetect: (size) {
                if (mounted) {
                  setState(() => _heights[index] = size.height);
                }
              },
              child: Align(child: widget.children[index]),
            ),
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    widget.pageController.dispose();
    super.dispose();
  }
}