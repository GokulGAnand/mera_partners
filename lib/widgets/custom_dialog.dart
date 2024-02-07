import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

/// ignore: must_be_immutable
class CustomAlertDialog extends StatefulWidget {
  CustomAlertDialog({super.key, this.titleText, this.content, this.removeFun, this.isOnlyOk = true, this.visible = false, required this.okText, required this.cancelText, required this.okFun, required this.cancelFun, this.position});

  final String? titleText;
  final String? content;
  final String? okText;
  final String? cancelText;
  final bool? isOnlyOk;
  final bool? visible;
  dynamic Function()? okFun;
  dynamic Function()? cancelFun;
  GestureTapCallback? removeFun;
  dynamic Function()? position;

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  FocusNode myFocusNode = FocusNode();

  double getMarginValue({
    required BuildContext context,
    required double desktopMargin,
    required double mobileMargin,
    required double tabletMargin,
  }) {
    if (kIsWeb && MediaQuery.of(context).size.width >= 300) {
      return desktopMargin;
    } else if (MediaQuery.of(context).size.shortestSide < 600) {
      return mobileMargin;
    } else {
      return tabletMargin;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        double desktopMargin = MediaQuery.of(context).size.width * 0.35;
        double tabletMargin = orientation == Orientation.portrait ? 180 : 350;
        double mobileMargin = 0;
        return Container(
          margin: EdgeInsets.only(
            right: getMarginValue(
              context: context,
              desktopMargin: desktopMargin,
              mobileMargin: mobileMargin,
              tabletMargin: tabletMargin,
            ),
            left: getMarginValue(
              context: context,
              desktopMargin: desktopMargin,
              mobileMargin: mobileMargin,
              tabletMargin: tabletMargin,
            ),
          ),
          // margin: kIsWeb && MediaQuery
          //     .of(context)
          //     .size
          //     .width >= 600
          //     ? EdgeInsets.only(
          //   left: getValueForScreenType<bool>(
          //     context: context,
          //     mobile: false,
          //     tablet: false,
          //     desktop: true,
          //   )
          //       ? MediaQuery.of(context).size.width * .35
          //       : MediaQuery.of(context).size.width * .15,
          //   right: getValueForScreenType<bool>(
          //     context: context,
          //     mobile: false,
          //     tablet: false,
          //     desktop: true,
          //   )
          //       ? MediaQuery.of(context).size.width * .35
          //       : MediaQuery.of(context).size.width * .15,
          // )
          //     : EdgeInsets.only(
          //   left: getValueForScreenType<bool>(
          //     context: context,
          //     mobile: false,
          //     tablet: true,
          //     desktop: true,
          //   )
          //       ? MediaQuery.of(context).size.width * .35
          //       : MediaQuery.of(context).size.width * .0,
          //   right: getValueForScreenType<bool>(
          //     context: context,
          //     mobile: false,
          //     tablet: true,
          //     desktop: true,
          //   )
          //       ? MediaQuery.of(context).size.width * .35
          //       : MediaQuery.of(context).size.width * .0,
          // ),
          child: Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  top: 18.0,
                ),
                margin: const EdgeInsets.only(top: 13.0, right: 8.0),
                decoration: BoxDecoration(color: MyColors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(16.0), boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: MyColors.black,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                      child: Center(child: Text(widget.content!)),
                    ),
                    const SizedBox(height: 4.0),
                    /*
                    InkWell(
                        child: Container(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          decoration: const BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: widget.isOnlyOk!
                                        ? EdgeInsets.all(0.0)
                                        : EdgeInsets.only(
                                        right: getValueForScreenType<bool>(
                                          context: context,
                                          mobile: false,
                                          tablet: false,
                                          desktop: true,
                                        )
                                            ? MediaQuery.of(context).size.width * 0.05
                                            : MediaQuery.of(context).size.width * 0.05,
                                        left: getValueForScreenType<bool>(
                                          context: context,
                                          mobile: false,
                                          tablet: false,
                                          desktop: true,
                                        )
                                            ? MediaQuery.of(context).size.width * 0.05
                                            : MediaQuery.of(context).size.width * 0.05),
                                    child: CustomButtonWidget(
                                      onPressed: widget.okFun!,
                                      text: widget.okText!,
                                      options: const CustomButtonOptions(
                                        height: 40,
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        color: MyColors.white,
                                        textStyle: TextStyle(
                                          fontFamily: Constants.poppinsRegular,
                                          color: MyColors.kPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        elevation: 2,
                                        borderSide: BorderSide(
                                          color: MyColors.kPrimaryColor,
                                          width: 1,
                                        ),
                                        borderRadius: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                if (widget.isOnlyOk!)
                                  Expanded(
                                    child: CustomButtonWidget(
                                      onPressed: widget.cancelFun!,
                                      text: widget.cancelText!,
                                      options: const CustomButtonOptions(
                                        height: 40,
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        color: MyColors.kPrimaryColor,
                                        textStyle: TextStyle(
                                          fontFamily: Constants.poppinsRegular,
                                          color: MyColors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        elevation: 2,
                                        borderSide: BorderSide(width: 1, color: MyColors.kPrimaryColor),
                                        borderRadius: 12,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        )),*/
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: widget.visible!,
                child: Positioned(
                  right: 0.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Align(
                      // alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 14.0,
                        backgroundColor: MyColors.red,
                        child: Icon(Icons.close, color: MyColors.white),
                      ),
                    ),
                  ),
                ),
              ),

              /*       Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  widget.removeFun??Navigator.of(context).pop();
                },
                child: const Align(alignment: Alignment.topRight,
                  child: CircleAvatar(radius: 14.0, backgroundColor: MyColors.red,
                    child: Icon(Icons.close, color: MyColors.white),
                  ),
                ),
              ),
            ),*/
            ],
          ),
        );
      },
    );
  }
}
