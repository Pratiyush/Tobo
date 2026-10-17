import 'dart:math';

/// A cell of a hexagonal grid in axial coordinates.
class Hex {
  const Hex(this.q, this.r);

  final int q;
  final int r;

  static const _directions = [
    Hex(1, 0),
    Hex(1, -1),
    Hex(0, -1),
    Hex(-1, 0),
    Hex(-1, 1),
    Hex(0, 1),
  ];

  Iterable<Hex> get neighbours => _directions.map((d) => Hex(q + d.q, r + d.r));

  int distanceTo(Hex other) {
    final dq = q - other.q;
    final dr = r - other.r;
    return (dq.abs() + dr.abs() + (dq + dr).abs()) ~/ 2;
  }

  bool isAdjacentTo(Hex other) => distanceTo(other) == 1;

  @override
  bool operator ==(Object other) =>
      other is Hex && other.q == q && other.r == r;

  @override
  int get hashCode => Object.hash(q, r);

  @override
  String toString() => 'Hex($q, $r)';
}

/// A honeycomb of letter tiles in which every target word can be traced as
/// a path of adjacent, unused tiles.
class HiveBoard {
  HiveBoard._(this.tiles, this.paths);

  /// The letter on each tile.
  final Map<Hex, String> tiles;

  /// One solution path per target word (lower case).
  final Map<String, List<Hex>> paths;

  /// Lays out [words] (lower case) as interlocking paths, packed around the
  /// centre. Returns null if they don't fit in [radius].
  static HiveBoard? layout(List<String> words, Random rng, {int radius = 3}) {
    const centre = Hex(0, 0);
    for (var attempt = 0; attempt < 60; attempt++) {
      final tiles = <Hex, String>{};
      final paths = <String, List<Hex>>{};
      var ok = true;
      for (final word in words) {
        final path = _place(word, tiles, rng, radius, centre);
        if (path == null) {
          ok = false;
          break;
        }
        for (var i = 0; i < path.length; i++) {
          tiles[path[i]] = word[i];
        }
        paths[word] = path;
      }
      if (ok) return HiveBoard._(tiles, paths);
    }
    return null;
  }

  /// Ranks free cells: next to existing tiles first, then near the centre.
  static List<Hex> _rank(
    Iterable<Hex> cells,
    Map<Hex, String> tiles,
    Random rng,
    Hex centre,
  ) {
    final scored = [
      for (final c in cells)
        (
          cell: c,
          score:
              c.neighbours.where(tiles.containsKey).length * 2 -
              c.distanceTo(centre) +
              rng.nextDouble() * 1.5,
        ),
    ]..sort((a, b) => b.score.compareTo(a.score));
    return [for (final s in scored) s.cell];
  }

  static List<Hex>? _place(
    String word,
    Map<Hex, String> tiles,
    Random rng,
    int radius,
    Hex centre,
  ) {
    bool free(Hex h) => !tiles.containsKey(h) && h.distanceTo(centre) <= radius;

    final starts = tiles.isEmpty
        ? [centre]
        : _rank(
            {for (final t in tiles.keys) ...t.neighbours.where(free)},
            tiles,
            rng,
            centre,
          );

    List<Hex>? extend(List<Hex> path) {
      if (path.length == word.length) return path;
      final next = _rank(
        path.last.neighbours.where((h) => free(h) && !path.contains(h)),
        tiles,
        rng,
        centre,
      );
      for (final h in next) {
        final result = extend([...path, h]);
        if (result != null) return result;
      }
      return null;
    }

    for (final s in starts.take(8)) {
      final path = extend([s]);
      if (path != null) return path;
    }
    return null;
  }
}

/// Whether [path] is a chain of distinct, adjacent tiles on [tiles].
bool isTraceable(List<Hex> path, Map<Hex, String> tiles) {
  if (path.toSet().length != path.length) return false;
  if (!path.every(tiles.containsKey)) return false;
  for (var i = 1; i < path.length; i++) {
    if (!path[i - 1].isAdjacentTo(path[i])) return false;
  }
  return true;
}

/// Picks up to [count] distinct words of 3–6 letters for one Hive round.
List<T> pickHiveWords<T>(
  List<T> pool,
  String Function(T) spelling,
  Random rng, {
  int count = 3,
}) {
  final candidates = pool.where((w) {
    final s = spelling(w);
    return s.length >= 3 && s.length <= 6;
  }).toList()..shuffle(rng);
  final picked = <T>[];
  final seen = <String>{};
  for (final w in candidates) {
    if (seen.add(spelling(w).toLowerCase())) picked.add(w);
    if (picked.length == count) break;
  }
  return picked;
}
