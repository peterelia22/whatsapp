import 'package:flutter/material.dart';
import 'package:whatsapp/core/utils/app_colors.dart';
import 'package:whatsapp/core/utils/assets.dart';

class AppBarBuilder {
  static PreferredSizeWidget buildHomeAppBar(TabController tabController) {
    return AppBar(
      backgroundColor: AppColors.lightPrimaryColor,
      title: Text(
        'WhatsApp',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        Image.asset(Assets.imagesCamera),
        SizedBox(width: 16),
        Image.asset(Assets.imagesSearch),
        SizedBox(width: 16),
        Image.asset(Assets.imagesMenu),
      ],
      bottom: TabBar(
        controller: tabController,
        indicatorColor: Colors.white,
        indicatorWeight: 3,
        labelStyle: TextStyle(
          color: AppColors.lightSecondaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.lightSecondaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        tabs: const [
          Tab(text: 'Chats'),
          Tab(text: 'Status'),
        ],
      ),
    );
  }
}
