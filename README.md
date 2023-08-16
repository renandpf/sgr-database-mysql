GERAR IMAGEM
sudo docker build -t renandpf/sgr-database:1.0.0 .
docker tag renandpf/sgr-database:1.0.0 renandpf/sgr-database:1.0.0
docker push renandpf/sgr-database:1.0.0

SUBIR MINIKUBE
minikube start

SUBIR DATABASE
kubectl apply -f sgr-database-mysql-secrets.yaml
kubectl apply -f sgr-database-mysql-service.yaml
kubectl apply -f sgr-database-mysql-pod.yaml