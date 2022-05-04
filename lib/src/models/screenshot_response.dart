import 'dart:convert';

ScreenshotResponse screenshotResponseFromJson(String str) => ScreenshotResponse.fromJson(json.decode(str));
class ScreenshotResponse {
  ScreenshotResponse({
    this.id,
    this.imageId
  });

  int id; 
  String imageId; 

  factory ScreenshotResponse.fromJson(Map<String, dynamic> json) =>
    ScreenshotResponse(
      id      : json["id"],
      imageId : json["image_id"]
    );

}