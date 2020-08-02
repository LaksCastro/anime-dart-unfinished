import 'package:get_it/get_it.dart';

import "package:anime_dart/store/barrel.dart";

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<LatestController>(LatestController());
  getIt.registerSingleton<WatchEpisodeController>(WatchEpisodeController());
  getIt.registerSingleton<SearchController>(SearchController());
  getIt.registerSingleton<AnimeDetailsController>(AnimeDetailsController());
}
