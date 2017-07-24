module Zephyrus
  class TranscodingOutput < Output

    field :segment_duration
    field :segment_count
    field :content_type

    has_many :renditions

  end
end