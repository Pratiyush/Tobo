// UI text that isn't a plain key: renderers for values from the pure-Dart
// layers (levels, grammar hints, the Daily Hive share text), so lib/games
// and lib/models never import Flutter or the generated localizations.
import 'package:flutter/widgets.dart';

import '../games/daily.dart';
import '../games/gender_rules.dart';
import '../models/level.dart';
import '../services/reminders.dart';
import 'app_localizations.dart';

export 'app_localizations.dart';

extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// "Beginner", "Elementary"… in the UI language.
String levelName(AppLocalizations l, Level level) => switch (level) {
  Level.a1 => l.levelBeginner,
  Level.a2 => l.levelElementary,
  Level.b1 => l.levelIntermediate,
  Level.b2 => l.levelUpperIntermediate,
};

/// "All levels in sequence", or the chosen codes: "A2 + B1".
String levelChoiceLabel(AppLocalizations l, LevelChoice choice) =>
    choice.sequence
    ? l.levelAllInSequence
    : [for (final level in choice.active) level.label].join(' + ');

String genderHintText(AppLocalizations l, GenderHint hint) => switch (hint) {
  PluralOnlyHint() => l.rulePluralOnly,
  CompoundHint(:final head) => l.ruleCompound(head),
  SuffixHint(:final suffix, :final article) => l.ruleSuffix(suffix, article),
};

/// ★★☆: the same in every language.
String starText(int stars) => '${'★' * stars}${'☆' * (3 - stars)}';

/// "Wortschatz Daily Hive · 9 Nov · A1 · ★★★ · no hints", in the UI language.
String dailyShareText(
  AppLocalizations l,
  DailyHive day, {
  required int stars,
  required int hints,
}) => l.dailyShare(
  day.day,
  day.level.label,
  starText(stars),
  l.dailyHints(hints),
);

ReminderTexts reminderTexts(AppLocalizations l) => ReminderTexts(
  body: l.reminderBody,
  channel: l.reminderChannel,
  channelDescription: l.reminderChannelDesc,
);
