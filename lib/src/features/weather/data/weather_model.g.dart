// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherModelAdapter extends TypeAdapter<WeatherModel> {
  @override
  final int typeId = 1;

  @override
  WeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherModel(
      city: fields[0] as String,
      temp: fields[1] as double,
      lat: fields[2] as double,
      lon: fields[3] as double,
      feelsLike: fields[4] as double,
      windSpeed: fields[5] as double,
      humidity: fields[6] as int,
      minTemp: fields[7] as double,
      maxTemp: fields[8] as double,
      icon: fields[9] as String,
      country: fields[10] as String,


     );
  }

  @override
  void write(BinaryWriter writer, WeatherModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.city)
      ..writeByte(1)
      ..write(obj.temp)
      ..writeByte(2)
      ..write(obj.lat)
      ..writeByte(3)
      ..write(obj.lon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
