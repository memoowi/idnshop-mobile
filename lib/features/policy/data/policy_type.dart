enum PolicyType {
  privacyPolicy('assets/html/privacy_policy.html'),
  termsOfUse('assets/html/terms_of_use.html'),
  shippingAndDeliveryPolicy('assets/html/shipping_and_delivery_policy.html'),
  returnPolicy('assets/html/return_policy.html');

  final String data;
  const PolicyType(this.data);
}
