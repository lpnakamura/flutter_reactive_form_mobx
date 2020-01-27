import 'package:mobx/mobx.dart';
part 'user_model.g.dart';

class UserModel = _UserModelBase with _$UserModel;

abstract class _UserModelBase with Store {
  @observable
  String name;
  @observable
  String email;
  @observable
  DateTime birthday;  
  
  @computed
  int get age {
    if(birthday != null) {
      Duration differenceWithCurrentDate = DateTime.now().difference(birthday);
      return (differenceWithCurrentDate.inDays / 365).floor();
    }

    return null;
  }

  _UserModelBase({this.name, this.email, this.birthday});
}
