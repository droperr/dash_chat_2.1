part of dash_chat_2;

/// {@category Models}
class ChatMedia {
  ChatMedia({
    required this.url,
    required this.fileName,
    required this.type,
    this.metadata,
    this.isUploading = false,
    this.uploadedDate,
    this.customProperties = const <String, dynamic>{},
  });

  /// Create a ChatMedia instance from json data
  factory ChatMedia.fromJson(Map<String, dynamic> jsonData) {
    return ChatMedia(
      url: jsonData['url'].toString(),
      metadata: Metadata.fromJson(jsonData['metadata'] as Map<String, dynamic>),
      fileName: jsonData['fileName'].toString(),
      type: MediaType.parse(jsonData['type'].toString()),
      isUploading: jsonData['isUploading'] == true,
      uploadedDate: jsonData['uploadedDate'] != null
          ? DateTime.parse(jsonData['uploadedDate'].toString()).toLocal()
          : null,
      customProperties: jsonData['customProperties'] as Map<String, dynamic>,
    );
  }

  /// URL of the media, can local (will use FileImage) or remote (will use NetworkImage)
  String url;

  /// Name of the file that will be shown in some cases
  String fileName;

  /// Type of media
  MediaType type;

  /// Media metadata
  Metadata? metadata;

  /// If the media is still uploading, usefull to add a visual feedback
  bool isUploading;

  /// Uploaded date of the media
  DateTime? uploadedDate;

  /// A list of custom properties to extend the existing ones
  /// in case you need to store more things.
  /// Can be useful to extend existing features
  Map<String, dynamic>? customProperties;

  /// Convert a ChatMedia into a json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': url,
      'type': type.toString(),
      'fileName': fileName,
      'metadata': metadata?.toJson(),
      'isUploading': isUploading,
      'uploadedDate': uploadedDate?.toUtc().toIso8601String(),
      'customProperties': customProperties,
    };
  }
}

class Metadata {
  Metadata({
    this.thumbnail,
  });

  factory Metadata.fromJson(Map<String, dynamic> map) {
    return Metadata(
      thumbnail: map['thumbnail'] != null ? map['thumbnail'].toString() : '',
    );
  }

  String? thumbnail;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'thumbnail': thumbnail,
    };
  }
}

class MediaType {
  const MediaType._internal(this._value);
  final String _value;

  @override
  String toString() => _value;

  static MediaType parse(String value) {
    switch (value) {
      case 'image':
        return MediaType.image;
      case 'video':
        return MediaType.video;
      case 'audio':
        return MediaType.audio;
      default:
        throw UnsupportedError('$value is not a valid MediaType');
    }
  }

  static const MediaType image = MediaType._internal('image');
  static const MediaType video = MediaType._internal('video');
  static const MediaType audio = MediaType._internal('audio');
}
