cd /home/developers-microservices/Jenkins

#Stop and Clear all container
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# Create Jenkins
docker build -t jenkins-data -f Dockerfile-data .
docker build -t jenkins2 .
docker run --name=jenkins-data jenkins-data
docker run -p 8080:8080 -p 50000:50000 --name=jenkins-master --volumes-from=jenkins-data -d jenkins2