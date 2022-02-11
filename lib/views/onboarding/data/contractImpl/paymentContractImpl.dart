import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/onboarding/data/model/payment/deposit_response/deposit_response.dart';
import 'package:artisan/views/onboarding/data/model/payment/overview_payment_response/overview_payment_response.dart';
import 'package:artisan/views/onboarding/data/model/payment/transaction_response/transaction_response.dart';
import 'package:artisan/views/onboarding/data/sourceImpl/paymentSourceImpl.dart';
import 'package:artisan/views/onboarding/domain/contract/payment_contract.dart';
import 'package:dartz/dartz.dart';

class PaymentContractImpl implements PaymentContract {
  final PaymentSourceImpl _impl;

  PaymentContractImpl(this._impl);

  @override
  Future<Either<Failure, DepositResponse>> depositPayment(entity) async {
    try {
      final _response = await _impl.depositPayment(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OverViewPaymentResponse>> overviewPayment() async {
    try {
      final _response = await _impl.overviewPayment();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionResponse>> transactionPayment() async {
    try {
      final _response = await _impl.transactionPayment();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
