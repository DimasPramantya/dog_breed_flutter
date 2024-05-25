import 'package:flutter/material.dart';
import 'package:latihan_responsi/services/shared_preference_service.dart';
import 'package:latihan_responsi/models/breed.dart';
import 'package:latihan_responsi/pages/meals/meal_detail.dart';
import 'package:latihan_responsi/services/api_service.dart';
import '../../utils/colors.dart';

class MealList extends StatefulWidget {
  const MealList({Key? key}) : super(key: key);

  @override
  State<MealList> createState() => _MealListState();
}

class _MealListState extends State<MealList> {
  List<Breed> breedList = [];
  List<String> favoriteBreedIds = [];
  final api = ApiService();
  String errorMessage = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadMealList();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    favoriteBreedIds = await SharedPreferenceService.loadFavoriteBreedIds();
    setState(() {
      breedList.sort((a, b) {
        // Move favorite breeds to the top
        if (favoriteBreedIds.contains(a.id) &&
            !favoriteBreedIds.contains(b.id)) {
          return -1;
        } else if (!favoriteBreedIds.contains(a.id) &&
            favoriteBreedIds.contains(b.id)) {
          return 1;
        } else {
          return 0;
        }
      });
    });
  }

  Future<void> toggleFavorite(String breedId) async {
    await SharedPreferenceService.toggleFavorite(breedId);
    _loadFavorites();
  }

  Future<void> loadMealList() async {
    try {
      final response = await api.getBreeds();
      final List<dynamic> mealJsonList = response['data'];
      setState(() {
        breedList =
            mealJsonList.map((mealJson) => Breed.fromJson(mealJson)).toList();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : Container(
                  color: whiteColor,
                  child: ListView.builder(
                    itemCount: breedList.length,
                    itemBuilder: (context, index) {
                      final breed = breedList[index];
                      final isFavorite = favoriteBreedIds.contains(breed.id);
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MealDetail(id: breed.id);
                              },
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(color: lightGreyColor),
                            ),
                          ),
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      breed.attributes.name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: darkBlueColor,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      breed.attributes.description,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: greyTextColor,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                ),
                                onPressed: () {
                                  toggleFavorite(breed.id);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
