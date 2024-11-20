import 'dart:async';
import 'dart:ui';

import 'package:dasar_flame/component/asteroidspawner.dart';
import 'package:dasar_flame/component/bgParallexComponent.dart';
import 'package:dasar_flame/component/ship.dart';
import 'package:flame/events.dart';

import 'package:flame/game.dart';

class MyFlameGame extends FlameGame with PanDetector {
  late Ship s;
  late Bgparallexcomponent bgParallax;
  late AsteroidSpawner asp;

  @override
  Color backgroundColor() {
    return const Color(0xFF000045);
  }

  @override
  FutureOr<void> onLoad() async {
    bgParallax = Bgparallexcomponent();
    add(bgParallax);

    s = Ship();
    add(s);

    asp = AsteroidSpawner();
    add(asp);
  }

  @override
  void update(double dt) {
    bgParallax.changeSpeedBasedShip(s);
    super.update(dt);
  }

  // @override
  // void onPanUpdate(DragUpdateInfo info) {
  //   s.position = info.eventPosition.global;
  // }

  @override
  void onPanUpdate(DragUpdateInfo info) => s.setTujuan(info);
}
