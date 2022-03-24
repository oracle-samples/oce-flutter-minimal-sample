/*
 * Copyright (c) 2022, Oracle and/or its affiliates.
 * Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/
 */

import 'package:flutter/material.dart';
//This file contains the colors and styles and urls used in all of the screens in this app

//************* Action bar color *************/
const String kOceDeveloperUrl = 'https://developer.oracle.com/';

///************* View dimensions *************/
const double kImageStackMinHeight = 280.0;
const double kDefaultPadding = 15.0;
const double kHeadlineTextSize = 22.0;
const double kTextSize = 18.0;
const double kDefaultSeparator = 15.0;

//************* Colors *************/
const Color kActionbarColor = Color(0xff252420);
const Color kDrawerGradientBegin = Color(0xff252420);
const Color kDrawerGradientStop = Color(0xff43471a);
const Color kDrawerGradientEnd = Color(0xff8d9c00);
const Color kLimeGreenColor = Color(0xffbfd600);
const Color kContactUsLocationsColor = Color(0xff58595B);
const Color kImageStackColor = Color(0xff43471a);

//************* Overlay styles *************/
const TextStyle kOverlayHeadlineText = TextStyle(
  color: Colors.white,
  fontSize: kHeadlineTextSize,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.0,
  height: 1.2,
);

const TextStyle kOverlayText = TextStyle(
  color: Colors.white,
  fontSize: kTextSize,
  letterSpacing: 1.0,
  height: 1.5,
);

//************* Drawer styles *************/
const TextStyle kDrawerTextStyle = TextStyle(
  fontSize: kTextSize,
  color: Color(0xffffffff),
  letterSpacing: 0.6,
  height: 1.2,
);

const TextStyle kDrawerTextStyleSelected = TextStyle(
  fontSize: kTextSize,
  color: kLimeGreenColor,
  letterSpacing: 0.6,
  height: 1.2,
);

//************* Body styles *************/
const TextStyle kBodyHeadline = TextStyle(
  fontSize: kHeadlineTextSize,
  fontWeight: FontWeight.bold,
  color: Color(0xff403C38),
);

const TextStyle kBodyText = TextStyle(
  fontSize: kTextSize,
  color: Color(0xff403C38),
  letterSpacing: 0.6,
  height: 1.2,
);

//************* Location styles *************/
const TextStyle kLocationBodyHeadline = TextStyle(
  fontSize: kHeadlineTextSize,
  fontWeight: FontWeight.bold,
  color: Color(0xffffffff),
);

const TextStyle kLocationBodyText = TextStyle(
  fontSize: kTextSize,
  fontWeight: FontWeight.normal,
  color: Color(0xffffffff),
  letterSpacing: 0.6,
  height: 1.5,
);

//************* Location styles *************/
const TextStyle kErrorText = TextStyle(
  color: Colors.white,
  fontSize: kTextSize,
);

const TextStyle kContactUsButton = TextStyle(fontSize: 18);
