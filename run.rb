require "viddl"
require "date"

default_folder = "downloads"

crop_range = [
  { time_start: 0, time_end: 25 },
  { time_start: 25, time_end: 30 },
  { time_start: 40, time_end: 51 },
]

video_link = "https://www.youtube.com/watch?v=XtroQ8ipXFI"

crop_range.each do |range|
  date_time_now = DateTime.now.strftime("%Q")
  output_file_path = "#{default_folder}/#{date_time_now}-#{range[:time_start]}-#{range[:time_end]}"
  
  options = {
    start: range[:time_start],
    end: range[:time_end],
    output_path: output_file_path,
  }
  
  video = Viddl::Video.download(video_link)
  video.create_clip(options)
end
