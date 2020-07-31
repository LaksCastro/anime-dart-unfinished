import 'package:anime_dart/components/resource_list.dart';

import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:anime_dart/store/latest_controller.dart';

import "package:anime_dart/get_it.dart";

class Latest extends StatefulWidget {
  @override
  _LatestState createState() => _LatestState();
}

class _LatestState extends State<Latest> {
  final latestController = getIt<LatestController>();

  @override
  void initState() {
    latestController.loadEpisodes();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Observer(builder: (_) {
      if (latestController.loading) {
        return Center(child: CircularProgressIndicator());
      }

      return ResourceList(
          resources: latestController.episodes.toList(),
          cardLabel: "LANÇAMENTOS",
          onRefresh: latestController.loadEpisodes);
    }));
  }
}
