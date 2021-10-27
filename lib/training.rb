class Training

  STYLEGAN_CFG = "stylegan3-r" # TODO extract

  def self.start(resume_training_model_pkl:, gpus: 1, kimg: 5000, batch: 4, gamma: 10, mirror: 1, tick: 2, snap: 1, metrics: "none")
    new.start resume_training_model_pkl: resume_training_model_pkl, gpus: gpus, kimg: kimg, batch: batch, gamma: gamma, mirror: mirror, tick: tick, snap: snap, metrics: metrics
  end
  
  def start(resume_training_model_pkl:, gpus: 1, kimg: 5000, batch: 4, gamma: 10, mirror: 1, tick: 2, snap: 1, metrics: "none")
    model_name = "..." # TODO from config
    resume_model_pkl = "/mnt/#{model_name}.pkl"
    outdir = "/mnt/output"
    data = "/mnt/images_sources.zip"
    python "train", resume: resume_training_model_pkl, outdir: outdir, cfg: STYLEGAN_CFG, data: data, gpus: gpus, kimg: kimg, batch: batch, gamma: gamma, mirror: mirror, tick: tick, snap: snap, metrics: metrics
  end
  
  # TODO extract
  
  def python(py_file, **args)
    args_py = python_transform_args args: args
    nvidia_docker "python #{py_file}.py #{args_py}"
  end
  
  def python_transform_args(args:)
    args_str = []
    args.each do |arg_name, value|
      args_str << "--#{arg_name}=#{value}"
    end
    args_str.join " "
  end
  
  def nvidia_docker(command)
    exe "nvidia-docker ... #{command}"
  end
end