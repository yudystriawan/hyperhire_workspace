import 'package:injectable/injectable.dart';
import 'package:reviews/reviews.dart';

abstract class ReviewDatasource {
  Future<List<ReviewDto>> getTop3Products();
  Future<List<ReviewerDto>> getTop10Reviewers();
}

@Injectable(as: ReviewDatasource)
class ReviewDatasourceImpl implements ReviewDatasource {
  @override
  Future<List<ReviewerDto>> getTop10Reviewers() {
    // TODO: implement getTop10Reviewers
    throw UnimplementedError();
  }

  @override
  Future<List<ReviewDto>> getTop3Products() {
    // TODO: implement getTop3Products
    throw UnimplementedError();
  }
}
