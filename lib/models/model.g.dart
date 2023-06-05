// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class studentmodelAdapter extends TypeAdapter<studentmodel> {
  @override
  final int typeId = 1;

  @override
  studentmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return studentmodel(
      name: fields[1] as String,
      age: fields[2] as String,
      phonenumber: fields[3] as String,
      place: fields[4] as String,
      photo: fields[5] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, studentmodel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.phonenumber)
      ..writeByte(4)
      ..write(obj.place)
      ..writeByte(5)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is studentmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
