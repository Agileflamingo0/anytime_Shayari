import 'package:anytime/about_screen.dart';
import 'package:anytime/app_theme.dart';
import 'package:anytime/atitude_screen.dart';
import 'package:anytime/custom_drawer/drawer_user_controller.dart';
import 'package:anytime/custom_drawer/home_drawer.dart';
import 'package:anytime/feedback_screen.dart';
import 'package:anytime/help_screen.dart';
import 'package:anytime/home_screen.dart';
import 'package:anytime/invite_friend_screen.dart';
import 'package:anytime/painfull.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.bevfa) {
        setState(() {
          screenView = bevfa();
        });
      } else if (drawerIndex == DrawerIndex.painfull) {
        setState(() {
          screenView = Painfull();
        });
      } else if (drawerIndex == DrawerIndex.beautifull) {
        setState(() {
          screenView = const Beautifull();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = InviteFriend();
        });
      } else if (drawerIndex == DrawerIndex.atitude) {
        setState(() {
          screenView = Atitude();
        });
      } else if (drawerIndex == DrawerIndex.heart) {
        setState(() {
          screenView = Heart();
        });
      } else {
        //do in your way......
      }
    }
  }
}
