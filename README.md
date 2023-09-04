**DOCKER: GERAR BUILD**

```sh
docker build -t renandpf/sgr-database:2.0.0 .
```

```sh
docker tag renandpf/sgr-database:2.0.0 renandpf/sgr-database:2.0.0
```

```sh
docker push renandpf/sgr-database:2.0.0
```

**KUBERNETES**

```sh
kubectl apply -f sgr-database-mysql-secrets.yaml
```

```sh
kubectl apply -f sgr-database-mysql-service.yaml
```

```sh
kubectl apply -f sgr-database-mysql-pod.yaml
```