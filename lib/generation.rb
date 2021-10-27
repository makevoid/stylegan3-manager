class Generation

  def self.start(network:, seed_start:, seeds_num:, trunc: 1)
    new.start network: network, seed_start: seeds_start, seeds_num: seeds_num, trunc: trunc)
  end
  
  def start(network:, seed_start:, seeds_num:, trunc: 1)
    output_dir = "/mnt/output"
    seed_start = seed_start.to_i
    seeds_num = seeds_num.to_i
    seed_end = seed_start + seeds_num
    seeds = "#{seed_start}-#{seed_end}
    network_pkl_path = "/mnt/models/#{network}.pkl"
    python "generate", network: network_pkl_path, outdir: output_dir, seeds: seeds, trunc: trunc
  end

end