import 'dart:convert';

class Drink {
  String idDrink;
  String strDrink;
  String? strCategory;
  String? strAlcoholic;
  String? strGlass;
  String? strInstructions;
  String? strDrinkThumb;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strTags;
  String? strVideo;
  String? strIBA;
  String? strInstructionsES;
  String? strInstructionsDE;
  String? strInstructionsFR;
  String? strInstructionsIT;
  String? strInstructionsZH_HANS;
  String? strInstructionsZH_HANT;
  String? strImageSource;
  String? strImageAttribution;
  String? strCreativeCommonsConfirmed;
  String? dateModified;
  String? strDrinkAlternate; // New optional field

  Drink({
    required this.idDrink,
    required this.strDrink,
    this.strCategory,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strDrinkThumb,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strTags,
    this.strVideo,
    this.strIBA,
    this.strInstructionsES,
    this.strInstructionsDE,
    this.strInstructionsFR,
    this.strInstructionsIT,
    this.strInstructionsZH_HANS,
    this.strInstructionsZH_HANT,
    this.strImageSource,
    this.strImageAttribution,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
    this.strDrinkAlternate,
  });

  Map<String, dynamic> toJson() {
    return {
      'idDrink': idDrink,
      'strDrink': strDrink,
      'strCategory': strCategory,
      'strAlcoholic': strAlcoholic,
      'strGlass': strGlass,
      'strInstructions': strInstructions,
      'strDrinkThumb': strDrinkThumb,
      'strIngredient1': strIngredient1,
      'strIngredient2': strIngredient2,
      'strIngredient3': strIngredient3,
      'strIngredient4': strIngredient4,
      'strMeasure1': strMeasure1,
      'strMeasure2': strMeasure2,
      'strMeasure3': strMeasure3,
      'strMeasure4': strMeasure4,
      'strTags': strTags,
      'strVideo': strVideo,
      'strIBA': strIBA,
      'strInstructionsES': strInstructionsES,
      'strInstructionsDE': strInstructionsDE,
      'strInstructionsFR': strInstructionsFR,
      'strInstructionsIT': strInstructionsIT,
      'strInstructionsZH_HANS': strInstructionsZH_HANS,
      'strInstructionsZH_HANT': strInstructionsZH_HANT,
      'strImageSource': strImageSource,
      'strImageAttribution': strImageAttribution,
      'strCreativeCommonsConfirmed': strCreativeCommonsConfirmed,
      'dateModified': dateModified,
      'strDrinkAlternate': strDrinkAlternate,
    };
  }

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
      idDrink: json['idDrink'],
      strDrink: json['strDrink'],
      strCategory: json['strCategory'],
      strAlcoholic: json['strAlcoholic'],
      strGlass: json['strGlass'],
      strInstructions: json['strInstructions'],
      strDrinkThumb: json['strDrinkThumb'],
      strIngredient1: json['strIngredient1'],
      strIngredient2: json['strIngredient2'],
      strIngredient3: json['strIngredient3'],
      strIngredient4: json['strIngredient4'],
      strMeasure1: json['strMeasure1'],
      strMeasure2: json['strMeasure2'],
      strMeasure3: json['strMeasure3'],
      strMeasure4: json['strMeasure4'],
      strTags: json['strTags'],
      strVideo: json['strVideo'],
      strIBA: json['strIBA'],
      strInstructionsES: json['strInstructionsES'],
      strInstructionsDE: json['strInstructionsDE'],
      strInstructionsFR: json['strInstructionsFR'],
      strInstructionsIT: json['strInstructionsIT'],
      strInstructionsZH_HANS: json['strInstructionsZH_HANS'],
      strInstructionsZH_HANT: json['strInstructionsZH_HANT'],
      strImageSource: json['strImageSource'],
      strImageAttribution: json['strImageAttribution'],
      strCreativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
      dateModified: json['dateModified'],
      strDrinkAlternate: json['strDrinkAlternate'],
    );
  }
}
