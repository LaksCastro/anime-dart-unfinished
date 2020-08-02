import "package:anime_dart/models/barrel.dart";
import 'package:anime_dart/screens/watch_episode.dart';
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

      List<EpisodeInfo> animeEpisodes = [];

      for (final animeEpisodeData in animeEpisodesData) {
        animeEpisodes.add(EpisodeInfo(
            animeId: animeEpisodeData.animeId,
            id: animeEpisodeData.id,
            label: animeEpisodeData.label,
            link: (_) => WatchEpisode(
                  args: WatchEpisodeArgs(
                      animeId: animeEpisodeData.animeId,
                      episodeId: animeEpisodeData.id,
                      label: animeEpisodeData.label,
                      imageUrl: animeDetailsData.imageUrl),
                )));
      }

      animeDetails = AnimeDetails(
        description: animeDetailsData.description,
        title: animeDetailsData.title,
        genres: animeDetailsData.genres.replaceAll(" ", "").split(","),
        episodes: animeEpisodes,
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
