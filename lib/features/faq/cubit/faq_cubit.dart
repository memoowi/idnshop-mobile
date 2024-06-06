import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnshop/features/faq/data/faq_data.dart';

class FaqCubit extends Cubit<List<FAQData>?> {
  FaqCubit() : super(null);

  Future<void> loadFaq() async {
    final data = await Future.delayed(const Duration(milliseconds: 1800), () {
      return FAQData.getFAQs();
    });

    emit(data);
  }
}
