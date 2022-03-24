/*
 * Copyright (c) 2022, Oracle and/or its affiliates.
 * Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/
 */

import 'package:flutter/material.dart';
import 'package:oceflutterminimalsample/models/app_images.dart';
import 'package:oceflutterminimalsample/screens/contact_us.dart';
import 'package:oceflutterminimalsample/utils/constants.dart';
import 'package:oceflutterminimalsample/utils/strings.dart';

enum NavItem { Home, Contactus }

class NavDrawer extends StatelessWidget {
  const NavDrawer({@required this.navItem, @required this.appImages});

  final NavItem navItem;
  final AppImages appImages;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    // ignore: always_specify_types
                    colors: [
                      kDrawerGradientBegin,
                      kDrawerGradientStop,
                      kDrawerGradientEnd,
                    ],
                  ),
                ),
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onTap: () {
                        //close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        kNavHome,
                        style: navItem == NavItem.Home
                            ? kDrawerTextStyleSelected
                            : kDrawerTextStyle,
                      ),
                      onTap: () {
                        // Update the state of the app
                        // Then close the drawer
                        Navigator.pop(context);
                        if (navItem != NavItem.Home) {
                          //Rather than pushing a new instance of home page, pop the contact us page.
                          Navigator.pop(context);
                        }
                      },
                    ),
                    ListTile(
                      title: Text(
                        kNavContactUs,
                        style: navItem == NavItem.Contactus
                            ? kDrawerTextStyleSelected
                            : kDrawerTextStyle,
                      ),
                      onTap: () {
                        // Update the state of the app
                        // Then close the drawer
                        Navigator.pop(context);
                        if (navItem != NavItem.Contactus) {
                          Navigator.push<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) => ContactUs(
                                appImages: appImages,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              appImages.footerLogoUrl != null
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.network(
                          appImages.footerLogoUrl,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : const Text(kFooterTitle),
            ],
          ),
        ),
      ),
    );
  }
}
