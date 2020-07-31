import 'package:flutter/material.dart';

class WatchEpisodeArgs {
  final String episodeId;
  final String label;
  final String imageUrl;

  WatchEpisodeArgs(
      {@required this.episodeId,
      @required this.label,
      @required this.imageUrl});
}
