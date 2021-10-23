require_relative "env"

desc "Setup - Install prerequisites"
task :setup do

end

desc "Prepare - Prepare Dataset - prepare your images to be trained on by StyleGAN3"
task :prepare do

end

desc "Train - train model with your image dataset"
task :train do

end

desc "Download State Images - Download State Images (generated fakes) - every image correspond to a model snapshot you can download and use to generate the full set"
task :download_state_images do
  StyleGAN3Manager.utils.f(:download_state_images).()
end

task download_fakes: :download_state_images

desc "Stats - Display VM GPU Memory usage and VM RAM Memory usage"
task :logs do
  StyleGAN3Manager.utils.f(:logs).()
end

task log: :logs

desc "Stats"
task :stats do
  StyleGAN3Manager.utils.f(:stats).()
end

desc "Stats (Live) - call rake stats with watch"
task :live_stats do
  sh "watch rake stats"
end

task default: :train
