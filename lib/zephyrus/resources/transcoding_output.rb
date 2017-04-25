
module Zephyrus
  class TranscodingOutput < Output

    field :content_type
    field :video_bitrate
    field :audio_bitrate
    field :height
    field :width
    field :audio_sample_rate
    field :segment_duration
    field :segment_count
    field :profile_idc
    field :level_idc

  end
end