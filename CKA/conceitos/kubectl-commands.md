# Comandos Kubectl

## Pods

```
kubectl run <podname> --image <imagename>
```

Linha de comando responsável por criar um pod com uma imagem existente em algum registry de container.

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá criar dentro da namespace default

----
```
kubectl run <podname> --image=<imagename> --dry-run=client -o yaml

```
Linha de comando responsável por gerar o manifesto em YAML.

- Caso não seja informada a flag ``--namespace=<namespacename>`` o kubectl irá gerar o manifesto dentro da namespace default.

- A flag ``--dry-run=client`` garante que nada seja criado, somente mostra o output do manifesto gerado.

---

```
kubectl run <podname> --image=<podname> --dry-run=client -o yaml > <filename>.yaml
```
- Caso não seja informada a flag ``--namespace=<namespacename>`` o kubectl irá gerar o manifesto dentro da namespace default.

- A flag ``--dry-run=client`` garante que nada seja criado, somente mostra o output do manifesto gerado.

- O operador de ``>`` representa o caminho da criação de um arquivo. Neste caso estamos recebendo um output de uma flag ``--dry-run=client`` e salvando em um arquivo .yaml

  Assim podemos rodar um ``kubectl apply -f <filename>.yaml``
---

```
kubectl delete pod <podname>
```

Linha de comando responsável por deletar um pod em específico.

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default
----
```
kubectl get pods
```
Linha de comando responsável por listar todos os pods dentro de uma namespace

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default
___

```
kubectl describe pod <podname>
```
Linha de comando responsável por detalhar o pod

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default


## Replication Controller

```
kubectl get replicationcontroller
```

Linha de comando responsável por mostrar os replications controllers informando DESIRED, CURRENT e READY.

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default

----
```
kubectl delete replicationcontroller <replicationcontrollername>
```

Linha de comando responsável por deletar um replication controller em específico

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default
----

## Replicaset

```
kubectl get replicaset
```

Linha de comando responsável por listar os replicasets e informar DESIERD, CURRENT e READY

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default
---

```
kubectl delete replicaset <replicasetname>
```

Linha de comando responsável por deletar um replicaset.

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default
---

```
kubectl replace -f <replicasetfile>
```

Linha de comando responsável pelo update do arquivo yaml

---
```
kubectl scale --replicas=<numReplicas> -f <replicasetfile>
```

Linha de comando responsável por fazer o scale ou down scale para um número específico de pods desejados.

- Este comando não irá alterar nenhum tipo de código no manifesto do k8s.

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default
---

```
kubectl scale --replicas=<numReplicas> replicaset <replicasetName>
```

Linha de comando responsável por fazer o scale ou down scale para um número específico de pods desejados.

- Este comando não irá alterar nenhum tipo de código no manifesto do k8s.

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default
---
```
kubectl edit replicaset <replicasetName>
```

Linha de comando responsável por fazer o edit de um manifesto já gerado em um replicaset.

- Caso ocorra algum tipo de deploy e o arquivo yaml for executado com um número diferente de pods ou imagem diferente esse comando não altera permanentemente o "manifesto final".

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default

---

## Deployments

```
kubectl get deployments
```

Linha de comando que lista todos os deployments

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default

---

```
kubectl create deployment <deploymentname> --image=<imagename> --replicas=<numreplicas>
```

Linha de comando responsável por criar um deployment

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default

---
```
kubectl create deployment <deploymentname> --image=<imagename> --replicas=<numreplicas> --dry-run=client -o yaml
```

Linha de comando responsável por gerar o manifesto YAML de criação de um deployment

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá gerar o manifesto dentro da namespace default.

- A flag ``--dry-run=client`` garante que nada seja criado, somente mostra o output do manifesto gerado.

---

```
kubectl create deployment <deploymentname> --image=<imagename> --replicas=<numreplicas> 
--namespace=<namespacename>
--dry-run=client -o yaml > <filename>.yaml
```

Linha de comando responsável por gerar o manifesto YAML de criação de um deployment

- Caso não seja informado o nome da namespace na flag ``--namespace=<namespacename>`` O deployment vai gerar o manifesto na namespace default.

- A flag ``--dry-run=client`` garante que nada seja criado, somente mostra o output do manifesto gerado.

- O operador de ``>`` representa o caminho da criação de um arquivo. Neste caso estamos recebendo um output de uma flag ``--dry-run=client`` e salvando em um arquivo .yaml

  Assim podemos rodar um ``kubectl apply -f <filename>.yaml``



---

## Services

```
kubectl get services
```

Linha de comando responsável pela listagem de todos os services

___

## Genneral

```
kubectl get all
```

Linha de comando responsável pela listagem de todos os componentes

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default