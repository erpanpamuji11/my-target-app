// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BusinessModelAdapter extends TypeAdapter<BusinessModel> {
  @override
  final int typeId = 2;

  @override
  BusinessModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BusinessModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as DateTime,
      fields[4] as DateTime,
      fields[5] as DateTime,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BusinessModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.strategi)
      ..writeByte(2)
      ..write(obj.modal)
      ..writeByte(3)
      ..write(obj.startDate)
      ..writeByte(4)
      ..write(obj.endDate)
      ..writeByte(5)
      ..write(obj.timeStamp)
      ..writeByte(6)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
