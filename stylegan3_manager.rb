class StyleGAN3Manager
  include Manager::Utils
  include ManagerLocal::Commands
  include ManagerSSH::Commands

  def self.prepare
    new.prepare
  end

  def self.train
    # ...
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

end
