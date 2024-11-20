import 'dart:async';
import 'dart:math' as math;
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

import 'asteroid.dart';

class AsteroidSpawner extends PositionComponent with HasGameRef {
  late SpawnComponent spawner;

  @override
  FutureOr<void> onLoad() async {
    math.Random r = math.Random();
    spawner = SpawnComponent(
      factory: (idx) {
        // factory = pabrik, digunakan untuk membuat atau memproduksi objek
        return Asteroid(ukuran: r.nextDouble() * 0.5 + 0.3);
      },
      period: 0.5, // Waktu untuk memproduksi objek baru (satuan detik)
      autoStart: true,
      area: Rectangle.fromLTWH(0, 0, game.size.x, game.size.y),
      // within: true,
    ); // Memulai pemproduksi objek secara otomatis

    game.add(spawner);
    return super.onLoad();
  }
}
