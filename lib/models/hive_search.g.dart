// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_search.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchAdapter extends TypeAdapter<Search> {
  @override
  final int typeId = 1;

  @override
  Search read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Search(
      title: fields[0] as String?,
      year: fields[1] as String?,
      imdbId: fields[2] as String?,
      type: fields[3] as String?,
      poster: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Search obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.year)
      ..writeByte(2)
      ..write(obj.imdbId)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.poster);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
