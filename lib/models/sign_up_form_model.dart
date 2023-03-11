class SignupFormModel {
  String? name;
  String? KecamatanId;
  String? password;
  String? username;
  String? phone;
  String? type;
  String? province;
  String? city;
  String? ward;
  String? subdistrict;
  String? postal_code;
  String? address;
  String? image;

  SignupFormModel({
    this.KecamatanId,
    this.name,
    this.password,
    this.username,
    this.phone,
    this.type,
    this.province,
    this.city,
    this.ward,
    this.subdistrict,
    this.postal_code,
    this.address,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'Kecamatand': KecamatanId,
      'password': password,
      'username': username,
      'phone': phone,
      'type': type,
      'province': province,
      'city': city,
      'ward': ward,
      'subdistrict': subdistrict,
      'postal_code': postal_code,
      'address': address,
      'image': image
    };
  }

  SignupFormModel copyWith(
          {String? name,
          String? KecamatanId,
          String? password,
          String? username,
          String? phone,
          String? type,
          String? province,
          String? city,
          String? ward,
          String? subdistrict,
          String? postal_code,
          String? address,
          String? image}) =>
      SignupFormModel(
          name: name ?? this.name,
          KecamatanId :  KecamatanId ?? this.KecamatanId,
          password: password ?? this.password,
          username: username ?? this.username,
          phone: phone ?? this.phone,
          type: type ?? this.type,
          province: province ?? this.province,
          city: city ?? this.city,
          ward: ward ?? this.ward,
          subdistrict: subdistrict ?? this.subdistrict,
          postal_code: postal_code ?? this.postal_code,
          address: address ?? this.address,
          image: image ?? this.image);
}
