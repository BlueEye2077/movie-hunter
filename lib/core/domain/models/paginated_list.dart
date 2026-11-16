class PaginatedList<T> {
  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResultsItems;

  const PaginatedList({
    this.page = 1,
    this.results = const [],
    this.totalPages = 1,
    this.totalResultsItems = 0,
  });

  // Check if there are more pages available instead of using if condition in cubit
  bool get hasMore => page < totalPages;
}

