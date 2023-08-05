Para criar a imagem
sudo docker build -t renandpf/sgr-database:1.0.0 .
docker tag renandpf/sgr-database:1.0.0 renandpf/sgr-database:1.0.0
docker push renandpf/sgr-database:1.0.0

Para criar pod a partir do arquivo yaml
kubectl apply -f sgr-database-mysql-pod.yaml