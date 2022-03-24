/*
 * Copyright (c) 2022, Oracle and/or its affiliates.
 * Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/
 */

import 'package:oceflutterminimalsample/config/oce.dart';
import 'package:oceflutterminimalsample/models/app_images.dart';
import 'package:oceflutterminimalsample/utils/strings.dart';
import 'content.dart';

//Helper class for making all the API calls needed for the app
class Services {
  // Get all the images needed for the app
  Future<AppImages> getAppImages() async {
    final Content content = Content();
    final String homepageImage = appConfig['homePage'];
    final String contactUsImage = appConfig['contactUs'];
    final String logoImage = appConfig['logo'];
    final String footerImage = appConfig['footerLogo'];
    AppImages images;
    try {
      final dynamic data = await content.queryItems(<String, String>{
        'q':
            '(name eq "$homepageImage" OR name eq "$contactUsImage" OR name eq "$logoImage" OR name eq "$footerImage")',
        'fields': 'all',
        'expand': 'all',
      });
      final List<dynamic> items = data['items'] as List<dynamic>;
      String homePageImageGUID,
          contactUsImageGUID,
          headerLogoGUID,
          footerLogoGUID;
      for (int i = 0; i < items.length; i++) {
        final String name = items[i]['name'] as String;
        final String id = items[i]['id'] as String;
        if (name == homepageImage) {
          homePageImageGUID = id;
        } else if (name == contactUsImage) {
          contactUsImageGUID = id;
        } else if (name == logoImage) {
          headerLogoGUID = id;
        } else if (name == footerImage) {
          footerLogoGUID = id;
        }
      }
      //If any of the image ids are null, let the user know but continue loading the app
      if (homePageImageGUID == null ||
          contactUsImageGUID == null ||
          headerLogoGUID == null ||
          footerLogoGUID == null) {
        print(kFileNameError);
      }
      images = AppImages(
        headerLogoUrl: content.getRenditionURL(<String, String>{'id': headerLogoGUID}),
        footerLogoUrl: content.getRenditionURL(<String, String>{'id': footerLogoGUID}),
        contactUsImageUrl:
            content.getMediumRenditionUrl(<String, String>{'id': contactUsImageGUID}),
        homePageImageUrl: content.getMediumRenditionUrl(<String, String>{'id': homePageImageGUID}),
      );
    } catch (exception) {
      rethrow;
    }
    return images;
  }
}
