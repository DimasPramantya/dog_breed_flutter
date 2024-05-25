class Breed {
  final String id;
  final String type;
  final Attributes attributes;
  final Relationships relationships;

  Breed({
    required this.id,
    required this.type,
    required this.attributes,
    required this.relationships,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      id: json['id'],
      type: json['type'],
      attributes: Attributes.fromJson(json['attributes']),
      relationships: Relationships.fromJson(json['relationships']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'attributes': attributes.toJson(),
      'relationships': relationships.toJson(),
    };
  }
}

class Attributes {
  final String name;
  final String description;
  final Life life;
  final Weight maleWeight;
  final Weight femaleWeight;
  final bool hypoallergenic;

  Attributes({
    required this.name,
    required this.description,
    required this.life,
    required this.maleWeight,
    required this.femaleWeight,
    required this.hypoallergenic,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      name: json['name'],
      description: json['description'],
      life: Life.fromJson(json['life']),
      maleWeight: Weight.fromJson(json['male_weight']),
      femaleWeight: Weight.fromJson(json['female_weight']),
      hypoallergenic: json['hypoallergenic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'life': life.toJson(),
      'male_weight': maleWeight.toJson(),
      'female_weight': femaleWeight.toJson(),
      'hypoallergenic': hypoallergenic,
    };
  }
}


class Life {
  final int max;
  final int min;

  Life({
    required this.max,
    required this.min,
  });

  factory Life.fromJson(Map<String, dynamic> json) {
    return Life(
      max: json['max'],
      min: json['min'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'max': max,
      'min': min,
    };
  }
}


class Weight {
  final int max;
  final int min;

  Weight({
    required this.max,
    required this.min,
  });

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      max: json['max'],
      min: json['min'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'max': max,
      'min': min,
    };
  }
}


class Relationships {
  final Group group;

  Relationships({
    required this.group,
  });

  factory Relationships.fromJson(Map<String, dynamic> json) {
    return Relationships(
      group: Group.fromJson(json['group']['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'group': {
        'data': group.toJson(),
      },
    };
  }
}

class Group {
  final String id;
  final String type;

  Group({
    required this.id,
    required this.type,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
    };
  }
}
