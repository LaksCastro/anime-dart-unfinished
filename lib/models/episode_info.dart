import 'package:flutter/material.dart';

class EpisodeInfo {
  final String label;
  final String id;
  final String animeId;
  final Widget Function(BuildContext) link;

  EpisodeInfo(
      {@required this.label,
      @required this.id,
      @required this.animeId,
      @required this.link});
}
