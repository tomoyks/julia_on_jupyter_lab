IMAGE_NAME=julia_jupyter_lab
cd docker
docker build -f ./Dockerfile -t $IMAGE_NAME .
cd ../