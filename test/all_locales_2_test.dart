// Every screen fits a 360 dp phone in every language: shard 2 of 4
// (see all_locales_harness.dart; shards run on parallel test workers).
import 'all_locales_harness.dart';

void main() => runLocaleFitTests(shard: 1, shards: 4);
