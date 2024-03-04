// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewFoodModelAdapter extends TypeAdapter<NewFoodModel> {
  @override
  final int typeId = 2;

  @override
  NewFoodModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewFoodModel(
      image: fields[0] as String,
      itemname: fields[1] as String,
      price: fields[2] as String,
      catagory: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NewFoodModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.itemname)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.catagory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewFoodModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
