import 'package:flutter/cupertino.dart';
import 'package:mmusuperapp/models/address_model.dart';

class AppInfo extends ChangeNotifier
{
  AddressModel? pickupLocation;
  AddressModel? dropOffLocation;

  void updatePickUpLocation(AddressModel pickUpModel)
  {
    pickupLocation = pickUpModel;
    notifyListeners();
  }

  void updateDropOffLocation(AddressModel dropOffModel)
  {
    dropOffLocation = dropOffModel;
    notifyListeners();
  }
}