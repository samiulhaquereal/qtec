import 'package:ecommerce/src/app_config/imports/import.dart';
import 'package:fpdart/fpdart.dart';

class InitializeApp implements UseCase<bool, NoParams> {
  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return const Right(true);
    } catch (e) {
      return const Left(UnknownError("Failed to initialize app"));
    }
  }
}
