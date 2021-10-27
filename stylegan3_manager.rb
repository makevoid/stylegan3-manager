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
  
  def self.generate
    new.generate
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
      download_all_models:   new.download_all_models,
      logs:                  new.logs,
      stats:                 new.stats,
    }
  end

  def download_state_images
    download_state_images_cmd
  end

  def download_all_models
    download_all_models_cmd
  end

  def logs
    logs_cmd
  end

  def stats
    stats_cmd
  end

  def prepare
    imagemagick_convert
    prepare_pytorch_images_dataset
    # ...
  end
  
  def train
    resume_training_model = "..." # TODO
    Training.start resume_training_model_pkl: resume_training_model_pkl
  end
  
  def generate
    network = "name" # TODO
    seed_start = 1000
    seeds_num  = 2000
    Generation.start network: network, seed_start: seed_start, seeds_num: seeds_num
  end
end
