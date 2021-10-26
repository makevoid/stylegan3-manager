class Manager
  module Utils

    def host
      "#{VM_USERNAME}@#{VM_IP}"
    end

    # execute via ssh
    def exe(cmd, stop: true, quiet: false, pseudo_terminal: true)
      pseudo_terminal_flag = ""
      pseudo_terminal_flag = "-t" if pseudo_terminal
      exe_h "ssh #{pseudo_terminal_flag} #{host} '#{cmd}'", stop: stop, quiet: quiet
    end

    def scp_download(source_path:, local_path:)
      command = "scp #{host}:#{source_path} #{local_path}"
      exe_s command
    end

    def scp_upload(source_path:, remote_path:)
      exe_s "scp #{source_path} #{host}:#{remote_path}"
    end

    # execute locally using system
    def exe_s(cmd)
      puts "executing: #{cmd}"
      puts "---"
      outcome_ok = system cmd
      puts "---"
      puts outcome_ok ? "command succeeded" : "Command Errored"
      puts "---"
    end

    # execute locally
    def exe_h(cmd, stop: true, quiet: false)
      puts "executing: #{cmd}"
      puts "---"
      output = exe_host cmd, stop: true, quiet: false
      puts "---"
      output
    end

    # execute on host
    def exe_host(cmd, stop: true, quiet: false)
      output = ""
      Open3.popen3(cmd) do |stdin, stdout, stderr, process|
        t1 = Thread.new do
          until (line = stdout.gets).nil?
            puts line unless quiet
            output << line
          end
        end
        t2 = Thread.new do
          until (line = stderr.gets).nil?
            puts line
            output << line
          end
        end
        [t1, t2].each { |thr| thr.join }
        sleep 0.01
        # process.join
        exit_status = process.value
        unless exit_status.success?
          puts "---"
          puts "ERROR: command failed - command: #{cmd.inspect}"
          raise "ErrorCommandFailure" if stop
        end
      end
      output
    end
  end

  # ...
  module Ext
  end
end
