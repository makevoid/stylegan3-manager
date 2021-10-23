class ManagerLocal
  module Commands
    def imagemagick_convert

    end

    def download_state_images_cmd
      -> {
        scp_download source_path: "~/data2/output/*/*.png", local_path: "#{DIR}/output"
      }
    end

    def stats_cmd
      -> {
        puts "stats"
        gpu_stats_cmd = "nvidia-smi"
        vm_memory_cmd = "free -h"
        stats_command = "echo \"$(#{gpu_stats_cmd})\"; echo \"VM Memory:\" && #{vm_memory_cmd}"
        exe stats_command, stop: false
      }
    end
  end
end
