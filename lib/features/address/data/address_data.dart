class AddressData {
  final String name;
  final String phoneNumber;
  final String address;
  final String district;
  final String city;
  final String province;
  final String country;
  final String postalCode;
  final bool isDefault;
  final String otherDetails;

  AddressData({
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.district,
    required this.city,
    required this.province,
    required this.country,
    required this.postalCode,
    required this.isDefault,
    required this.otherDetails,
  });

  static List<AddressData> getData() {
    return [
      AddressData(
        name: 'John Doe',
        phoneNumber: '08123456789',
        address: 'Jl. Kebon Jeruk No. 10',
        district: 'Kebon Jeruk',
        city: 'Jakarta Barat',
        province: 'DKI Jakarta',
        country: 'Indonesia',
        postalCode: '11510',
        isDefault: true,
        otherDetails: '',
      ),
      AddressData(
        name: 'Jane Doe',
        phoneNumber: '08123456789',
        address: 'Jl. Kebon Jeruk No. 10',
        district: 'Kebon Jeruk',
        city: 'Jakarta Barat',
        province: 'DKI Jakarta',
        country: 'Indonesia',
        postalCode: '11510',
        isDefault: false,
        otherDetails: '',
      ),
      AddressData(
        name: 'John Doe',
        phoneNumber: '08123456789',
        address: 'Jl. Kebon Jeruk No. 10',
        district: 'Kebon Jeruk',
        city: 'Jakarta Barat',
        province: 'DKI Jakarta',
        country: 'Indonesia',
        postalCode: '11510',
        isDefault: false,
        otherDetails: '',
      ),
      AddressData(
        name: 'John Doe',
        phoneNumber: '08123456789',
        address: 'Jl. Kebon Jeruk No. 10',
        district: 'Kebon Jeruk',
        city: 'Jakarta Barat',
        province: 'DKI Jakarta',
        country: 'Indonesia',
        postalCode: '11510',
        isDefault: false,
        otherDetails: '',
      ),
    ];
  }
}
