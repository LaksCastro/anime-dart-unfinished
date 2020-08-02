import 'package:anime_dart/get_it.dart';
import 'package:anime_dart/store/barrel.dart';
import 'package:flutter/material.dart';

import "package:anime_dart/models/barrel.dart";
import "package:anime_dart/components/barrel.dart";
import 'package:flutter_mobx/flutter_mobx.dart';

class AnimeDetails extends StatefulWidget {
  final AnimeDetailsArgs args;

  AnimeDetails({this.args});

  @override
  _AnimeDetailsState createState() => _AnimeDetailsState(args: args);
}

class _AnimeDetailsState extends State<AnimeDetails> {
  final AnimeDetailsArgs args;
  final animeDetailsController = getIt<AnimeDetailsController>();

  _AnimeDetailsState({this.args});

  @override
  void initState() {
    super.initState();

    print("A AnimeDetails Page foi criada");

    animeDetailsController.loadDetails(args.animeId);
  }

  void dispose() {
    animeDetailsController.dispose();

    print("A AnimeDetails Page foi desmontada");

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Observer(builder: (_) {
          if (animeDetailsController.loading) {
            return Text(args.title);
          }

          return Text(animeDetailsController.details.title);
        })),
        body: Observer(builder: (_) {
          if (animeDetailsController.loading) {
            return Center(child: CircularProgressIndicator());
          }

          List<Widget> body = [];

          body.add(AnimeDetailsHeader(details: animeDetailsController.details));
          body.add(AnimeDetailsEpisodes(
              episodes: animeDetailsController.details.episodes));

          return SingleChildScrollView(
            child: Container(
                child: Column(
              children: body,
            )),
          );
        }),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            onPressed: () {},
            child: Icon(Icons.favorite, color: Colors.red[700])));
  }
}
