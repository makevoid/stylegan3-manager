class StyleGAN3Manager
  include Manager::Utils

  def self.train
    # ...
  end

  def self.utils
    {
      stats: stats,
    }
  end

  def self.stats
    new.stats
  end

  def stats
    stats_cmd
  end

  private

  def stats_cmd
    -> {
      puts "stats"
      exe "nvidia-smi", stop: false
    }
  end

end
