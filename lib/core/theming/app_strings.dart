abstract final class AppStrings {
  // ── App ──
  static const String appName = 'Movie Hunter';

  // ── Home ──
  static const String helloGuestUser = 'Hello, guest ';
  static const String helloUser = 'Hello, ';
  static const String letsStream = "Let's stream your favorite movie";
  static const String seeAll = 'See All';
  static const String mostPopular = 'Most Popular';
  static const String nowPlaying = 'Now Playing';
  static const String topRated = 'Top Rated';

  // ── Auth ──
  static const String login = "Login";
  static const String welcomeTitle = "Welcome to Movie Hunter";
  static const String welcomeSubtitle =
      "Welcome back! Please enter your details.";
  static const String username = "Username";
  static const String emailAddress = "Email Address";
  static const String password = "Password";
  static const String forgotPassword = "Forgot Password?";
  static const String pleaseEnterUsername = "Please enter a valid username";
  static const String pleaseEnterPassword = "Please enter a valid password";
  static const String dontHaveAccount = "Don't have an account? ";
  static const String signUp = "Sign Up";
  static const String accountRegistration = "Account Registration";
  static const String tmdbRegistrationNotice =
      "To create an account, you must register directly on the TMDB website. Once registered, you can log in here using your new credentials.";
  static const String goToTmdbWebsite = "Go to TMDB Website";
  static const String backToLogin = "Back to Login";

  // ── Movie Details ──
  static const String storyLine = 'Story Line';
  static const String castAndCrew = 'Cast and Crew';
  static const String play = 'Play';
  static const String directors = 'Directors';
  static const String writers = 'Writers';
  static const String cast = 'Cast';
  static const String similarMovies = 'Similar Movies';
  static const String noSimilarMoviesFound = 'No similar movies found';
  static const String noTrailerAvailable =
      'No trailer available for this movie';
  static const String couldNotLaunchYoutube = 'Could not launch YouTube';
  static const String notAvailableDash = '—';

  static String shareMovieMessage(String title, String url) =>
      '🍿 Grab some popcorn! Check out "$title" on Movie Hunter! 🎬\n$url';

  // ── Search ──
  static const String cancel = 'Cancel';
  static const String actors = 'Actors';
  static const String movieRelated = 'Movie Related';
  static const String typeToSearch = 'Type to search...';
  static const String searchErrorTitle =
      "we are sorry, we can\nnot find the movie :(";
  static const String searchErrorSubtitle =
      'Find your movie by Type title,\ncategories, years, etc ';
  static const String anErrorOccurred = 'An error occurred.';
  static const String retry = 'Retry';

  // ── Fallback / Default Values ──
  static const String unknown = 'Unknown';
  static const String unknownGenre = 'Unknown Genre';
  static const String adultLabel = 'Adult 18+';
  static const String familyFriendly = 'Family Friendly';
  static const String languagePrefix = 'Language: ';

  // ── Profile ──
  static const String favorites = 'Favorites';
  static const String watchlist = 'Watchlist';
  static const String logout = 'Logout';
  static const String confirmLogout = 'Confirm Logout';
  static const String confirmLogoutMessage =
      'Are you sure you want to log out of your account?';
  static const String noFavorites = 'No favorites yet';
  static const String noFavoritesSubtitle = 'Movies you heart will appear here';
  static const String noWatchlist = 'Nothing saved yet';
  static const String noWatchlistSubtitle =
      'Add movies to your watchlist to watch them later';
  static const String failedToLoadFavorites = 'Failed to load favorite movies';
  static const String failedToLoadWatchlist = 'Failed to load watchlist movies';
  static const String sessionExpired =
      'Session expired. Please log in again.';

  // ── Person Details ──
  static const String biography = 'Biography';
  static const String noBiography = 'No biography available.';
  static const String readMore = 'Read more';
  static const String showLess = 'Show less';
  static const String knownFor = 'Known For';
  static const String noKnownMovies = 'No known movies found';

  static String yearsOld(int age) => '$age years old';
  static String diedAt(int age) => 'Died at $age';

  // ── Onboarding ──
  static const String onboardingTitle1 =
      'Welcome, Bestie. I hope you brought snacks.';
  static const String onboardingDesc1 =
      "Welcome to the big leagues. We’ve curated the best stories so you don't have to go on a space mission to find something good.";
  static const String onboardingTitle2 =
      'That feeling when the ads finally die.';
  static const String onboardingDesc2 =
      'We hate ads more than I hate Francis. Why let a commercial break your focus when you’re busy watching a beautiful mind solve the universe.';
  static const String onboardingTitle3 =
      'Resolution so high, you can see my regret.';
  static const String onboardingDesc3 =
      'Why watch in potato quality when you can see every single hair on Logan’s grumpy face? We’re talking visuals so crisp they’d make a friendly neighborhood spider dizzy.';

}
