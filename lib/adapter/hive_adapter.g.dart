// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataBaseAdapter extends TypeAdapter<DataBase> {
  @override
  final int typeId = 0;

  @override
  DataBase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataBase(
      id: fields[8] as int?,
      about: fields[5] as String?,
      isBought: fields[6] as bool,
      count: fields[7] as int?,
      type: fields[1] as int?,
      categoryId: fields[0] as int?,
      image: fields[2] as String?,
      name: fields[3] as String?,
      price: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, DataBase obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.categoryId)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.about)
      ..writeByte(6)
      ..write(obj.isBought)
      ..writeByte(7)
      ..write(obj.count)
      ..writeByte(8)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataBaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
