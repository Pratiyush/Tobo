// Renders the app icon: three touching honeycomb cells in the article
// colours (der black, die red, das gold) on the app's blue. Original art,
// drawn in code, so it can be regenerated and tweaked.
//
//   flutter test tool/icon/render_icon_test.dart && tool/icon/make_icons.sh
//
// Writes build/icon/{icon_1024,foreground_432,launch_360}.png.
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/theme/app_theme.dart';

/// [radius] is the hex circumradius as a fraction of the canvas side.
class HexIconPainter extends CustomPainter {
  const HexIconPainter({required this.radius, required this.background});

  final double radius;
  final bool background;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    if (background) {
      canvas.drawRect(
        Offset.zero & size,
        Paint()
          ..shader = ui.Gradient.linear(Offset.zero, Offset(0, s), const [
            AppColors.blueTop,
            AppColors.blueBottom,
          ]),
      );
    }
    final r = radius * s;
    final centre = Offset(size.width / 2, size.height / 2);
    // Pointy-top neighbours: two on top, one below, all touching.
    final cells = [
      (Offset(-sqrt(3) / 2 * r, -0.75 * r), AppColors.der),
      (Offset(sqrt(3) / 2 * r, -0.75 * r), AppColors.die),
      (Offset(0, 0.75 * r), AppColors.das),
    ];
    final gap = r * 0.07;
    final corner = r * 0.16;
    for (final (offset, colour) in cells) {
      final c = centre + offset;
      final inner = r - gap - corner / 2;
      final path = Path();
      for (var i = 0; i < 6; i++) {
        final a = -pi / 2 + i * pi / 3;
        final p = c + Offset(cos(a), sin(a)) * inner;
        i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
      }
      path.close();
      // Fill plus a same-colour round-joined stroke = rounded corners.
      canvas
        ..drawPath(
          path.shift(Offset(0, r * 0.05)),
          Paint()..color = Colors.black.withValues(alpha: 0.18),
        )
        ..drawPath(path, Paint()..color = colour)
        ..drawPath(
          path,
          Paint()
            ..color = colour
            ..style = PaintingStyle.stroke
            ..strokeWidth = corner
            ..strokeJoin = StrokeJoin.round,
        );
    }
  }

  @override
  bool shouldRepaint(HexIconPainter old) => false;
}

Future<void> _render(
  WidgetTester tester,
  String name,
  int px,
  HexIconPainter painter,
) async {
  final key = GlobalKey();
  await tester.pumpWidget(
    Center(
      child: RepaintBoundary(
        key: key,
        child: SizedBox.square(
          dimension: px.toDouble(),
          child: CustomPaint(painter: painter),
        ),
      ),
    ),
  );
  await tester.runAsync(() async {
    final boundary =
        key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final image = await boundary.toImage();
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    final file = File('build/icon/$name.png')..createSync(recursive: true);
    file.writeAsBytesSync(bytes!.buffer.asUint8List());
  });
}

void main() {
  testWidgets('render icon', (tester) async {
    tester.view
      ..physicalSize = const Size(1200, 1200)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    // Full-bleed, opaque: iOS App Store icon and legacy Android icons.
    await _render(
      tester,
      'icon_1024',
      1024,
      const HexIconPainter(radius: 0.17, background: true),
    );
    // Android adaptive foreground: the cluster stays inside the 66/108 safe
    // zone; the background is @color/ic_launcher_background.
    await _render(
      tester,
      'foreground_432',
      432,
      const HexIconPainter(radius: 0.125, background: false),
    );
    // iOS launch screen image, on the storyboard's blue.
    await _render(
      tester,
      'launch_360',
      360,
      const HexIconPainter(radius: 0.25, background: false),
    );
  });
}
