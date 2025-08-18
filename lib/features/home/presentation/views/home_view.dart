import 'package:flutter/material.dart';

import '../../../../core/helper/build_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder.buildHomeAppBar(_tabController),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Status Tab Content')),
          Center(child: Text('Chats Tab Content')),
        ],
      ),
    );
  }
}
