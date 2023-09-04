**DOCKER: GERAR BUILD**

```
sudo docker build -t renandpf/sgr-database:2.0.0 .
```
```
docker tag renandpf/sgr-database:2.0.0 renandpf/sgr-database:2.0.0
```
```
docker push renandpf/sgr-database:2.0.0
```

**KUBERNETES**
```
kubectl apply -f sgr-database-mysql-secrets.yaml
```
```
kubectl apply -f sgr-database-mysql-service.yaml
```
```
kubectl apply -f sgr-database-mysql-pod.yaml
```