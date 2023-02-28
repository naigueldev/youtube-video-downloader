require "viddl"
require "date"

default_folder = "downloads"

video_link = ARGV[0].to_s
time_start = ARGV[1].to_i
time_end = ARGV[2].to_i

puts "video_link: #{video_link}"
puts "time_start: #{time_start}"
puts "time_end: #{time_end}"

date_time_now = DateTime.now.strftime("%Q")
output_file_path = "#{default_folder}/#{date_time_now}_#{time_start}_#{time_end}"

options = {
  start: time_start,
  end: time_end,
  output_path: output_file_path,
}

video = Viddl::Video.download(video_link)
video.create_clip(options)