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

```
kubectl get pods --selector key=value
```
Linha de comando responsável por listar todos os pods dentro de uma namespace pela sua label.

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default

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

```
kubectl expose pod <podname> --type=NodePort --port=<port> --name=<servicename> --dry-run=client
-o yaml > <filename>.yaml
```
Cli repsonsavel pela criação de um manifesto de serviço NodePort baseado em um pod

- A flag ``--dry-run=client`` garante que nada seja criado, somente mostra o output do manifesto gerado.

- O operador de ``>`` representa o caminho da criação de um arquivo. Neste caso estamos recebendo um output de uma flag ``--dry-run=client`` e salvando em um arquivo .yaml

  Assim podemos rodar um ``kubectl apply -f <filename>.yaml``

- Outra informação válida é que como informamos o nome do pod, o kubectl automaticamente usa as lables do pod como selector dentro do serviço.

- Caso tenhamos de expor o campo ``nodePort`` é necessário fazer a alteração dentro do manifesto gerado.

```
kubectl create service nodeport <servicename> --tcp=<port>:<targetport> 
--node-port=<nodeportPort>
--dry-run=client -o yaml > <filename>.yaml
```

Linha de comando responsável por gerar um manifesto yaml do servico nodeport

- A flag ``--dry-run=client`` garante que nada seja criado, somente mostra o output do manifesto gerado.

- O operador de ``>`` representa o caminho da criação de um arquivo. Neste caso estamos recebendo um output de uma flag ``--dry-run=client`` e salvando em um arquivo .yaml

  Assim podemos rodar um ``kubectl apply -f <filename>.yaml``

```
kubectl edit service <servicename>
```

Linha de comando para fazer a edição de um manifesto de um serviço NodePort.


```
kubectl expose pod <podname> --port=<port> --name <servicename> --dry-run=client -o yaml > <filename>.yaml
```
Cli responsavel pela criação de um serviço do tipo ClusterIP para uma exposição de porta.

- A flag ``--dry-run=client`` garante que nada seja criado, somente mostra o output do manifesto gerado.

- O operador de ``>`` representa o caminho da criação de um arquivo. Neste caso estamos recebendo um output de uma flag ``--dry-run=client`` e salvando em um arquivo .yaml

  Assim podemos rodar um ``kubectl apply -f <filename>.yaml``

- Outra informação válida é que como informamos o nome do pod, o kubectl automaticamente usa as lables do pod como selector dentro do serviço.

```
kubectl create service clusterip <servicename> --tcp=<port>:<portFowarding> --dry-run=client -o yaml > <filename>.yaml
```

Cli responsavel pela criação de um serviço do tipo ClusterIP para uma exposição de porta.

- A flag ``--dry-run=client`` garante que nada seja criado, somente mostra o output do manifesto gerado.

- O operador de ``>`` representa o caminho da criação de um arquivo. Neste caso estamos recebendo um output de uma flag ``--dry-run=client`` e salvando em um arquivo .yaml

  Assim podemos rodar um ``kubectl apply -f <filename>.yaml``

- Essa configuração automaticamente colocara o selector como ``app=<servicename>``.

- É impotante ressaltar que devemos modificar o arquivo gerado conforme a necessidade.

---

## Namespaces

```
kubectl get namespaces
```

Linha de comando responsável por listar todas as namespaces dentro do cluster


```
kubectl create namespace <namespacename>
```

Linha de comando responsável pela criação de uma namespace.

```
kubectl config set-context $(kubectl config current-context) --namespace=<namespacename>
```

Cli para configurar o contexto para a namespace desejada.

- Extremamente útil quando nao possuímos o comando ``kubens``

- Também é util para não precisarmos utilizar o comando -n ou --namespace para todos os comandos.

```
kubectl get pods --all-namespaces
```

Cli responsável pela listagem de todos os pods em todas as namespaces.

---

## Genneral

```
kubectl get all
```

Linha de comando responsável pela listagem de todos os componentes

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default

```
kubectl get events
```

Linha de comando responsável pela listagem de todos os eventos dentro da namespace

- Caso não seja informado a namespace ``-n <namespacename>`` o kubectl irá buscar dentro da namespace default

```
kubectl set image deployment/<deploymentname> <imagename>=<imageversion>
```

Cli responsável por editar a imagem de um deployment.

```
kubectl get all --all-namespacess -o yaml > <filename>.yaml
```

Linha de comando responsável por gerar um manifesto de todos os objetos criados em todas as namespaces do cluster.

```
kubectl config view
```

Linha de comando responsável por mostrar o arquivo de KubeConfig.

```
kubectl config use-context <context-name>
```
Linha de comando responsável por mudar o contexto (Cluster) que está acessando.


```
kubectl config --kubeconfig=<KubeConfigPath use-context <context>
```

Linha de comando responsável por mudar o contexto (Cluster) que está acessando baseado em um arquivo.

---

## Taint

```
kubectl taint nodes <nodename> key=value:tainteffect
```

Linha de comando responsavel por criar um taint em um node específico.
É importante ressaltar que existem 3 tipos de ``tainteffect``

- <strong>NoSchedule:</strong> Não será possível criar um pod no node

- <strong>PreferNoSchedule:</strong> O scheduler tentará não alocar o pod no node, porém não existem garantias

- <strong>NoExecute:</strong> Se existe pelo menos um taint não tolerado com o efeito NoExecute, o pod será expulso do nó (caso já esteja em execução) e não será alocado ao nó (caso ainda não esteja em execução).

```
kubectl describe node <nodename> | grep Taints
```
Linha de comando responsavel por listar as ``Taints`` de um node.

## Node Selectors

```
kubectl label nodes <nodename> label-key=label-value
```

Linha de comando responsável por criar label nos nodes.

## Metrics Server

```
kubectl top nodes
```

Linha de comando responsável por trazer as metricas atuais dos nodes.

---

## Rollout

```
kubectl rollout status deployment/<deploymentname>
```

Linha de comando para verificar o status de um rollout dentro do seu deployment.
Caso o rollout tenha sido propagado com sucesso para todos os pods do deployment você deverá receber uma mensagem nesse sentido ``deployment "nginx" successfully rolled out``.

```
kubectl rollout history deployment/<deploymentname>
```
Linha de comando responsável pela listagem do histórico de rollouts de um deployment.

```
kubectl rollout history deployment/<deploymentname> --revision=<revisionNumber>
```
Linha de comando responsável pelo detalhamento de uma revisão de um rollout.

```
kubectl rollout undo deployment/<deploymentName>
```
Linha de comando responsável pelo rollback do deployment para a ultima versão anterior a atual.

```
rollout undo deployment/<deploymentName> --to-revision=<revisionNumber>
```
Linha de comando responsável pelo rollback de um deployment para uma revisão em específico.

---

## ConfigMap

```
kubectl create configmap <configmapname> --dry-run=client -o -yaml > <filename>.yaml
```

Cli responsável por gerar um manifesto no formato de um configmap

- A flag ``--dry-run=client`` garante que nada seja criado, somente mostra o output do manifesto gerado.

- O operador de ``>`` representa o caminho da criação de um arquivo. Neste caso estamos recebendo um output de uma flag ``--dry-run=client`` e salvando em um arquivo .yaml

  Assim podemos rodar um ``kubectl apply -f <filename>.yaml``

- É impotante ressaltar que devemos modificar o arquivo gerado conforme a necessidade.

```
kubectl create configmap \      
  app-config --from-literal=APP_COLOR=blue \
  --from-literal=APP_MOD=prod \
  --from-literal=APP_DB=example
```

Linha de comando responsável por criar um configmap de maneira imperativa.

```
kubectl create configmap \
  app-config --from-literal=APP_COLOR=blue \
--from-literal=APP_MOD=prod --dry-run=client -o yaml > teste.yaml
```
Linha e comando responsável por gerar o manifesto de um configmap de maneira imperativa.

---

## Secrets

```
kubectl create secret generic
```

Linha de comando para criar um secret.

```
kubectl create secret generic \
  app-secret --from-literal=DB_HOST=mysql --dry-run=client -o yaml > <yourfile>.yaml
```
Linha e comando responsável por gerar o manifesto de um secret de maneira imperativa.

```
echo -n 'valor' | base64
```

Linha de comando para gerar um Base64 (Formato requerido no momento de criar um secret)


```
echo -n 'hash' | base64 --decode
```

Linha de comando para fazer o decode de um secret em base64

## Certificados

```
kubectl get csr
```

Linha de comando responsável por listar todos os csr's

---

```
kubectl certificate approve <nome-do-certificado>
```
Linha de comando responsável pelo approve de um csr

---

```
kubectl get csr <csr-name> -o yaml
```

Linha de comando responsável por detalhar um csr em yaml.

---

```
kubectl certificate deny <nome-do-csr>
```

Linha de comando responsável por recusar um csr

---

```
kubectl delete csr <nome-do-csr>
```

Linha de comando responsável por deletar um csr