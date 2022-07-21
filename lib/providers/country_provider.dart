import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nsdd/models/country.dart';

import '../networks/api_service.dart';
import '../networks/network_client.dart';

class CountryProvider with ChangeNotifier {
  ApiService apiService = ApiService(
      networkClient: NetworkClient('https://hrm.talhasultan.dev/api/'));
  List<DropdownMenuItem<Country>> countries = [];

  Future<void> getCountriesFromAPI() async {
    final res = await apiService.getCountriesFromAPI();
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
}
