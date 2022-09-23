/// data : [{"id":1,"name":"beatae","address":"182 Misael Greens Suite 459\nWest Kim, CT 57048"},{"id":2,"name":"voluptatem","address":"558 Mekhi Extensions Suite 808\nNorth Ariannamouth, TX 21989"},{"id":3,"name":"molestiae","address":"3673 Althea Canyon\nSouth Lennaview, NJ 96851-7250"},{"id":4,"name":"optio","address":"410 Lorenzo Rest Apt. 114\nSouth Fredrickland, NY 53586-3697"},{"id":5,"name":"odio","address":"5198 Hickle Mountains\nSouth Ethylshire, NY 99483-1979"},{"id":6,"name":"deserunt","address":"565 Tom Islands Suite 181\nOlsonfort, WV 36270"},{"id":7,"name":"voluptatum","address":"183 Gislason Loaf Apt. 572\nJocelynshire, MS 97344-0173"},{"id":8,"name":"quia","address":"67819 Keon Canyon Apt. 119\nBrooksmouth, CO 13603-4660"},{"id":9,"name":"et","address":"4781 Steuber Streets\nPort Erica, RI 33860"},{"id":10,"name":"assumenda","address":"9531 Weimann Terrace\nPort Jackhaven, ME 36557-5983"}]

class StoresShowModel {
  StoresShowModel({
      List<Data>? data,}){
    _data = data;
}

  StoresShowModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "beatae"
/// address : "182 Misael Greens Suite 459\nWest Kim, CT 57048"

class Data {
  Data({
      int? id, 
      String? name, 
      String? address,}){
    _id = id;
    _name = name;
    _address = address;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
  }
  int? _id;
  String? _name;
  String? _address;

  int? get id => _id;
  String? get name => _name;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['address'] = _address;
    return map;
  }

}