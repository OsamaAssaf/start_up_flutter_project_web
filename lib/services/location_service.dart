import 'dart:io';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../resources/components.dart';

class LocationService {
  LocationService._();
  static final instance = LocationService._();
  Future<Position?> getCurrentLocation(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;
    try {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.deniedForever) {
          if (Platform.isIOS) {
            return null;
          }
          if (context.mounted) {
            final Text title = Text(localizations.locationPermissionDenied);
            final Text content = Text(
                '${localizations.locationServiceMessage}\n\n${Platform.isIOS ? localizations.goToAppEnableLocationIos : localizations.goToAppEnableLocationAndroid}');
            final List<Widget> actions = [
              TextButton(
                onPressed: () async {
                  Get.back();
                },
                child: Text(localizations.ok),
              ),
            ];
            Components.showAdaptiveDialog(
              context: context,
              title: title,
              content: content,
              actions: actions,
            );
          }
          return null;
        }
        if (permission == LocationPermission.denied) {
          return null;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        if (context.mounted) {
          final Text title = Text(localizations.locationServiceDisabled);
          final Text content = Text(
              '${localizations.locationServiceMessage}\n\n${localizations.goToSettingsEnableLocation}');
          final List<Widget> actions = [
            TextButton(
              onPressed: () async {
                Get.back();
              },
              child: Text(localizations.ok),
            ),
          ];
          Components.showAdaptiveDialog(
            context: context,
            title: title,
            content: content,
            actions: actions,
          );
        }
        return null;
      }
      if (Platform.isIOS) {
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          if (context.mounted) {
            final Text title = Text(localizations.locationServiceDisabled);
            final Text content = Text(
                '${localizations.locationServiceMessage}\n\n${localizations.goToSettingsEnableLocation}');
            final List<Widget> actions = [
              TextButton(
                onPressed: () async {
                  Get.back();
                },
                child: Text(localizations.ok),
              ),
            ];
            Components.showAdaptiveDialog(
              context: context,
              title: title,
              content: content,
              actions: actions,
            );
          }
        }
      }
      Position position = await Geolocator.getCurrentPosition();
      return position;
    } catch (_) {
      return null;
    }
  }
}
