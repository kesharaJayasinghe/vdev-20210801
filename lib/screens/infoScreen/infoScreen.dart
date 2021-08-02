import 'package:flutter/material.dart';

import 'package:vdev20210801/components/customText.dart';
import 'package:vdev20210801/constants/palette.dart';
import 'package:vdev20210801/screens/infoScreen/services/tabControlService.dart';
import 'package:vdev20210801/screens/infoScreen/tabs/aboutTab.dart';
import 'package:vdev20210801/screens/infoScreen/tabs/categoryTab.dart';
import 'package:vdev20210801/screens/infoScreen/tabs/projectTab.dart';

class InfoScreen extends StatefulWidget {
  static const String route = '/infoScreen';

  const InfoScreen({Key key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  TabControlService tabControlServices = TabControlService();

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    animateToPreviousTab();
    tabController.addListener(tabListener);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  void tabListener() {
    if (tabController?.indexIsChanging ?? false) {
      tabControlServices.changeTab(tabController.index);
    }
  }

  void animateToPreviousTab() {
    if (tabControlServices.currentTab != 0) {
      tabController.animateTo(tabControlServices.currentTab);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
            color: Palette.white,
            iconSize: 20,
          ),
          title: CustomText(
            text: 'Info',
            textSize: 15,
            fontWeight: FontWeight.w600,
          ),
          bottom: TabBar(
            isScrollable: true,
            controller: tabController,
            tabs: [
              Tab(text: 'Project'),
              Tab(text: 'Categories'),
              Tab(text: 'About'),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [ProjectTab(), CategoryTab(), AboutTab()],
        ),
      ),
    );
  }
}
