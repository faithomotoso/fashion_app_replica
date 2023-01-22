import 'package:flutter_riverpod/flutter_riverpod.dart';

// Show would display the search bar,
// Hide would display the search icon
enum SearchMode {
  show,
  hide;
}

final searchModeProvider =
    StateNotifierProvider<SearchModeNotifier, SearchMode>(
        (ref) => SearchModeNotifier());

class SearchModeNotifier extends StateNotifier<SearchMode> {
  SearchModeNotifier() : super(SearchMode.hide);

  void changeMode(SearchMode mode) {
    if (state != mode) {
      state = mode;
    }
  }
}
