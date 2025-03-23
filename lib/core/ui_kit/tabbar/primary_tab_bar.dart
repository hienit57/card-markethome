import 'package:flutter/material.dart';

class PrimaryTabBar extends StatelessWidget {
  const PrimaryTabBar({
    super.key,
    required this.controller,
    required this.tabs,
    required this.views,
    this.padding,
  });
  final TabController controller;
  final List<Widget> tabs;
  final List<Widget> views;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ColoredBox(
              color: const Color(0XFFF2F4F7),
              child: TabBar(
                controller: controller,
                padding: const EdgeInsets.all(5),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                dividerHeight: 0,
                labelPadding: EdgeInsets.zero,
                overlayColor: const MaterialStatePropertyAll<Color>(
                  Colors.transparent,
                ),
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                //labelColor: context.theme.primaryColor,
                unselectedLabelColor: const Color(0xff667385),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff667385),
                ),
                tabs: tabs,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: views,
          ),
        ),
      ],
    );
  }
}
