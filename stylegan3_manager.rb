class StyleGAN3Manager
  include Manager::Utils
  include ManagerLocal::Commands

  def self.train
    # ...
  end

  def self.utils
    {
      stats:                 stats,
      download_state_images: download_state_images,
    }
  end

  def self.stats
    new.stats
  end

  def self.download_state_images
    new.download_state_images
  end

  def stats
    stats_cmd
  end

  def download_state_images
    download_state_images_cmd
  end

end
