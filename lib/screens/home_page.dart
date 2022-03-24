/*
 * Copyright (c) 2022, Oracle and/or its affiliates.
 * Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/
 */
import 'package:flutter/material.dart';
import 'package:oceflutterminimalsample/components/imagestack.dart';
import 'package:oceflutterminimalsample/components/navdrawer.dart';
import 'package:oceflutterminimalsample/components/screen_layout.dart';
import 'package:oceflutterminimalsample/models/app_images.dart';
import 'package:oceflutterminimalsample/utils/constants.dart';
import 'package:oceflutterminimalsample/utils/strings.dart';

// This widget is the home page of the application.

class HomePage extends StatelessWidget {
  // Constructor that accepts the AppImages param
  const HomePage({@required this.appImages});

  final AppImages appImages;

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      navItem: NavItem.Home,
      appImages: appImages,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ImageStack(
            thumbnailUrl: appImages.homePageImageUrl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  kHomeOverlayHeadline,
                  style: kOverlayHeadlineText,
                ),
                SizedBox(
                  height: kDefaultSeparator,
                ),
                Text(
                  kHomeOverlayText,
                  style: kOverlayText,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const <Widget>[
                Text(
                  kHomeBodyHeadline,
                  style: kBodyHeadline,
                ),
                SizedBox(
                  height: kDefaultSeparator,
                ),
                Text(
                  kHomeBodyText,
                  style: kBodyText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
