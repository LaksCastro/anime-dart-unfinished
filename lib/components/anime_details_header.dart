import 'package:anime_dart/models/anime_details.dart';
import 'package:anime_dart/services/anime_tv_api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeDetailsHeader extends StatelessWidget {
  final AnimeDetails details;

  AnimeDetailsHeader({Key key, @required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> genresWidgets = [];

    for (final genre in details.genres) {
      genresWidgets.add(Container(
          margin: EdgeInsets.only(right: 5, bottom: 5),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.all(5),
          child: Text(genre)));
    }

    return Container(
        color: Colors.black.withOpacity(.1),
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                width: 140,
                height: 200,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        httpHeaders: AnimeTvApi.httpHeaders,
                        imageUrl: details.imageUrl,
                        placeholder: (context, url) => Container(
                            width: 140,
                            height: 200,
                            color: Colors.purple.withOpacity(.10)),
                        errorWidget: (context, url, error) => Container(
                            width: 140,
                            height: 200,
                            color: Colors.black.withOpacity(.60))))),
            Flexible(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, left: 10),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(details.year,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 10, left: 10),
                                child: Text(details.title,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .fontSize)))
                          ])),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Wrap(children: genresWidgets))
                ]))
          ]),
          Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(details.description, style: TextStyle(height: 2)))
        ]));
  }
}
