import 'package:country_app/presentation/component/expanded.dart';
import 'package:country_app/presentation/presentation/components/values.dart';
import 'package:country_app/presentation/presentation/ui/widget/contient_check_box_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExpandedTextWidget extends StatefulWidget {
  const ExpandedTextWidget({Key? key}) : super(key: key);

  @override
  State<ExpandedTextWidget> createState() => _ExpandedTextWidgetState();
}

class _ExpandedTextWidgetState extends State<ExpandedTextWidget> {
  String value = "";
  bool isSelected = false;
  void _update(String newValue) {
    setState(() => value = newValue);
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableTheme(
      data: const ExpandableThemeData(
        iconColor: Colors.blue,
        useInkWell: true,
      ),
      child: ExpandableNotifier(
        child: ScrollOnExpand(
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              tapBodyToExpand: true,
              tapBodyToCollapse: true,
              hasIcon: false,
            ),
            header: Row(
              children: [
                Expanded(
                  child: Text(
                    "Region",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                const ExpandableIcon(
                  theme: ExpandableThemeData(
                    expandIcon: Icons.expand_more_outlined,
                    collapseIcon: Icons.expand_less_outlined,
                    iconColor: AppColors.primaryColor,
                    iconSize: 28.0,
                    iconRotationAngle: math.pi / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: false,
                  ),
                ),
              ],
            ),
            collapsed: Container(),
            expanded: RegionCheckBoxWidget(
                isSelected: isSelected, conteinentNameselected: _update),
          ),
        ),
      ),
    );
  }
}
