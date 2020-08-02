import "package:anime_dart/models/barrel.dart";
import 'package:anime_dart/services/anime_tv_api.dart';

class AnimeDetailsProvider {
  static final _animeTvApi = AnimeTvApi();

  Future<AnimeDetails> detailsOf(String animeId) async {
    try {
      final animeDetailsData =
          await AnimeDetailsProvider._animeTvApi.detailsOf(animeId);

      AnimeDetails animeDetails;

      final animeEpisodesData =
          await AnimeDetailsProvider._animeTvApi.episodesOf(animeId);

      animeDetails = AnimeDetails(
        description: animeDetailsData.description,
        title: animeDetailsData.title,
        genres: animeDetailsData.genres.replaceAll(" ", "").split(","),
        episodes: animeEpisodesData,
        id: animeDetailsData.id,
        imageUrl: animeDetailsData.imageUrl,
        year: animeDetailsData.year,
      );

      return animeDetails;
    } catch (e) {
      return null;
    }
  }
}
