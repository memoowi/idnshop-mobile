class FAQData {
  final String question;
  final String answer;

  FAQData({required this.question, required this.answer});

  static List<FAQData> getFAQs() {
    return [
      FAQData(
          question: "What categories of products does IDNShop sell?",
          answer:
              "We offer a wide range of products across various categories, including clothing, home essentials, electronics, and more! You can explore all our categories on The Homepage or the main navigation bar of our website."),
      FAQData(
          question: "Can I add items to my cart without creating an account?",
          answer:
              "Unfortunately, you cannot add items to your cart as a guest user. However, creating an account also allows you to save your shipping information for faster checkout in the future, track your orders, and manage your account details."),
      FAQData(
          question: "What are the different payment methods available?",
          answer:
              "We offer a variety of secure payment methods to suit your convenience via the payment gateway of MidTrans."),
      FAQData(
          question: "What are the shipping costs?",
          answer:
              "Shipping costs are calculated based on the weight and destination of your order. We handle this approximate shipping cost via third-party services called Raja Ongkir. You can see the estimated shipping cost during checkout before finalizing your purchase."),
      FAQData(
          question: "Do you offer free shipping?",
          answer:
              "We may offer free shipping promotions from time to time. You can check for any ongoing promotions on our website or during checkout."),
      FAQData(
          question: "How long does it take to receive my order?",
          answer:
              "Delivery times can vary depending on your location and the chosen shipping method. You will see the estimated delivery timeframe during checkout and receive a tracking number once your order is shipped."),
      FAQData(
          question: "Where can I track my order?",
          answer:
              "You can track your order by logging into your account and going to the \"Order History\" section."),
      FAQData(
          question: "What is your return policy?",
          answer:
              "We offer a return or exchange policy within [Number] days of receiving your order. You can find the detailed return policy on our website or contact our customer support for more information."),
      FAQData(
          question: "What items are eligible for return or exchange?",
          answer:
              "Most items are eligible for return or exchange, with some exceptions (e.g., personalized items, used items). Please refer to our return policy for details."),
      FAQData(
          question: "How do I return or exchange an item?",
          answer:
              "To initiate a return or exchange, please contact our customer support team through the website or phone number provided. They will guide you through the process."),
      FAQData(
          question: "How can I contact customer support?",
          answer:
              "You can contact our friendly customer support team through the following options:\n* Live chat on our website during business hours.\n* Email us at [email protected]\n* Call us at [phone number] (if available)."),
      FAQData(
          question: "What are your customer support hours?",
          answer:
              "Our customer support team is available [mention hours of operation] [mention time zone, if necessary]."),
      FAQData(
          question: "Is your website secure?",
          answer:
              "Yes, our website uses secure encryption technology to protect your personal information and transactions."),
      FAQData(
          question: "Do you offer gift cards?",
          answer:
              "Unfortunately, gift cards are not yet available at this time. We appreciate your understanding."),
    ];
  }
}
