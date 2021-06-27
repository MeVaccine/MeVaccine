// ignore_for_file: file_names
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:mevaccine/model/httpException.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import '../config/string.dart';
import 'package:dio/dio.dart';
import 'package:mevaccine/config/api.dart';

class NewAppointmentProvider with ChangeNotifier {
  List<String> _dataprovince = [
    'Bangkok',
    'Samut Prakan',
    'Nonthaburi',
    'Pathum Thani',
    'Phra Nakhon Si Ayutthaya',
    'Ang Thong',
    'Loburi',
    'Sing Buri',
    'Chai Nat',
    'Saraburi',
    'Chon Buri',
    'Rayong',
    'Chanthaburi',
    'Trat',
    'Chachoengsao',
    'Prachin Buri',
    'Nakhon Nayok',
    'Sa Kaeo',
    'Nakhon Ratchasima',
    'Buri Ram',
    'Surin',
    'Si Sa Ket',
    'Ubon Ratchathani',
    'Yasothon',
    'Chaiyaphum',
    'Amnat Charoen',
    'Nong Bua Lam Phu',
    'Khon Kaen',
    'Udon Thani',
    'Loei',
    'Nong Khai',
    'Maha Sarakham',
    'Roi Et',
    'Kalasin',
    'Sakon Nakhon',
    'Nakhon Phanom',
    'Mukdahan',
    'Chiang Mai',
    'Lamphun',
    'Lampang',
    'Uttaradit',
    'Phrae',
    'Nan',
    'Phayao',
    'Chiang Rai',
    'Mae Hong Son',
    'Nakhon Sawan',
    'Uthai Thani',
    'Kamphaeng Phet',
    'Tak',
    'Sukhothai',
    'Phitsanulok',
    'Phichit',
    'Phetchabun',
    'Ratchaburi',
    'Kanchanaburi',
    'Suphan Buri',
    'Nakhon Pathom',
    'Samut Sakhon',
    'Samut Songkhram',
    'Phetchaburi',
    'Prachuap Khiri Khan',
    'Nakhon Si Thammarat',
    'Krabi',
    'Phangnga',
    'Phuket',
    'Surat Thani',
    'Ranong',
    'Chumphon',
    'Songkhla',
    'Satun',
    'Trang',
    'Phatthalung',
    'Pattani',
    'Yala',
    'Narathiwat',
    'buogkan'
  ];

  String _token;
  String selectedProvince = "";
  List<Location> locations = [];
  Location selectedLocation = Location(
    id: '',
    name_en: '',
    name_th: '',
    priority: 0,
    province_en: '',
    province_th: '',
  );

  NewAppointmentProvider(this._token);

  List<String> get provinces => [..._dataprovince];

  void setSelectedLocation(Location location) {
    selectedLocation = location;
    selectedProvince = location.province_en;
    notifyListeners();
  }

  void setSelectedProvince(String province) {
    selectedProvince = province;
    notifyListeners();
  }

  void selectLocation(String locationId) {
    var locationIndex = locations.indexWhere((ele) => ele.id == locationId);
    if (locationIndex != -1) {
      selectedLocation = locations[locationIndex];
      notifyListeners();
    }
  }

  Future<void> getLocationByProvince(bool notify) async {
    try {
      final response = await Dio().get(apiEndpoint + '/location',
          queryParameters: {'province': selectedProvince},
          options: Options(headers: {"Authorization": "Bearer " + _token}));
      final data = response.data.toList();
      List<Location> locationLists = [];
      for (var location in data) {
        locationLists.add(Location(
          id: location['_id'],
          name_en: location['name_en'],
          name_th: location['name_th'],
          priority: location['priority'],
          province_en: location['province_en'],
          province_th: location['province_th'],
        ));
      }
      locations = locationLists;
      if (notify) notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 401) {
        throw HttpException(jwtException);
      }
    }
  }

  Future<void> getPreferedLocation() async {
    try {
      final response = await Dio().get(apiEndpoint + '/location/prefered',
          options: Options(headers: {"Authorization": "Bearer " + _token}));
      selectedLocation = Location(
        id: response.data['_id'],
        name_en: response.data['name_en'],
        name_th: response.data['name_th'],
        priority: response.data['priority'],
        province_en: response.data['province_en'],
        province_th: response.data['province_th'],
      );
      selectedProvince = response.data['province_en'];
      await getLocationByProvince(false);
      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException(incorrectAuthException);
      }
      throw HttpException('Failed to get data');
    }
  }
}
