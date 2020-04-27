class Car {
  int id;
  String name;
  String type;
  String description;
  String urlPicture;
  String urlVideo;
  String latitude;
  String longitude;

  Car({
    this.id,
    this.name,
    this.type,
    this.description,
    this.urlPicture,
    this.urlVideo,
    this.latitude,
    this.longitude,
  });

  Car.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        name = map['nome'],
        type = map['tipo'],
        description = map['descricao'],
        urlPicture = map['urlFoto'],
        urlVideo = map['urlVideo'],
        latitude = map['latitude'],
        longitude = map['longitude'];
}
