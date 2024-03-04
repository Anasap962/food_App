// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BuyOrderModelAdapter extends TypeAdapter<BuyOrderModel> {
  @override
  final int typeId = 1;

  @override
  BuyOrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BuyOrderModel(
      image: fields[0] as String,
      itemname: fields[1] as String,
      price: fields[2] as String,
      name: fields[3] as String,
      number: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BuyOrderModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.itemname)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuyOrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
