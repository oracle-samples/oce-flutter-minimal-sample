/*
 * Copyright (c) 2022, Oracle and/or its affiliates.
 * Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/
 */

import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:oceflutterminimalsample/components/imagestack.dart';
import 'package:oceflutterminimalsample/components/navdrawer.dart';
import 'package:oceflutterminimalsample/components/screen_layout.dart';
import 'package:oceflutterminimalsample/models/app_images.dart';
import 'package:oceflutterminimalsample/utils/constants.dart';
import 'package:oceflutterminimalsample/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

// This widget is the contact us screen of your application.
class ContactUs extends StatelessWidget {
  // Constructor that accepts AppImages object
  const ContactUs({@required this.appImages});

  final AppImages appImages;

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      navItem: NavItem.Contactus,
      appImages: appImages,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ImageStack(
            thumbnailUrl: appImages.contactUsImageUrl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  kContactUsOverlayHeadline,
                  style: kOverlayHeadlineText,
                ),
                const SizedBox(
                  height: kDefaultSeparator,
                ),
                const Text(
                  kContactUsOverlayText,
                  style: kOverlayText,
                ),
                const SizedBox(
                  height: kDefaultSeparator,
                ),
                ElevatedButton(
                  onPressed: () {
                    _launchURL(kOceDeveloperUrl);
                  },
                  child: const Text(kContactUsButtonText, style: kContactUsButton),
                  style: ElevatedButton.styleFrom(
                    elevation: 10.0,
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding, horizontal: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    primary: kLimeGreenColor,
                    onPrimary: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  kContactUsBodyHeadline,
                  style: kBodyHeadline,
                ),
                const SizedBox(
                  height: kDefaultSeparator,
                ),
                ParsedText(
                  text: kContactUsBodyText,
                  parse: <MatchText>[
                    MatchText(
                        pattern: r'\[@([^:]+):([^\]]+)\]',
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                        renderText: ({String str, String pattern}) {
                          final Map<String, String> map = <String, String>{};
                          final RegExp customRegExp = RegExp(pattern);
                          final Match match = customRegExp.firstMatch(str);
                          map['display'] = match.group(2);
                          map['value'] = match.group(3);
                          return map;
                        },
                        onTap: (String url) {
                          final RegExp customRegExp = RegExp(r'\[@([^:]+):([^\]]+)\]');
                          final Match match = customRegExp.firstMatch(url);
                          _launchURL(match.group(2));
                        }),
                  ],
                  style: kBodyText,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            color: kContactUsLocationsColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const <Widget>[
                Text(
                  kContactUsLocations,
                  style: kLocationBodyHeadline,
                ),
                SizedBox(
                  height: kDefaultSeparator,
                ),
                Text(
                  kContactUsLocationsBody,
                  style: kLocationBodyText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
