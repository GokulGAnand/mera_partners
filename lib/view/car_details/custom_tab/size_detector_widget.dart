import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';

class SizeDetectorWidget extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onSizeDetect;
  final Function() onTap;
  final int listLength;
  final RxBool showMore;
  final bool showViewIssue;

  const SizeDetectorWidget({
    super.key,
    required this.child,
    required this.onSizeDetect,
    required this.onTap,
    required this.listLength,
    required this.showMore,
    required this.showViewIssue,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SizeDetectorWidgetState createState() => _SizeDetectorWidgetState();
}

class _SizeDetectorWidgetState extends State<SizeDetectorWidget> {
  Size? _oldSize;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => _detectSize());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.child,
        (!widget.showViewIssue || widget.listLength == 2)
        ?const SizedBox()
        :Obx(
          () {
            return GestureDetector(
                                onTap: (){
                                  widget.onTap.call();
                                  SchedulerBinding.instance.addPostFrameCallback((_) => _detectSize());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        (widget.showMore.value == false && widget.listLength > 2)
                                            ? '+${widget.listLength - 2} ${MyStrings.otherIssues}'
                                            : MyStrings.viewLessIssues,
                                        textAlign: TextAlign.center,
                                        style: MyStyles.red3_12700,
                                      ),
                                      Icon(
                                        (widget.showMore.value == false)
                                            ? Icons.arrow_drop_down_rounded
                                            : Icons.arrow_drop_up_rounded,
                                        size: 25,
                                        color: MyColors.red3,
                                      )
                                    ],
                                  ),
                                ),
                              );
          }
        ),
      ],
    );
  }

  void _detectSize() {
    if (!mounted) {
      return;
    }
    final size = context.size;
    if (_oldSize != size) {
      _oldSize = size;
      widget.onSizeDetect(size!);
    }
  }
}