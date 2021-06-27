import 'package:flutter/foundation.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';

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

  Location selectedLocation = Location(
    id: '',
    name_en: '',
    name_th: '',
    priority: 0,
    province_en: '',
    province_th: '',
  );

  String selectedProvince = "";

  List<String> get provinces => [...this._dataprovince];

  void setSelectedLocation(Location location) {
    selectedLocation = location;
    selectedProvince = location.province_en;
    notifyListeners();
  }

  void setSelectedProvince(String province) {
    selectedProvince = province;
    notifyListeners();
  }
}
