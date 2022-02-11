import 'package:artisan/core/api/payment/payment_api.dart';
import 'package:artisan/views/onboarding/data/model/payment/deposit_response/deposit_response.dart';
import 'package:artisan/views/onboarding/data/model/payment/overview_payment_response/overview_payment_response.dart';
import 'package:artisan/views/onboarding/data/model/payment/transaction_response/transaction_response.dart';
import 'package:artisan/views/onboarding/domain/entity/deposit_entity.dart';
import 'package:artisan/views/onboarding/domain/source/payment_source.dart';

class PaymentSourceImpl implements PaymentSource {
  final PaymentApi _api;

  PaymentSourceImpl({required PaymentApi api}) : _api = api;

  @override
  Future<DepositResponse> depositPayment(DepositEntity entity) async {
    return await _api.depositPayment(entity);
  }

  @override
  Future<OverViewPaymentResponse> overviewPayment() async {
    return await _api.overviewPayment();
  }

  @override
  Future<TransactionResponse> transactionPayment() async {
    return await _api.transactionPayment();
  }
}
