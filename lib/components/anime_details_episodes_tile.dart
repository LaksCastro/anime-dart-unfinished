import 'package:anime_dart/models/barrel.dart';
import 'package:flutter/material.dart';

class AnimeDetailsEpisodesTile extends StatelessWidget {
  final EpisodeInfo episode;

  AnimeDetailsEpisodesTile({Key key, this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: episode.link));
        },
        child: Container(
            alignment: Alignment.centerLeft,
            color: Colors.black.withOpacity(0.1),
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.all(20),
            child: Row(children: [
              Icon(Icons.play_arrow),
              Flexible(
                  child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(episode.label))),
            ])));
  }
}
