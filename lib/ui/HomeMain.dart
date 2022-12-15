import 'package:flutter/material.dart';
import 'package:mcfooddriver/ui/GMaps.dart';
import 'package:mcfooddriver/ui/subpage/ListOrderSub.dart';
import 'package:mcfooddriver/ui/subpage/ListTransSub.dart';
import 'package:mcfooddriver/ui/subpage/ProfileSub.dart';
import 'package:mcfooddriver/util/CustomColor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(context,
          screens: screens(),
          resizeToAvoidBottomInset: true,
          items: navBarItems(context),
          handleAndroidBackButtonPress: true,
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style9,
          backgroundColor: CustomColor.white,
          decoration: NavBarDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, -7),
              ),
            ],
          )),
    );
  }

  List<Widget> screens() {
    return [
      const Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: ListOrderSub(),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: ListTransSub(),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: ProfileSub(),
      )
    ];
  }

  List<PersistentBottomNavBarItem> navBarItems(contexts) {
    return [
      tabItemSetup("Order", Icons.format_list_bulleted),
      tabItemSetup("Transaction", Icons.playlist_add_check),
      tabItemSetup("Profile", Icons.person),
    ];
  }

  PersistentBottomNavBarItem tabItemSetup(String title, IconData icon) {
    return PersistentBottomNavBarItem(
        title: title,
        textStyle: const TextStyle(fontFamily: "inter600", fontSize: 12),
        icon: Icon(icon),
        inactiveIcon: Icon(icon),
        activeColorPrimary: CustomColor.primary,
        inactiveColorPrimary: CustomColor.greyBd);
  }

}


