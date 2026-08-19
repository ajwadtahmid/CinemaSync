import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_opacity.dart';
import '../../core/theme/app_spacing.dart';
import '../models/media_type.dart';

/// A poster tile — the repeating unit of every browse surface.
///
/// Artwork is fetched straight from TMDB's CDN and disk-cached. Images are
/// never routed through the proxy: the proxy exists only to hold the API key,
/// and passing image traffic through it would turn a stateless forwarder into
/// something that sees every poster a user looks at.
class PosterCard extends StatelessWidget {
  const PosterCard({
    super.key,
    required this.title,
    required this.mediaType,
    this.posterPath,
    this.year,
    this.onTap,
    this.width = 120,
  });

  final String title;
  final MediaType mediaType;

  /// TMDB's relative path, e.g. `/abc123.jpg`. Null renders a placeholder.
  final String? posterPath;
  final int? year;
  final VoidCallback? onTap;
  final double width;

  /// TMDB image CDN base. Requests go here directly, never via the proxy.
  static const String _imageBase = 'https://image.tmdb.org/t/p';

  static String posterUrl(String path, {String size = 'w342'}) =>
      '$_imageBase/$size$path';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final subtitle = [mediaType.label, if (year != null) '$year'].join(' · ');

    return Semantics(
      button: onTap != null,
      label: '$title, $subtitle',
      child: ExcludeSemantics(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.md),
          child: SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 2 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    child: posterPath == null
                        ? _placeholder(cs)
                        : CachedNetworkImage(
                            imageUrl: posterUrl(posterPath!),
                            fit: BoxFit.cover,
                            placeholder: (_, _) => _placeholder(cs),
                            errorWidget: (_, _, _) => _placeholder(cs),
                          ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _placeholder(ColorScheme cs) {
    return ColoredBox(
      color: cs.surfaceContainerHigh,
      child: Center(
        child: Icon(
          mediaType == MediaType.movie ? Icons.movie_outlined : Icons.tv,
          color: AppColors.forMedia(mediaType)
              .withValues(alpha: AppOpacity.borderFaint),
        ),
      ),
    );
  }
}
