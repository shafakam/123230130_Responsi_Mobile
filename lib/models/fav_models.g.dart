// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavModelsAdapter extends TypeAdapter<FavModels> {
  @override
  final int typeId = 0;

  @override
  FavModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavModels(
      id: fields[0] as int,
      titles: fields[1] as String,
      coverImage: fields[3] as String,
      averageRating: fields[2] as double,
      username: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavModels obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titles)
      ..writeByte(2)
      ..write(obj.averageRating)
      ..writeByte(3)
      ..write(obj.coverImage)
      ..writeByte(5)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
