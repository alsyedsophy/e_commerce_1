import 'dart:async';

import 'package:flutter/widgets.dart';

/// Adapts a [Stream] into a [Listenable].
///
/// GoRouter's [GoRouter.refreshListenable] re-evaluates its redirect whenever
/// the listenable notifies. Wrapping the auth-state stream lets the route guard
/// react to sign-in / sign-out without holding a reference to the feature.
class StreamListenable extends ChangeNotifier {
  StreamListenable(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
