import 'package:bloc/bloc.dart';
import 'package:idnshop/features/policy/data/policy_type.dart';
import 'package:idnshop/features/policy/data/policy_data_source.dart';

class PolicyCubit extends Cubit<String?> {
  final PolicyDataSource _dataSource;
  PolicyCubit(this._dataSource) : super(null);

  Future<void> loadPrivacyPolicy(PolicyType policyType) async {
    final data = await _dataSource.loadPolicy(policyType.data);
    Future.delayed(const Duration(milliseconds: 1800), () {
      emit(data);
    });
  }
}
