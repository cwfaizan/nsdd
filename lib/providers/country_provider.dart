import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nsdd/errors/exceptions.dart';
import 'package:nsdd/models/country.dart';

import '../networks/network_client.dart';

class CountryProvider with ChangeNotifier {
  NetworkClient networkClient = NetworkClient();
  List<DropdownMenuItem<Country>> countries = [];

  void getCountries() async {
    try {
      final res = await networkClient.get('/countries');
      if (res.statusCode == 200) {
        Map<String, dynamic> mp = jsonDecode(res.toString());

        countries = (mp['data'] as List).map((e) {
          Country country = Country.fromJson(e);
          return DropdownMenuItem<Country>(
            value: country,
            child: Text(country.name),
          );
        }).toList();
        notifyListeners();
      }
    } on RemoteException catch (e) {
      Logger().e(e.dioError);
    }
  }
}
