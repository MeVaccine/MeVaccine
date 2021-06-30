// ignore_for_file: file_names
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:mevaccine/model/httpException.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/personProvider.dart' as PersonProvider;
import '../config/string.dart';
import 'package:dio/dio.dart';
import 'package:mevaccine/config/api.dart';

class LocationDateTime {
  DateTime startDateTime;
  DateTime endDateTime;
  int capacity;
  int avaliable;

  LocationDateTime({
    required this.startDateTime,
    required this.endDateTime,
    required this.capacity,
    required this.avaliable,
  });
}

class VaccinableVaccine {
  String id;
  String name;
  VaccinableVaccine({required this.id, required this.name});
}

class NewAppointmentProvider with ChangeNotifier {
  final List<Map<String, String>> _dataProvince = [
    {"TH": "กรุงเทพมหานคร", "EN": "Bangkok"},
    {"TH": "สมุทรปราการ", "EN": "Samut Prakan"},
    {"TH": "นนทบุรี", "EN": "Nonthaburi"},
    {"TH": "ปทุมธานี", "EN": "Pathum Thani"},
    {"TH": "พระนครศรีอยุธยา", "EN": "Phra Nakhon Si Ayutthaya"},
    {"TH": "อ่างทอง", "EN": "Ang Thong"},
    {"TH": "ลพบุรี", "EN": "Loburi"},
    {"TH": "สิงห์บุรี", "EN": "Sing Buri"},
    {"TH": "ชัยนาท", "EN": "Chai Nat"},
    {"TH": "สระบุรี", "EN": "Saraburi"},
    {"TH": "ชลบุรี", "EN": "Chon Buri"},
    {"TH": "ระยอง", "EN": "Rayong"},
    {"TH": "จันทบุรี", "EN": "Chanthaburi"},
    {"TH": "ตราด", "EN": "Trat"},
    {"TH": "ฉะเชิงเทรา", "EN": "Chachoengsao"},
    {"TH": "ปราจีนบุรี", "EN": "Prachin Buri"},
    {"TH": "นครนายก", "EN": "Nakhon Nayok"},
    {"TH": "สระแก้ว", "EN": "Sa Kaeo"},
    {"TH": "นครราชสีมา", "EN": "Nakhon Ratchasima"},
    {"TH": "บุรีรัมย์", "EN": "Buri Ram"},
    {"TH": "สุรินทร์", "EN": "Surin"},
    {"TH": "ศรีสะเกษ", "EN": "Si Sa Ket"},
    {"TH": "อุบลราชธานี", "EN": "Ubon Ratchathani"},
    {"TH": "ยโสธร", "EN": "Yasothon"},
    {"TH": "ชัยภูมิ", "EN": "Chaiyaphum"},
    {"TH": "อำนาจเจริญ", "EN": "Amnat Charoen"},
    {"TH": "หนองบัวลำภู", "EN": "Nong Bua Lam Phu"},
    {"TH": "ขอนแก่น", "EN": "Khon Kaen"},
    {"TH": "อุดรธานี", "EN": "Udon Thani"},
    {"TH": "เลย", "EN": "Loei"},
    {"TH": "หนองคาย", "EN": "Nong Khai"},
    {"TH": "มหาสารคาม", "EN": "Maha Sarakham"},
    {"TH": "ร้อยเอ็ด", "EN": "Roi Et"},
    {"TH": "กาฬสินธุ์", "EN": "Kalasin"},
    {"TH": "สกลนคร", "EN": "Sakon Nakhon"},
    {"TH": "นครพนม", "EN": "Nakhon Phanom"},
    {"TH": "มุกดาหาร", "EN": "Mukdahan"},
    {"TH": "เชียงใหม่", "EN": "Chiang Mai"},
    {"TH": "ลำพูน", "EN": "Lamphun"},
    {"TH": "ลำปาง", "EN": "Lampang"},
    {"TH": "อุตรดิตถ์", "EN": "Uttaradit"},
    {"TH": "แพร่", "EN": "Phrae"},
    {"TH": "น่าน", "EN": "Nan"},
    {"TH": "พะเยา", "EN": "Phayao"},
    {"TH": "เชียงราย", "EN": "Chiang Rai"},
    {"TH": "แม่ฮ่องสอน", "EN": "Mae Hong Son"},
    {"TH": "นครสวรรค์", "EN": "Nakhon Sawan"},
    {"TH": "อุทัยธานี", "EN": "Uthai Thani"},
    {"TH": "กำแพงเพชร", "EN": "Kamphaeng Phet"},
    {"TH": "ตาก", "EN": "Tak"},
    {"TH": "สุโขทัย", "EN": "Sukhothai"},
    {"TH": "พิษณุโลก", "EN": "Phitsanulok"},
    {"TH": "พิจิตร", "EN": "Phichit"},
    {"TH": "เพชรบูรณ์", "EN": "Phetchabun"},
    {"TH": "ราชบุรี", "EN": "Ratchaburi"},
    {"TH": "กาญจนบุรี", "EN": "Kanchanaburi"},
    {"TH": "สุพรรณบุรี", "EN": "Suphan Buri"},
    {"TH": "นครปฐม", "EN": "Nakhon Pathom"},
    {"TH": "สมุทรสาคร", "EN": "Samut Sakhon"},
    {"TH": "สมุทรสงคราม", "EN": "Samut Songkhram"},
    {"TH": "เพชรบุรี", "EN": "Phetchaburi"},
    {"TH": "ประจวบคีรีขันธ์", "EN": "Prachuap Khiri Khan"},
    {"TH": "นครศรีธรรมราช", "EN": "Nakhon Si Thammarat"},
    {"TH": "กระบี่", "EN": "Krabi"},
    {"TH": "พังงา", "EN": "Phangnga"},
    {"TH": "ภูเก็ต", "EN": "Phuket"},
    {"TH": "สุราษฎร์ธานี", "EN": "Surat Thani"},
    {"TH": "ระนอง", "EN": "Ranong"},
    {"TH": "ชุมพร", "EN": "Chumphon"},
    {"TH": "สงขลา", "EN": "Songkhla"},
    {"TH": "สตูล", "EN": "Satun"},
    {"TH": "ตรัง", "EN": "Trang"},
    {"TH": "พัทลุง", "EN": "Phatthalung"},
    {"TH": "ปัตตานี", "EN": "Pattani"},
    {"TH": "ยะลา", "EN": "Yala"},
    {"TH": "นราธิวาส", "EN": "Narathiwat"},
    {"TH": "บึงกาฬ", "EN": "Buogkan"}
  ];

  String _token;
  String selectedProvince = "";
  int selectedDateTimeIndex = -1;
  DateTime selectedDate = DateTime(2021, 7, 1);
  List<Location> locations = [];
  List<PersonProvider.Person> selectedPerson = [];
  List<List<VaccinableVaccine>> vaccinableVaccine = [];
  List<String> selectedVaccine = [];
  List<LocationDateTime> locationDateime = [];
  Location? selectedLocation = null;

  NewAppointmentProvider(this._token);

  List<Map<String, String>> get provinces => [..._dataProvince];

  void setSelectedLocation(Location location) {
    selectedLocation = location;
    selectedProvince = location.province_en;
    notifyListeners();
  }

  Future<void> setSelectedProvince(String province) async {
    selectedProvince = province;
    await getLocationByProvince(false);
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
      selectedLocation = locations[0];
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

  selectPerson(PersonProvider.Person person) {
    selectedPerson.add(person);
    notifyListeners();
  }

  removePerson(PersonProvider.Person person) {
    selectedPerson.removeWhere((ele) => ele.id == person.id);
    notifyListeners();
  }

  bool isPersonSelected(PersonProvider.Person person) {
    return selectedPerson.indexWhere((ele) => ele.id == person.id) != -1
        ? true
        : false;
  }

  Future<void> getDateTimeOfLocation(String date) async {
    try {
      final response = await Dio().get(
          apiEndpoint + '/location/dateTime/${selectedLocation!.id}',
          queryParameters: {'date': date},
          options: Options(headers: {"Authorization": "Bearer " + _token}));
      final data = response.data.toList();
      List<LocationDateTime> tempDateTime = [];
      for (var dateTime in data) {
        tempDateTime.add(
          LocationDateTime(
              startDateTime:
                  DateTime.parse(dateTime['startDateTime']).toLocal(),
              endDateTime: DateTime.parse(dateTime['endDateTime']).toLocal(),
              capacity: dateTime['capacity'],
              avaliable: dateTime['avaliable']),
        );
      }
      locationDateime = tempDateTime;
      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException(incorrectAuthException);
      }
      throw HttpException(error.response!.data);
    }
  }

  Future<DateTime> getEarliestDateTimeOfLocation() async {
    try {
      final response = await Dio().get(
          apiEndpoint + '/location/dateTime/earliest/${selectedLocation!.id}',
          options: Options(headers: {"Authorization": "Bearer " + _token}));
      final data = response.data.toList();
      List<LocationDateTime> tempDateTime = [];
      for (var dateTime in data) {
        tempDateTime.add(
          LocationDateTime(
              startDateTime:
                  DateTime.parse(dateTime['startDateTime']).toLocal(),
              endDateTime: DateTime.parse(dateTime['endDateTime']).toLocal(),
              capacity: dateTime['capacity'],
              avaliable: dateTime['avaliable']),
        );
      }
      locationDateime = tempDateTime;
      selectedDate = locationDateime[0].startDateTime;
      notifyListeners();
      return locationDateime[0].startDateTime;
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException(incorrectAuthException);
      }
      throw HttpException(error.response!.data);
    }
  }

  void selectDateTime(int index) {
    selectedDateTimeIndex = index;
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  Future<void> getVaccineForSelectedPerson() async {
    try {
      List<String> selectedPersonIds = selectedPerson.map((e) => e.id).toList();

      final response = await Dio().put(
          apiEndpoint + '/appointment/vaccine/${selectedLocation!.id}',
          data: selectedPersonIds,
          options: Options(headers: {"Authorization": "Bearer " + _token}));
      final data = response.data.toList();
      List<List<VaccinableVaccine>> tempVaccinableVaccine = [];
      for (var vaccinesOfPerson in data) {
        final vaccinesData = vaccinesOfPerson.toList();
        List<VaccinableVaccine> tempVaccineOfPerson = [];
        for (var vaccine in vaccinesData) {
          tempVaccineOfPerson.add(
              VaccinableVaccine(id: vaccine['_id'], name: vaccine['name']));
        }
        tempVaccinableVaccine.add(tempVaccineOfPerson);
        selectedVaccine.add(tempVaccineOfPerson[0].name);
      }
      vaccinableVaccine = tempVaccinableVaccine;
      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException(incorrectAuthException);
      }
      throw HttpException(error.response!.data);
    }
  }

  Future<void> createNewAppointment() async {
    try {
      print({
        'locationId': selectedLocation!.id,
        'dateTime': locationDateime[selectedDateTimeIndex]
            .startDateTime
            .toUtc()
            .toIso8601String(),
        'person': selectedPerson
            .map((person) => {
                  'id': person.id,
                  'vaccine': selectedVaccine[
                      selectedPerson.indexWhere((el) => el.id == person.id)]
                })
            .toList()
      });
      final response = await Dio().post(apiEndpoint + '/appointment/new',
          options: Options(headers: {"Authorization": "Bearer " + _token}),
          data: {
            'locationId': selectedLocation!.id,
            'dateTime': locationDateime[selectedDateTimeIndex]
                .startDateTime
                .toUtc()
                .toIso8601String(),
            'person': selectedPerson
                .map((person) => {
                      'id': person.id,
                      'vaccine': selectedVaccine[
                          selectedPerson.indexWhere((el) => el.id == person.id)]
                    })
                .toList()
          });
      print(response.data);
      resetData();
      // notifyListeners();
    } on DioError catch (error) {
      print(error.response!.data);
      if (error.response!.statusCode == 400) {
        throw HttpException(incorrectAuthException);
      }
      throw HttpException(error.response!.data);
    }
  }

  void selectVaccine(int index, String vaccineName) {
    selectedVaccine[index] = vaccineName;
    notifyListeners();
  }

  void resetSelectedDateTimeIndex() {
    selectedDateTimeIndex = -1;
    notifyListeners();
  }

  void resetSelectedVaccine() {
    selectedVaccine = [];
  }

  void resetData() {
    print('Invoke Reset Data');
    String selectedProvince = "";
    int selectedDateTimeIndex = -1;
    DateTime selectedDate = DateTime(2021, 7, 1);
    List<Location> locations = [];
    List<PersonProvider.Person> selectedPerson = [];
    List<List<VaccinableVaccine>> vaccinableVaccine = [];
    List<String> selectedVaccine = [];
    List<LocationDateTime> locationDateime = [];
    Location selectedLocation = Location(
      id: '',
      name_en: '',
      name_th: '',
      priority: 0,
      province_en: '',
      province_th: '',
    );
  }
}
