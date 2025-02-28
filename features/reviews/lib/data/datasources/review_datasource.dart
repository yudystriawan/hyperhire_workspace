import 'package:databases/databases.dart';
import 'package:injectable/injectable.dart';
import 'package:reviews/reviews.dart';

abstract class ReviewDatasource {
  Future<List<ReviewDto>> getTop3Products();
  Future<List<ReviewerDto>> getTop10Reviewers();
}

@Injectable(as: ReviewDatasource)
class ReviewDatasourceImpl implements ReviewDatasource {
  final LocalAssetLoader _db;

  ReviewDatasourceImpl(this._db);

  @override
  Future<List<ReviewerDto>> getTop10Reviewers() async {
    try {
      final data = await _db.load('reviewers.json');
      final reviewers =
          (data['data'] as List).map((e) => ReviewerDto.fromJson(e)).toList();
      reviewers.sort(
        (a, b) => b.user.reviewCount.compareTo(a.user.reviewCount),
      );
      return reviewers;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ReviewDto>> getTop3Products() {
    return Future.value(_reviews);
  }
}

final List<ReviewDto> _reviews = [
  // ReviewDto(
  //   id: '1',
  //   rating: 4.89,
  //   reviewCount: 216,
  //   product: ProductReviewDto(
  //     id: '1',
  //     name: 'LG전자 스탠바이미 27ART10AKPL (스탠드)',
  //     imageUrl: 'img_product_1.png',
  //   ),
  //   keywords: ['LG전자', '편리성'],
  //   reviewers: [
  //     ReviewerDto(
  //       userId: '1',
  //       content:
  //           '화면을 이동할 수 있고 전환도 편리하다는 점이 제일 마음에 들었어요. 배송도 빠르고 친절하게 받을 수 있어서 좋았습니다.',
  //       imageUrls: [],
  //       reviewCount: 1,
  //     ),
  //     ReviewerDto(
  //       userId: '2',
  //       content: '스탠바이미는 사랑입니다!️',
  //       imageUrls: [],
  //       reviewCount: 1,
  //     ),
  //   ],
  // ),
  // ReviewDto(
  //   id: '2',
  //   rating: 4.36,
  //   reviewCount: 136,
  //   product: ProductReviewDto(
  //     id: '2',
  //     name: 'LG전자  울트라HD 75UP8300KNA (스탠드)',
  //     imageUrl: 'img_product_2.png',
  //   ),
  //   keywords: ['LG전자', '고화질'],
  //   reviewers: [
  //     ReviewerDto(
  //       userId: '1',
  //       content: '화면 잘 나오고... 리모컨 기능 좋습니다.',
  //       imageUrls: [],
  //       reviewCount: 1,
  //     ),
  //     ReviewerDto(
  //       userId: '2',
  //       content:
  //           '넷플 아마존 등 버튼하나로 바로 접속 되고디스플레이는 액정문제 없어보이고소리는 살짝 약간 감이 있으나 ^^; 시끄러울까봐 그냥 블루투스 헤드폰 구매 예정이라 문제는 없네요. 아주 만족입니다!!',
  //       imageUrls: [],
  //       reviewCount: 1,
  //     ),
  //   ],
  // ),
  // ReviewDto(
  //   id: '3',
  //   rating: 3.98,
  //   reviewCount: 98,
  //   product: ProductReviewDto(
  //     id: '3',
  //     name: '라익미 스마트 DS4001L NETRANGE (스탠드)GX30K WIN10 (SSD 256GB)',
  //     imageUrl: 'img_product_3.png',
  //   ),
  //   keywords: ['라익미', '가성비'],
  //   reviewers: [
  //     ReviewerDto(
  //       userId: '1',
  //       content: '반응속도 및 화질이나 여러면에서도 부족함을  느끼기에는 커녕 이정도에 이 정도 성능이면 차고 넘칠만 합니다',
  //       imageUrls: [],
  //       reviewCount: 1,
  //     ),
  //     ReviewerDto(
  //       userId: '2',
  //       content:
  //           '중소기업TV 라익미 제품을 사용해보았는데 뛰어난 가성비와 더불어 OTT 서비스에 오픈 브라우저 까지 너무 마음에 들게끔 기능들을 사용 가능했고',
  //       imageUrls: [],
  //       reviewCount: 1,
  //     ),
  //   ],
  // ),
];
