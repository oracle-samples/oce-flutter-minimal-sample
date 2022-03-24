/*
 * Copyright (c) 2022, Oracle and/or its affiliates.
 * Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oceflutterminimalsample/utils/constants.dart';

class ImageStack extends StatelessWidget {
  const ImageStack({@required this.thumbnailUrl, @required this.child});

  final String thumbnailUrl;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: kImageStackMinHeight,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kImageStackColor,
          image: thumbnailUrl != null
              ? DecorationImage(
                  image: NetworkImage(thumbnailUrl),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.3,
            kDefaultPadding, kDefaultPadding, kDefaultPadding),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
