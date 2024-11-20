import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';

class Ship extends SpriteComponent with TapCallbacks {
  late Vector2 tujuan;
  late Vector2 arah;
  double speed = 3.0;

  Ship() {
    arah = Vector2(0, 0);
    tujuan = position;
  }

  void setTujuan(DragUpdateInfo info) {
    tujuan = info.eventPosition.global; //
    lookAt(tujuan); //
    angle += pi; //
    arah = tujuan - position; //
    arah = arah.normalized();
  }

  @override
  FutureOr<void> onLoad() async {
    //Onload ketika dibuka pertama kali atau direstart
    sprite = Sprite(await Flame.images.load('ships/spaceShips_001.png'));
    position = Vector2(100, 100); // 1 = width || 2 = height
    size = Vector2(50, 50); // Ukuran
    angle = -pi / 2; // Posisi Arah
    anchor = Anchor.center;
    // scale = Vector2(2, 1);
  }

  @override
  void update(double dt) {
    if ((tujuan - position).length < speed) {
      position = tujuan;
      arah = Vector2(0, 0);
    }
    position.add(arah * speed);

    super.update(dt);
  }

  //---------------Start-----------------//
  // Digunakan Untuk menggerakkan karakter //

  // @override
  // void update(double dt) {
  //   position.add(Vector2(1, 0));

  //   super.update(dt);
  // }

  //---------------End-----------------//
}
