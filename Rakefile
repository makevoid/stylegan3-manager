require_relative "env"

desc "Setup - Install prerequisites"
task :setup do
  StyleGAN3Manager.setup
end

desc "Prepare - Prepare Dataset - prepare your images to be trained on by StyleGAN3"
task :prepare do
  StyleGAN3Manager.prepare_dataset
end

desc "Train - train model with your image dataset"
task :train do
  StyleGAN3Manager.train
end

desc "Download State Images (download fakes) - Download State Images (generated fakes) - every image correspond to a model snapshot you can download and use to generate the full set"
task :download_state_images do
  StyleGAN3Manager.utils.f(:download_state_images).()
end

task download_fakes: :download_state_images

desc "Download State Image (download fake) - download 1 state image"
task :download_state_image do
  StyleGAN3Manager.utils.f(:download_state_image).()
end

task download_fake: :download_state_image

desc "Download Models - downloads all the models saved, PKL (.pkl - pickle) files - note that this command will take a lot of time as the models are ~240MB each"
task :download_models do
  StyleGAN3Manager.utils.f(:download_all_models).()
end

task download_all_models: :download_models


desc "Download Latest Model - downloads the latest the models saved, PKL (.pkl - pickle) file - NOTE you can pass the parameter MODEL=00000123 (by specifying the generation number) to download the corresponding model - you can get the generation number by downloading all fakes via `download_state_image`"
task :download_model do
  StyleGAN3Manager.utils.f(:download_model).()
end

desc "Stats - Display VM GPU Memory usage and VM RAM Memory usage"
task :logs do
  StyleGAN3Manager.utils.f(:logs).()
end

task log: :logs

desc "Stats"
task :stats do
  StyleGAN3Manager.utils.f(:stats).()
end

desc "Info"
task :info do
  puts "nvidia docker:"
  sh "nvidia-docker -v"
  puts "ssh test:"
  host = "#{}" # TODO finish
  sh "ssh #{host} 'ls'"
end

desc "Stats (Live) - call rake stats with watch"
task :live_stats do
  sh "watch rake stats"
end

task default: :train
