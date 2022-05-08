class CoverResponse {
  final int id;
  final String imageId;

  CoverResponse(this.id, this.imageId);

  CoverResponse.fromJson(Map<String, dynamic> json)
   : id      = json["id"],
     imageId = json["image_id"];
}
