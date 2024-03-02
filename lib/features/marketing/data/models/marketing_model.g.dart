// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketing_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarketingModelAdapter extends TypeAdapter<MarketingModel> {
  @override
  final int typeId = 3;

  @override
  MarketingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MarketingModel(
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
  void write(BinaryWriter writer, MarketingModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.demografi)
      ..writeByte(2)
      ..write(obj.target)
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
      other is MarketingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
