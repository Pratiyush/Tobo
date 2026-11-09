// Palette guard (owner rule: no Claude colours — pinkish coral, salmon,
// peach, terracotta, pink). Same HSL bands as the hub's
// tools/colour-audit.mjs, applied to every hex colour in lib/, comments
// included, so a banned colour can't come back unnoticed.
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/theme/app_theme.dart';

(double, double, double) _hsl(int rgb) {
  final r = (rgb >> 16 & 255) / 255, g = (rgb >> 8 & 255) / 255;
  final b = (rgb & 255) / 255;
  final mx = max(r, max(g, b)), mn = min(r, min(g, b));
  final l = (mx + mn) / 2, d = mx - mn;
  if (d == 0) return (0, 0, l);
  final s = d / (1 - (2 * l - 1).abs());
  var h = mx == r
      ? ((g - b) / d) % 6
      : mx == g
      ? (b - r) / d + 2
      : (r - g) / d + 4;
  h *= 60;
  if (h < 0) h += 360;
  return (h, s, l);
}

String? _claudeish(int rgb) {
  final (h, s, l) = _hsl(rgb);
  final warm = h >= 345 || h <= 32, pink = h >= 300 && h < 345;
  if (warm && s >= 0.35 && l >= 0.50 && l <= 0.93) return 'coral/salmon/peach';
  if (h >= 5 && h <= 32 && s >= 0.35 && s <= 0.80 && l >= 0.38 && l < 0.50) {
    return 'terracotta';
  }
  if (pink && s >= 0.30 && l >= 0.45 && l <= 0.93) return 'pink';
  return null;
}

double _luminance(Color c) => c.computeLuminance();

double _contrast(Color a, Color b) {
  final (x, y) = (_luminance(a), _luminance(b));
  return (max(x, y) + 0.05) / (min(x, y) + 0.05);
}

void main() {
  test('no Claude-like colour anywhere in lib/ (code or comments)', () {
    final hex = RegExp(r'(?:0x[Ff]{2}|#)([0-9A-Fa-f]{6})\b');
    final hits = <String>[];
    for (final f in Directory('lib').listSync(recursive: true)) {
      if (f is! File || !f.path.endsWith('.dart')) continue;
      final lines = f.readAsLinesSync();
      for (var i = 0; i < lines.length; i++) {
        for (final m in hex.allMatches(lines[i])) {
          final band = _claudeish(int.parse(m.group(1)!, radix: 16));
          if (band != null) hits.add('${f.path}:${i + 1} #${m.group(1)} $band');
        }
      }
    }
    expect(hits, isEmpty);
  });

  test('flag red is deep and saturated, not pinkish', () {
    final (_, s, l) = _hsl(AppColors.die.toARGB32() & 0xFFFFFF);
    expect(s, greaterThan(0.8));
    expect(l, lessThanOrEqualTo(0.47));
    expect(AppColors.red, AppColors.die, reason: 'errors use the flag red');
  });

  test('text on the palette keeps WCAG AA contrast', () {
    expect(_contrast(AppColors.ink, AppColors.orange), greaterThan(4.5));
    expect(_contrast(Colors.white, AppColors.die), greaterThan(4.5));
    expect(_contrast(AppColors.orangeInk, Colors.white), greaterThan(4.5));
    expect(_contrast(AppColors.greenInk, Colors.white), greaterThan(4.5));
    expect(_contrast(AppColors.ink, AppColors.green), greaterThan(4.5));
  });
}
