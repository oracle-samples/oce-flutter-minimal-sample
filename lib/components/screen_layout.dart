/*
 * Copyright (c) 2022, Oracle and/or its affiliates.
 * Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/
 */

import 'package:flutter/material.dart';
import 'package:oceflutterminimalsample/models/app_images.dart';
import 'package:oceflutterminimalsample/utils/constants.dart';
import 'package:oceflutterminimalsample/utils/strings.dart';

import 'navdrawer.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout(
      {@required this.navItem, @required this.appImages, @required this.body});

  final NavItem navItem;
  final AppImages appImages;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appImages.headerLogoUrl != null
            ? Image.network(
                appImages.headerLogoUrl,
                height: 36,
              )
            : const Text(kActionBarTitle),
        backgroundColor: kActionbarColor,
      ),
      drawer: NavDrawer(
        navItem: navItem,
        appImages: appImages,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: body,
              ),
            );
          },
        ),
      ),
    );
  }
}
