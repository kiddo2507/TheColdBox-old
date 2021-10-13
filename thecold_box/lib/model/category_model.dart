class CategoryFilter {
  var id;
  bool isUsed;

  CategoryFilter({
    required this.id,
    this.isUsed = false,
  });

  CategoryFilter copyWith({
    int? id,
    bool? isUsed,
  }) {
    return CategoryFilter(
      id: id ?? this.id,
      isUsed: isUsed ?? this.isUsed,
    );
  }

  @override
  List<Object?> get props => [
        id,
        isUsed,
      ];

  //static List<CategoryFilter> filters = HomeModel.id.map(());
}
