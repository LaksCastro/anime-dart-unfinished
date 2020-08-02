import 'package:anime_dart/models/barrel.dart';
import 'package:flutter/material.dart';

import "package:anime_dart/components/anime_details_episodes_tile.dart";

class AnimeDetailsEpisodes extends StatelessWidget {
  final List<EpisodeInfo> episodes;

  AnimeDetailsEpisodes({Key key, this.episodes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 30),
        itemCount: episodes.length,
        itemBuilder: (BuildContext context, int index) {
          final episode = episodes[index];
          return AnimeDetailsEpisodesTile(episode: episode);
        },
        separatorBuilder: (BuildContext context, int index) =>
            Container(height: 20));
  }
}
