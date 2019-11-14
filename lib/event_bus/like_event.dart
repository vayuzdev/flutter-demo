class LikeEvent {
  bool _b;
  String _postId;

  LikeEvent(String postId, bool b) {
    this._b = b;
    this._postId = postId;
  }

  String get postId => _postId;

  set postId(String value) {
    _postId = value;
  }

  bool get b => _b;

  set b(bool value) {
    _b = value;
  }
}
