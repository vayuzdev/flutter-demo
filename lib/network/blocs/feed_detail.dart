import 'package:rxdart/rxdart.dart';
import 'package:social/network/models/item_model.dart';

import '../base.dart';

class FeedDetailBloc extends BaseBloc<ItemModel> {

  Observable<ItemModel> get postDetail => fetcher.stream;

  fetchFeedDetailBasedOnId(String id) async {
    ItemModel itemModel = await repository.fetchFeedDetailBasedOnId(id);
    fetcher.sink.add(itemModel);
  }
}

final feedDetailBloc = FeedDetailBloc();