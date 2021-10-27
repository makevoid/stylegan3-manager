class ManagerLocal
  module Commands
    def imagemagick_convert
      exe_h "mkdir -p #{DIR}/images_sources"
      exe_h "rm -rf #{DIR}/images_sources/*.png"
      exe_h "mogrify -monitor -background white -alpha remove -alpha off -path #{DIR}/images_sources -colorspace RGB -type TrueColor -format png  -define png:preserve-colormap=true -adaptive-resize 1024x1024^  -gravity center -extent 1024x1024 +antialias #{DIR}/images_sources_start/*"
    end

    def download_state_images_cmd
      -> {
        scp_download source_path: "~/data2/output/*/*.png", local_path: "#{DIR}/output"
      }
    end

    def download_all_models_cmd
      -> {
        scp_download source_path: "~/data2/output/*/*.pkl", local_path: "#{DIR}/output"
      }
    end

    def download_one_state_image_cmd
      # TODO
      -> {
        dir_run = "#{DIR}/data/output/#{RUN_ID}"
        host = "#{VM_USERNAME}@#{VM_IP}"
        model_file = `ssh #{host} ls -t #{dir_run}/*.png | head -1`
        model_file.strip!
        puts "executing: #{model_file}"
        sh "scp -r #{host}:#{model_file} ../data/output/"
      }
    end
    
    def prepare_pytorch_images_dataset
       
    end
    
    def python_local
      nvidia_docker_local
    end
  end
end
