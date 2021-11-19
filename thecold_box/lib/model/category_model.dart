import 'package:thecold_box/model/home_model.dart';

class CategoryFilter {
  var id1;
  bool isUsed;

  CategoryFilter({
    required this.id1,
    this.isUsed = false,
  });

  CategoryFilter copyWith({
    var value2,
    bool? isUsed,
  }) {
    return CategoryFilter(
      id1: value2 ?? this.id1,
      isUsed: isUsed ?? this.isUsed,
    );
  }

  @override
  List<Object?> get props => [
        id1,
        isUsed,
      ];

  //static List<CategoryFilter> filters = HomeModel.;
}
