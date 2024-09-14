class MainEmotionEntity {
  MainEmotionEntity({
    required this.id,
    required this.assetsPath,
    required this.name,
    required this.emotions,
  });
  final String name;
  final int id;
  //in Future replace to netPath
  final String assetsPath;
  final List<EmotionEntity> emotions;

  MainEmotionEntity copyWith({
    String? name,
    int? id,
    String? assetsPath,
    List<EmotionEntity>? emotions,
    bool? isSelected,
  }) {
    return MainEmotionEntity(
      id: id ?? this.id,
      assetsPath: assetsPath ?? this.assetsPath,
      name: name ?? this.name,
      emotions: emotions ?? this.emotions,
    );
  }
}

class EmotionEntity {
  //final bool isSelected;
  EmotionEntity({
    required this.name,
    //required this.isSelected,
  });

  EmotionEntity.withName(this.name);
  final String name; //isSelected = false;
}
