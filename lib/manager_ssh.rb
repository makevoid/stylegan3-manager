class ManagerSSH
  module Commands
    def logs_cmd
      -> {
        docker_id = exe "sudo docker ps | grep stylegan3 | cut -d \" \" -f1", pseudo_terminal: false
        docker_id.strip!
        puts "Docker id: #{docker_id.inspect}"
        exe "sudo docker logs -f #{docker_id} 2>&1", pseudo_terminal: false
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
