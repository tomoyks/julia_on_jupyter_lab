IMAGE_NAME=julia_jupyter_lab
docker run \
	   -p 8080:8080 \
	   -p 6006:6006 \
       -p 2022:22 \
       -v notbook:/opt/notebook \
	   --rm \
	   -e TZ=Asia/Tokyo \
	   --name $IMAGE_NAME \
	   $IMAGE_NAME