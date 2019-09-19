import 'base_model.dart';

class ItemModel extends BaseModel {
  String _message;
  int _status;

  List<FeedDetails> _feedDetails= [];


  String get message => _message;

  set message(String value) {
    _message = value;
  }

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['data'].length);
    _message = parsedJson['message'];
    _status = parsedJson['status'];
    List<FeedDetails> temp = [];
    for (int i = 0; i < parsedJson['data'].length; i++) {
      FeedDetails result = FeedDetails(parsedJson['data'][i]);
      temp.add(result);
    }
    _feedDetails = temp;
  }

  int get status => _status;

  set status(int value) {
    _status = value;
  }

  List<FeedDetails> get feedDetails => _feedDetails;

  set feedDetails(List<FeedDetails> value) {
    _feedDetails = value;
  }

}

class FeedDetails {
  String _companyName;
  String _jobProfile;
  int _minExperience;
  int _maxExperience;
  String _template;
  bool _post_liked;
//  List<UserDetails> _userDetails;

  String get companyName => _companyName;

  set companyName(String value) {
    _companyName = value;
  }

  String get jobProfile => _jobProfile;

  set jobProfile(String value) {
    _jobProfile = value;
  }

  int get minExperience => _minExperience;

  set minExperience(int value) {
    _minExperience = value;
  }

  int get maxExperience => _maxExperience;

  set maxExperience(int value) {
    _maxExperience = value;
  }

  String get template => _template;

  set template(String value) {
    _template = value;
  }


  FeedDetails(feedDetail) {
    _companyName = feedDetail['company_name'];
    _jobProfile = feedDetail['job_profile'];
    _minExperience = feedDetail['min_experience'];
    _maxExperience = feedDetail['max_experience'];
    template = feedDetail['template'];
    _post_liked= feedDetail['post_liked'];
//    userDetails = feedDetails['user_details'];
  }

  bool get post_liked => _post_liked;

  set post_liked(bool value) {
    _post_liked = value;
  }


}

class UserDetails {
  String _userName;
  String _userEmail;
  String _userImage;

  UserDetails(userDetails){
    _userName = userDetails['user_name'];
    _userEmail = userDetails['user_email'];
    _userImage = userDetails['user_image'];

  }
  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  String get userEmail => _userEmail;

  set userEmail(String value) {
    _userEmail = value;
  }

  String get userImage => _userImage;

  set userImage(String value) {
    _userImage = value;
  }


}
