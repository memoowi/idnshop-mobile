import 'package:flutter/services.dart';
import 'package:idnshop/features/policy/data/policy_data_source.dart';

class PolicyDataSourceImpl implements PolicyDataSource {
  @override
  Future<String> loadPolicy(String assetPath) async {
    return await rootBundle.loadString(assetPath);
  }
}
