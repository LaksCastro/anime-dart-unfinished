import 'package:anime_dart/models/episode_info.dart';
import 'package:flutter/material.dart';

class AnimeDetails {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final List<String> genres;
  final String year;
  final List<EpisodeInfo> episodes;

  AnimeDetails(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.description,
      @required this.genres,
      @required this.year,
      @required this.episodes});
}
