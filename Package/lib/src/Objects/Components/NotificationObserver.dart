import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Objects}
/// {@image <image alt='' src=''>}

/// An observer pattern that links to the main scaffold
/// of the container view in order to show alert controllers,
/// in-app notifications, and more.
var notificationMaster = Master();

class Master {
  Observer? _currentObserver;

  void registerObserver(Observer observer) {
    _currentObserver = observer;
  }

  void unregisterObserver(Observer observer) {
    _currentObserver = null;
  }

  void throwUnregisteredObserverError() {
    throw ("A current observer has not been registered.");
  }

  void resetRequests() {
    _currentObserver != null
        ? _currentObserver!.resetRequests()
        : throwUnregisteredObserverError();
  }

  /// Shows an alert controller over the container view.
  void sendAlertControllerRequest(AlertControllerObject data) {
    // Checks that a current observer is registered before moving
    _currentObserver != null
        ? _currentObserver!.showAlertController(data)
        : throwUnregisteredObserverError();
  }

  /// Shows a content warning request
  void sendContentWarningRequest(String description, IconData icon) {
    _currentObserver != null
        ? _currentObserver!.showContentWarning(description, icon)
        : throwUnregisteredObserverError();
  }

  /// Sends an alert notification request
  void sendAlertNotificationRequest(String description, IconData icon) {
    _currentObserver != null
        ? _currentObserver!.showDropdownNotification(description, icon)
        : throwUnregisteredObserverError();
  }

  /// Shows a bottom action controller (aka an 'action sheet')
  void showBottomActionController(AlertControllerObject data) {
    _currentObserver != null
        ? _currentObserver!.showBottomActionController(data)
        : throwUnregisteredObserverError();
  }
}

mixin Observer {
  void resetRequests() {}
  void showAlertController(AlertControllerObject data) {}
  void showContentWarning(String description, IconData icon) {}
  void showDropdownNotification(String description, IconData icon) {}
  void showBottomActionController(AlertControllerObject data) {}
}
