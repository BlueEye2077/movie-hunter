import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollIndexCalculator {
  // App bar top padding
  static double get appBarTopPadding => 16.h;

  // ==========================================
  // List View Constants
  // ==========================================

  // The space between app bar and the first item
  static double get listViewItemVerticalPadding => 16.h;
  // The Height of the list view movie item [GeneralMovieItem]
  static double get listViewItemHeight => 147.h;

  // ==========================================
  // Grid View Constants
  // ==========================================

  static double get gridViewHorizontalPadding => 16.w;
  static double get gridViewHorizontalSeperator => 8.w;
  static int get gridViewRowItemsNumber => 3;
  static double get gridViewVerticalSeperator => 16.h;

  // ==========================================
  // List View Calculations
  // ==========================================

  static int getCurrentListViewScrollMovieIndex({
    required double maxScrollPixels,
    required int maxMoviesListIndex,
  }) {
    // Calculate the current index of the movie that is being scrolled
    // The formula is: (pixels - space between app bar and the first item) / (space between app bar and the first item + height of the list view movie item)
    // This will give us the exact index of the movie that is being scrolled
    return ((maxScrollPixels - appBarTopPadding) /
            (listViewItemVerticalPadding + listViewItemHeight))
        .floor()
        .clamp(0, maxMoviesListIndex);
  }

  static double getCurrentListViewScrollMovieOffset({
    required int scrolledMovieIndex,
  }) {
    // scroll to the movie that was scrolled on the previous screen
    // Reconverting the number of the index to a pixels
    return appBarTopPadding +
        (scrolledMovieIndex *
            (listViewItemHeight + listViewItemVerticalPadding));
  }

  // ==========================================
  // Grid View Calculations
  // ==========================================

  static double getGridViewRowHeight({required double fullScreenWidth}) {
    // Get the full width of the screen - the padding - the space between columns
    final double fullScreenWidthWithoutPadding =
        // MediaQuery.of(context).size.width - (32.w) - (16.w);
        fullScreenWidth -
        (2 * gridViewHorizontalPadding) -
        (2 * gridViewHorizontalSeperator);

    // Gets the width of a single movie by dividing it by the number of columns (3)
    final double singleMovieWidth =
        fullScreenWidthWithoutPadding / gridViewRowItemsNumber;

    // Gets the height of the movie using the aspect ratio of the grid (100 / 185)
    final double singleMovieHeight = singleMovieWidth * (185 / 100);

    // Gets the full row height by adding the spacing between rows (16.h)
    final double rowHeight = singleMovieHeight + gridViewVerticalSeperator;
    return rowHeight;
  }

  static int getCurrentGridViewScrollMovieIndex({
    required int maxMoviesListIndex,
    required double maxScrollPixels,
    required double fullScreenWidth,
  }) {
    double rowHeight = getGridViewRowHeight(fullScreenWidth: fullScreenWidth);

    // Gets the current row index (safeguarded against negative overscroll with clamp)
    final int rowIndex = ((maxScrollPixels - appBarTopPadding) / rowHeight)
        .floor()
        .clamp(0, maxMoviesListIndex);

    // Convert row index back to movie index (multiply by 3 columns) and clamp to safe bounds
    return (rowIndex * gridViewRowItemsNumber).clamp(0, maxMoviesListIndex);
  }

  static double getGridViewScrollMovieOffset({
    required int scrolledMovieIndex,
    required double fullScreenWidth,
  }) {
    final rowIndex = (scrolledMovieIndex / gridViewRowItemsNumber).floor();
    final offset =
        appBarTopPadding +
        (rowIndex * getGridViewRowHeight(fullScreenWidth: fullScreenWidth));
    return offset;
  }
}
