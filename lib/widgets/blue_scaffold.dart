import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../l10n/l10n_ext.dart';

/// A scaffold on the blue gradient ground.
class BlueScaffold extends StatelessWidget {
  const BlueScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.onPop,
    this.bottom,
  });

  /// Pinned under the body, e.g. a banner ad on list screens.
  final Widget? bottom;

  final Widget body;
  final String? title;
  final List<Widget>? actions;

  /// Called when the screen is left, e.g. to stop speech.
  final VoidCallback? onPop;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) onPop?.call();
      },
      child: Container(
        decoration: const BoxDecoration(gradient: AppColors.background),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: title == null && actions == null
              ? null
              : AppBar(
                  title: title == null
                      ? null
                      : Text(
                          upperFor(title!, context.l10n.localeName),
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2,
                          ),
                        ),
                  actions: actions,
                ),
          body: SafeArea(top: title == null && actions == null, child: body),
          bottomNavigationBar: bottom == null
              ? null
              : SafeArea(top: false, child: bottom!),
        ),
      ),
    );
  }
}
