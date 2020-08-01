import 'package:get_it/get_it.dart';

import "package:anime_dart/store/latest_controller.dart";
import "package:anime_dart/store/watch_episode_controller.dart";

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<LatestController>(LatestController());
  getIt.registerSingleton<WatchEpisodeController>(WatchEpisodeController());
}
