/*
 * Copyright (c) 2022, Oracle and/or its affiliates.
 * Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/
 */

import 'package:flutter/material.dart';
import 'package:oceflutterminimalsample/models/app_images.dart';
import 'package:oceflutterminimalsample/networking/services.dart';
import 'package:oceflutterminimalsample/screens/home_page.dart';
import 'package:oceflutterminimalsample/utils/constants.dart';

// The initial screen for the app. This screen makes the API calls to fetch Urls for all
// the digital assets used in this app. Once fetched, it loads the home page.
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String exception;

  @override
  void initState() {
    super.initState();
    getData();
  }

  // Makes API call to fetch all the images needed in this app. Once the results are
  // obtained, it launches the home page screen
  Future<void> getData() async {
    final Services services = Services();
    try {
      final AppImages images = await services.getAppImages();
      if (images != null) {
        Navigator.push<dynamic>(context,
            MaterialPageRoute<dynamic>(builder: (BuildContext context) {
          return HomePage(appImages: images);
        }));
      }
    } catch (exception) {
      setState(() {
        this.exception = exception.toString();
      });
      print(exception.toString());
    }
  }

  // Display a progress indicator while the images are being fetched
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Center(
          child: exception != null
              ? Text(
                  exception,
                  style: kErrorText,
                )
              : const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(kLimeGreenColor),
                ),
        ),
      ),
    );
  }
}
