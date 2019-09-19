
import 'package:rxdart/rxdart.dart';
import 'package:social/network/repository/repository.dart';

import 'models/base_model.dart';

abstract class BaseBloc<T extends BaseModel> {
  final repository = Repository();
  final fetcher = PublishSubject<T>();

  dispose() {
    fetcher.close();
  }
}