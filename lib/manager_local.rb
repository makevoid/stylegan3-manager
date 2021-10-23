class ManagerLocal
  module Commands
    def imagemagick_convert
      exe_h "mkdir -p #{DIR}/images_sources"
      exe_h "rm -rf #{DIR}/images_sources/*.png"
      exe_h "mogrify -monitor -path #{DIR}/images_sources -colorspace RGB -type TrueColor -format png  -define png:preserve-colormap=true -adaptive-resize 1024x1024^  -gravity center -extent 1024x1024 +antialias #{DIR}/images_sources_start/*"
    end

    def download_state_images_cmd
      -> {
        scp_download source_path: "~/data2/output/*/*.png", local_path: "#{DIR}/output"
      }
    end
  end
end
