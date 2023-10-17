
class Address {
  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geometry,
  });
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geometry geometry;
}

class Geometry {
  const Geometry({
    required this.lat,
    required this.lng,
  });
  final double lat;
  final double lng;
}

class Company {
  const Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });
  final String name;
  final String catchPhrase;
  final String bs;
}

class User {
  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
  final String id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;
}

class ListUser {
  List<User> users;
  ListUser({required this.users});
}
