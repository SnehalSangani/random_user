import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:random_user/screen/home/model/home_Model.dart';
import 'package:random_user/screen/utils/api_helper.dart';

class Homeprovider extends ChangeNotifier
{
  int index=0;
  Future<RandomPerson> findperson()
  async {
    return await Apihelper().randomapi();
  }
  void changeindex()
  {
    Random random=Random();
    index=random.nextInt(5);
    notifyListeners();
  }

}