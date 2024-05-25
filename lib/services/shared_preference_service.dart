import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static const String _favoriteBreedsKey = 'favoriteBreeds';

  // Load Favorite Breed IDs
  static Future<List<String>> loadFavoriteBreedIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoriteBreedsKey) ?? [];
  }

  // Toggle Favorite
  static Future<void> toggleFavorite(String breedId) async {
    List<String> favoriteBreedIds = await loadFavoriteBreedIds();

    if (favoriteBreedIds.contains(breedId)) {
      favoriteBreedIds.remove(breedId);
    } else {
      favoriteBreedIds.add(breedId);
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favoriteBreedsKey, favoriteBreedIds);
  }
}
