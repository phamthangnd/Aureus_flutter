import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

import 'dart:ui';

/// {@category Foundation}

/* ------------------ SIZING -------------------- */

/// Dynamically keeps track of the screen's sizes, and resizes it appropriately to fit
/// almost any web / mobile / tablet screen.

class Sizing {
  /// The sizing window of the application
  FlutterView sizingWindow() {
    var view = PlatformDispatcher.instance.implicitView;
    return view!;
  }

  /// Pixel Ratio of a given device
  double pixelRatio() {
    return sizingWindow().devicePixelRatio;
  }

  /// Size in physical pixels
  Size physicalScreenSize() {
    return Size(
        sizingWindow().physicalSize.width, sizingWindow().physicalSize.height);
  }

  /// Physical width of the screen
  double physicalWidth() {
    return (physicalScreenSize().width);
  }

  /// Physical height of the screen
  double physicalHeight() {
    return physicalScreenSize().height;
  }

  /// Size in logical pixels
  Size logicalScreenSize() {
    var screenSize = sizingWindow().physicalSize / pixelRatio();
    return Size(screenSize.width, screenSize.height);
  }

  /// Logical width of the screen
  double logicalWidth() {
    return logicalScreenSize().width;
  }

  /// Logical height of the screen
  double logicalHeight() {
    return logicalScreenSize().height;
  }

  /// Determines whether or not the current screen is a hamburger / hot dog orientation
  bool isDesktopDisplay(Size size) {
    if (size.width > size.height) {
      return true;
    } else if (size.width <= size.height) {
      return false;
    }

    throw ('An impossible ratio was returned when determining isDesktopDisplay');
  }

  /// Creates a scale factor to adjust for size differences between
  /// mobile, tablet, and web.
  double responsiveSize(double base, Size size) {
    double scaleFactor = 0.0;
    double shortSide = size.shortestSide;

    if (shortSide >= 300) {
      //needs mobile phone scale
      scaleFactor = 0.80;
    } else if (shortSide >= 420 && shortSide < 550) {
      //needs tablet scale
      scaleFactor = 1.0;
    } else if (shortSide >= 550 && shortSide < 900) {
      //needs slightly larger tablet scale
      scaleFactor = 1.29;
    } else if (shortSide >= 900) {
      //needs web phone scale
      scaleFactor = 1.35;
    }

    return scaleFactor * base;
  }

  /// Basic padding that can be used for anything.
  EdgeInsets universalPadding() {
    return const EdgeInsets.fromLTRB(10, 10, 10, 10);
  }

  /// Returns the % of screen height for the weight passed
  /// as a double so it can be used for layout purposes.
  double heightOf({weight = sizingWeight, required Size area}) {
    double screenWeightedHeight = 0.0;

    switch (weight) {
      //MINIMUM HEIGHT OF ITEM - 5%
      case sizingWeight.w0:
        screenWeightedHeight = area.height * 0.05;
        break;

      //10% of screen height
      case sizingWeight.w1:
        screenWeightedHeight = area.height * 0.1;
        break;

      //20% of screen height
      case sizingWeight.w2:
        screenWeightedHeight = area.height * 0.2;
        break;

      //30% of screen height
      case sizingWeight.w3:
        screenWeightedHeight = area.height * 0.3;
        break;

      //40% of screen height
      case sizingWeight.w4:
        screenWeightedHeight = area.height * 0.4;
        break;

      //50% of screen height
      case sizingWeight.w5:
        screenWeightedHeight = area.height * 0.5;
        break;

      //60% of screen height
      case sizingWeight.w6:
        screenWeightedHeight = area.height * 0.6;
        break;

      //70% of screen height
      case sizingWeight.w7:
        screenWeightedHeight = area.height * 0.7;
        break;

      //80% of screen height
      case sizingWeight.w8:
        screenWeightedHeight = area.height * 0.8;
        break;

      //90% of screen height
      case sizingWeight.w9:
        screenWeightedHeight = area.height * 0.9;
        break;

      //100% of screen height
      case sizingWeight.w10:
        screenWeightedHeight = area.height;
        break;
    }

    return screenWeightedHeight;
  }

  /// Returns the % of screen width for the weight passed
  /// as a double so it can be used for layout purposes.
  double widthOf({weight = sizingWeight, required Size area}) {
    double screenWeightedWidth = 0.0;

    switch (weight) {
      //MINIMUM WIDTH OF ITEM - 5%
      case sizingWeight.w0:
        screenWeightedWidth = area.width * 0.05;
        break;

      //10% of width
      case sizingWeight.w1:
        screenWeightedWidth = area.width * 0.1;
        break;

      //20% of width
      case sizingWeight.w2:
        screenWeightedWidth = area.width * 0.2;
        break;

      //30% of width
      case sizingWeight.w3:
        screenWeightedWidth = area.width * 0.3;
        break;

      //40% of width
      case sizingWeight.w4:
        screenWeightedWidth = area.width * 0.4;
        break;

      //50% of width
      case sizingWeight.w5:
        screenWeightedWidth = area.width * 0.5;
        break;

      //60% of width
      case sizingWeight.w6:
        screenWeightedWidth = area.width * 0.6;
        break;

      //70% of width
      case sizingWeight.w7:
        screenWeightedWidth = area.width * 0.7;
        break;

      //80% of width
      case sizingWeight.w8:
        screenWeightedWidth = area.width * 0.8;
        break;

      //90% of width
      case sizingWeight.w9:
        screenWeightedWidth = area.width * 0.9;
        break;

      //100% of width
      case sizingWeight.w10:
        screenWeightedWidth = area.width;
        break;
    }

    return screenWeightedWidth;
  }

  /// Returns a maximum width accounting for padding,
  /// given how many rows, and depending on device type.
  double layoutItemWidth(int sections, Size area) {
    double sizingWidth = 0.0;

    if (sections == 1) {
      //item needs to be full width with w1 padding

      isDesktopDisplay(area) == false
          ? sizingWidth = area.width * 0.90
          : sizingWidth = area.width * 0.60;
    } else if (sections == 2) {
      //item needs to be 1/2 width for 2 sections

      isDesktopDisplay(area) == false
          ? sizingWidth = area.width * 0.45
          : sizingWidth = area.width * 0.30;
    } else if (sections == 3) {
      //item needs to be 1/3 width for 3 sections
      isDesktopDisplay(area) == false
          ? sizingWidth = area.width * 0.33
          : sizingWidth = area.width * 0.12;
    } else if (sections == 4) {
      //item needs to be 1/4 width for 4 sections
      isDesktopDisplay(area) == false
          ? sizingWidth = area.width * 0.24
          : sizingWidth = area.width * 0.092;
    } else if (sections == 5) {
      //item needs to be 1/5 width for 5 sections
      isDesktopDisplay(area) == false
          ? sizingWidth = area.width * 0.21
          : sizingWidth = area.width * 0.080;
    }
    return sizingWidth;
  }

  // returns a maximum height accounting for padding, given how many columns,
  // and depending on device type.
  double layoutItemHeight(int sections, Size area) {
    double sizingHeight = 0.0;

    if (sections == 1) {
      //item needs to be full height with w1 padding

      isDesktopDisplay(area) == false
          ? sizingHeight = area.height * 0.80
          : sizingHeight = area.height * 0.806;
    } else if (sections == 2) {
      //item needs to be 1/2 height for 2 sections

      isDesktopDisplay(area) == false
          ? sizingHeight = area.height * 0.43
          : sizingHeight = area.height * 0.397;
    } else if (sections == 3) {
      //item needs to be 1/3 height for 3 sections
      isDesktopDisplay(area) == false
          ? sizingHeight = area.height * 0.287
          : sizingHeight = area.height * 0.264;
    } else if (sections == 4) {
      //item needs to be 1/4 height for 4 sections
      isDesktopDisplay(area) == false
          ? sizingHeight = area.height * 0.216
          : sizingHeight = area.height * 0.195;
    } else if (sections == 5) {
      //item needs to be 1/5 height for 5 sections
      isDesktopDisplay(area) == false
          ? sizingHeight = area.height * 0.168
          : sizingHeight = area.height * 0.155;
    } else if (sections <= 6) {
      //item needs to be 1/5 height for 5 sections

      isDesktopDisplay(area) == false
          ? sizingHeight = area.height * 0.100
          : sizingHeight = area.height * 0.097;
    }

    return sizingHeight;
  }
}
