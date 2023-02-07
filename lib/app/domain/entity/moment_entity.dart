// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MomentEntity {
  final int id;
  final String title;
  final String image;
  final String address;
  final String legend;
  final String date;
  final bool isFavorite;

  MomentEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.address,
    required this.legend,
    required this.date,
    required this.isFavorite,
  });

  MomentEntity copyWith({
    int? id,
    String? title,
    String? image,
    String? address,
    String? legend,
    String? date,
    bool? isFavorite,
  }) {
    return MomentEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      address: address ?? this.address,
      legend: legend ?? this.legend,
      date: date ?? this.date,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'address': address,
      'legend': legend,
      'date': date,
      'isFavorite': isFavorite,
    };
  }

  factory MomentEntity.fromMap(Map<String, dynamic> map) {
    return MomentEntity(
      id: map['id'] as int,
      title: map['title'] as String,
      image: map['image'] as String,
      address: map['address'] as String,
      legend: map['legend'] as String,
      date: map['date'] as String,
      isFavorite: map['isFavorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory MomentEntity.fromJson(String source) =>
      MomentEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MomentEntity(id: $id, title: $title, image: $image, address: $address, legend: $legend, date: $date, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(covariant MomentEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.image == image &&
        other.address == address &&
        other.legend == legend &&
        other.date == date &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        image.hashCode ^
        address.hashCode ^
        legend.hashCode ^
        date.hashCode ^
        isFavorite.hashCode;
  }
}
