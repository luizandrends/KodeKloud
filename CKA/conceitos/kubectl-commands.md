# Comandos Kubectl

## Pods
---
```
kubectl run <podname> --image <imagename>
```

Linha de comando responsável por criar um pod com uma imagem existente em algum registry de container.

----
```
kubectl get pods
```
Linha de comando responsável por listar todos os pods dentro de uma namespace

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default
---

