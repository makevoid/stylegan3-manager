class Manager
  module Utils

    # execute via ssh
    def exe(cmd, stop: true, quiet: false)
      puts "executing: #{cmd}"
      puts "---"
      exe_h "ssh -t #{host} '#{cmd}'", stop: stop, quiet: quiet
      puts "---"
    end

    def scp_download(source_path:, local_path:)
      exe_h "scp #{host}:#{source_path} #{local_path}"
    end

    def scp_upload(source_path:, remote_path:)
      exe_h "scp #{source_path} #{host}:#{remote_path}"
    end

    # execute on host
    def exe_h(cmd, stop: true, quiet: false)
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

  def host
    "#{CONFIG.f :vm_username}@#{CONFIG.f :vm_ip}"
  end

  # ...
  module Ext
  end
end
