import 'package:social/network/models/item_model.dart';

import 'movies_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllFeeds() => moviesApiProvider.fetchAllFeeds();
  Future<ItemModel> fetchFeedDetailBasedOnId(String id) => moviesApiProvider.fetchFeedDetailBasedOnId(id);

}
