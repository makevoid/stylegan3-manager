class StyleGAN3Manager
  include Manager::Utils
  include ManagerLocal::Commands
  include ManagerSSH::Commands

  def self.prepare
    new.prepare
  end

  def self.train
    new.train
  end
  
  def self.setup
    new.setup
    # ...
    # check: dependencies installed - local setup
    # which nvidia-smi
    # run nvidia-smi
    # which nvidia-docker
  end

  def self.utils
    {
      download_state_images: new.download_state_images,
      logs:                  new.logs,
      stats:                 new.stats,
    }
  end

  def download_state_images
    download_state_images_cmd
  end

  def logs
    logs_cmd
  end

  def stats
    stats_cmd
  end

  def prepare
    imagemagick_convert
    # ...
  end
  
  def train
    start_training
  end
end
