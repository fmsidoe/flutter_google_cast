import 'package:google_cast/common/break.dart';
import 'package:google_cast/common/break_clips.dart';
import 'package:google_cast/common/hls_segment_format.dart';
import 'package:google_cast/common/hls_video_segment_format.dart';
import 'package:google_cast/common/text_track_style.dart';
import 'package:google_cast/entities/track.dart';
import 'package:google_cast/common/user_action_state.dart';
import 'package:google_cast/common/vast_ads_request.dart';
import 'package:google_cast/enums/stream_type.dart';

import 'media_metadata/cast_media_metadata.dart';

export 'package:google_cast/common/break.dart';
export 'package:google_cast/common/break_clips.dart';
export 'package:google_cast/common/hls_segment_format.dart';
export 'package:google_cast/common/hls_video_segment_format.dart';
export 'package:google_cast/common/text_track_style.dart';
export 'package:google_cast/entities/track.dart';
export 'package:google_cast/common/user_action_state.dart';
export 'package:google_cast/common/vast_ads_request.dart';
export 'package:google_cast/enums/stream_type.dart';

class GoogleCastMediaInformation {
  ///Alternate entity to be used to load the media in Android TV app.
  ///If set, this will override the value set in entity if the
  ///receiver is an Android TV app. On the receiver side, the
  ///entity can be accessed from MediaInfo#getEntity().
  final String? atvEntity;

  ///Partial list of break clips that includes current break clip
  /// that receiver is playing or ones that receiver will play
  ///  shortly after, instead of sending whole list of
  /// clips. This is to avoid overflow of MediaStatus message.
  final List<CastBreakClips>? breakClips;

  ///Service-specific identifier of the content currently loaded
  /// by the media player. This is a free form string and is specific
  ///  to the application. In most cases, this will be the URL to the
  ///  media, but the sender can choose to pass a string that the receiver can
  ///  interpret properly. Max length: 1k
  final String contentId;

  ///Describes the type of media artifact as one of the following:

  ///NONE
  ///BUFFERED
  ///LIVE
  final CastMediaStreamType streamType;

  ///MIME content type of the media being played
  final String contentType;

  ///The media metadata object, one of the following:

  ///0  GenericMediaMetadata
  ///1  MovieMediaMetadata
  ///2  TvShowMediaMetadata
  ///3  MusicTrackMediaMetadata
  ///4  PhotoMediaMetadata
  final GoogleCastMediaMetadata? metadata;

  ///optional Duration of the currently playing stream in seconds
  final Duration? duration;

  ///optional Application-specific blob of data defined by either the sender application or the receiver application
  final Map<String, dynamic>? customData;

  ///List of breaks.
  final List<CastBreak>? breaks;

  ///Optional media URL, to allow using contentId for real
  ///ID. If contentUrl is provided, it will be used
  ///as media URL, otherwise the contentId will
  ///be used as the media URL.
  final String? contentUrl;

  /// Optional media entity, commonly a Google Assistant deep link.

  final String? entity;

  ///The format of the HLS audio segment.
  final CastHlsSegmentFormat? hlsSegmentFormat;

  ///The format of the HLS video segment.
  final HlsVideoSegmentFormat? hlsVideoSegmentFormat;

  ///Provides absolute time (Epoch Unix time in seconds)
  ///for live streams. For live event it
  ///would be the time the event started,
  ///otherwise it will be start of the
  ///seekable range when the streaming started.

  final DateTime? startAbsoluteTime;

  ///The requested text track style. If not provided,
  /// the device style preferences (if existing) will be used.

  final TextTrackStyle? textTrackStyle;

  /// Array of Track objects.
  final List<GoogleCastMediaTrack>? tracks;

  /// Indicates the user action state for media.
  /// Indicate user like, dislike, or
  /// follow actions for the media.

  final List<UserActionState>? userActionStates;

  ///VMAP ad request configuration. Used if breaks and breakClips are not provided.

  final VastAdsRequest? vmapAdsRequest;

  GoogleCastMediaInformation({
    this.atvEntity,
    this.breakClips,
    required this.contentId,
    required this.streamType,
    required this.contentType,
    this.metadata,
    this.duration,
    this.customData,
    this.breaks,
    this.contentUrl,
    this.entity,
    this.hlsSegmentFormat,
    this.hlsVideoSegmentFormat,
    this.startAbsoluteTime,
    this.textTrackStyle,
    this.tracks,
    this.userActionStates,
    this.vmapAdsRequest,
  });
}
