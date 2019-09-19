import 'package:rxdart/rxdart.dart';
import 'package:social/network/models/item_model.dart';

import '../base.dart';

class FeedListBloc extends BaseBloc<ItemModel> {

  Observable<ItemModel> get movieList => fetcher.stream;

  fetchFeedDetails() async {
    ItemModel itemModel = await repository.fetchAllFeeds();
    fetcher.sink.add(itemModel);
  }
}

final feedListingBloc = FeedListBloc();