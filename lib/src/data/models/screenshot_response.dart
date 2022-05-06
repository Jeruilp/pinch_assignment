import 'dart:convert';

ScreenshotResponse screenshotResponseFromJson(String str) => ScreenshotResponse.fromJson(json.decode(str));
class ScreenshotResponse {
  ScreenshotResponse({
    this.id,
    this.imageId,
    this.url,
  });

  int id; 
  String imageId; 
  String url; 

  factory ScreenshotResponse.fromJson(Map<String, dynamic> json) =>
    ScreenshotResponse(
      id      : json["id"],
      imageId : json["image_id"],
      url     : json["url"]    
    );

}