# stylegan3-manager

StyleGAN3 Manager ...

### Setup

Linux setup assumes Debian/Ubuntu

Mac OS setup requires Homebrew to be installed (https://brew.sh/)

#### Setup - Install Imagemagick

You have to setup imagemagick on your local machine, here are the instructions:

#### Setup - Install Imagemagick - Linux

    apt-get install

#### Setup - Install Imagemagick - Mac OS

    brew install imagemagick

#### Setup - Install Imagemagick - check

Check if `imagemagick` and `mogrify` image conversion command line utilities are installed correctly by running the `which mogrify` command (it should print the mogrify command location)


#### Setup - Local image preparation

NOTE: You don't need to do this step if you are doing the image preparation on the server

Please skip this step if you are a novice

Otherwise if you want full control install `nvidia-docker` on your machine

#### Setup - Install Docker / Docker Desktop

Follow the instructions here to setup docker ... TODO...
https://docs.docker.com/engine/install/

#### Setup - Install Nvidia Drivers

Follow the instructions here to install nvidia drivers ... TODO...
https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html#abstract

#### Setup - Install Nvidia-Docker

#### Setup - Verify installation

Check both `which nvidia-docker` and `nvidia-smi` commands, they shouldn't error.

Congratulations! if you reached here you have a local setup including Nvidia Docker!

#### Prepare

The first step you need to do is to prepare the dataset, the dataset can be any set of images in the following formats: JPG, PNG, GIF or TIFF

The images will be converted to squared 1024 x 1024 pixel images (PNG RGB) and packaged up in a ZIP file (PyTorch Dataset zip file).

You will use the zip file to train the StyleGAN3 model on your GPU VM and you'll be able to monitor the training process.

#### Prepare - Prepare Images

The first step is to create a directory named `source_images_start` and to copy all your dataset images into that directory.

#### Prepare - Run command

The command you want to execute is:

    rake prepare

This command should finish with a success message.

You will notice a file `source_images_dataset.zip`

Great, you have now a dataset ready and you can start training!


#### Run Training

To run the training (create and) `cd` into the directory of your machine learning project.

This directory needs:

- the file `source_images_dataset.zip` to be present in the directory

- a subdirectory `output` (which we will use to download and check the files on our local machine)


When you are ready execute:

    rake

This will start training.
