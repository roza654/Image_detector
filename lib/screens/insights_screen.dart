import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/enterprise/dairy_ai_showcase_carousel.dart';
import '../widgets/enterprise/responsive_layout.dart';

/// Marketing / education tab — AI dairy showcase carousel.
class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = ResponsiveLayout.pagePadding(context);

    return Container(
      decoration: AppColors.backgroundDecoration,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: padding.copyWith(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AI insights',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.textPrimary,
                          letterSpacing: -0.5,
                        ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'How Milk Mirror measures rear udder traits for local buffalo.',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: DairyAiShowcaseCarousel(modelReady: true),
            ),
          ],
        ),
      ),
    );
  }
}
