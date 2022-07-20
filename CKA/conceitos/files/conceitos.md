# Conceitos relacionados aos arquivos YAML

## Labels e Selectors

- <strong>Label:</strong> As Labels são do tipo chave/valor e são incluidas em objetos, como os pods. Labels são feitas para uso específico de identificação de atributos de objetos importantes e relevantrs para usuários, porém, nao afetam diretamente na semantica do funcionamento.

  Labels podem ser usadas para organizar e selecionar subsets de objetos e podem ser incluidas em componentes na sua criação e posteriormente adicionadas e modificadas em qualquer momento. Cada chave precisa ser única para o dado objeto.

- <strong>Selectors:</strong> Existem dois tipos de selectors, o equality-based e o set-based. Um Selector pode ser feito de muiltiplos requerimentos que são feitos em comma-separated. No caso de multiplos requerimentos, todos precisam estar em um padrão que satisfaça o comma-separated.

  Dentro do escopo do Selector, existe um campo chamado ``matchLabels`` que como o nome ja fala por si só, ele faz referência a uma lable já criada e dessa maneira o componente ja sabe qual pod vai monitorar.
---

## Services

- <strong>NodePort:</strong> Quando estruturamos o nosso arquivo YAML é necessário termos conhecimento de algumas informações.

   - *type:* O tipo do objeto de serviço a ser utilizado (NodePort, ClusterIP, LoadBalancer e ExternalName)

   - *ports:* Configuração de portas para o NodePort entrar em funcionamento

   - *targetPort:* Porta do pod

   - *targetPort:* Referência da porta do pod ao Service (NodePort)

   - *NodePort:* Porta a ser exposta para receber trafego. O range dessa porta precisa ser entre 30000 - 32767

  Como podemos perceber o campo ports é um array, logo, podemos ter mais de uma configuração.

  É importante ressaltar que o objeto de referência (POD, Deployment, ReplicaSet e etc...) tenha as labels definidas para conseguirmos fazer o attatch do serviço.
---

## Annotations

São parecidas com as lables, porém tem o uso designado para algo mais voltado a integração (buildVersion, ingress e etc).

## Taints e Tolerations

Taints são aplicados nos nodes, eles permitem que um node repudie um conjunto de pods.

Tolerations são aplicada em pods e permitem, mas não exigem que os pods sejam alocados em nós com taints correspondentes

Podemos imaginar um cenário, pode somente entrar na sala secreta quem possuir um cartão de acesso 3. Quem possuir um cartão de acesso 2, talvez consiga entrar, mas não é garantido e quem possuir um cartão de acesso 1, não vai conseguir entrar na sala. Os que ja estiverem dentro e possuirem um cartão de acesso 1, serão expulsos.

Nesse exemplo citado a sala secreta seria um Node, máquina de leitura de cartão seria a ``Taint`` e o nivel de acesso do cartão seria uma ``Toleration``.

Possuimos 3 tipos de taint:

- NoSchedule: O Kubernetes não alocará o pod naquele nó.
- PreferNoSchedule: O Kubernetes tentará não alocar o pod no nó.
- NoExecute: O pod será expulso do nó (caso já esteja em execução) e não será   alocado ao nó (caso ainda não esteja em execução).

Tratando-se em nível de POD, basicamente quando criamos uma toleration, devemos pensar ao contrário, como se fosse uma imunização, ou seja, se o node possuir uma Taint de ``NoSchedule`` e o POD uma Toleration de ``NoSchedule``, logo, esse pod poderá ser alocado dentro do node com a Taint.

Podemos ter vários tipos de taint no mesmo nó e é interessante prestarmos atenção ao executarmos a tarefa.

Outro exemplo muito interessante é o node ControlPlane. Podemos nos perguntar, porque o scheduler não cria nenhum POD dentro do ControlPlane? A resposta é: Pois quando a criação do cluster acontece, é aplicado um ``Taint`` no node e não conseguimos subir nenhum outro pod/deployment/service/etc... dentro do mesmo.

## Node Selectors

O Node Selector é a recomendação mais simples de seleção de nodes para a criação de pods. Você consegue adicionar o campo ``nodeSelector`` no YAML do seu POD e referenciar esse valor nas lables do node que você deseja utilizar como alvo para a criação do POD. O Kubernetes somente faz schedule do POD nos nodes que tiverem cada uma das lables especificadas.

Como vários objetos do Kubernetes, os nodes também possuem labels! Você pode criar labels manualmente. O K8s também popula um set padrão de labels em todos os nodes em um cluster.

## Node Affinity
Node Affinity é conceitualmente similar ao nodeSelector, permitiondo você restringir quais nodes o seu POD pode ter um schedule baseado nas Node labels.
Existem 2 tipos de afinidade:

- *requiredDuringSchedulingIgnoredDuringExecution:* O Scheduler não consegue fazer schedule do POD a menos que a regra conicida. Essa função é bem parecida com o nodeSelector, porém, tem uma complexidade um pouco mais expressiva.

- *preferredDuringSchedulingIgnoredDuringExecution:* O Scheduler tenta encontrar um node que conicida com as regras especificadas. Se um node coincidente for encontrado e ele não estiver disponível, o scheduler mesmo assim faz o schedule do POD.

É importante cidtar o uso dos operadores lógicos disponíveis. Aqui estão eles:

``In``, ``NotIn``, ``Exists``, ``DoesNotExist``, ``Gt`` e ``Lt``

O ``NotIn`` e ``DoesNotExist`` servem para o fazer o anti-affinity. Essa funcionalidade é muito parecida com o ``Taint``, que foi mencionado no tópico anterior.

- *In:* Quando nosso nodeAffinity estiver configurado com o operador In, o Scheduler irá buscar por varios nodes, não somente um, ex:

podemos ter:

```yaml
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: size
            operator: In
            values:
            - Large
```

e também podemos ter:

```yaml
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: size
            operator: In
            values:
            - Large
            - Medium
```

Podemos comparar com o operador lógico OU. Se o Scheduler encontrar um node com a label size e o valor Large ou Medium, ele irá alocar o POD no NODE mais condizente com a situação, sem se preocupar com o valor da label.

- *Exists:* Busca somente pelo valor da label e não pelo valor, se o node possuir uma label condizente o Scheduler irá prosseguir com o Schedule.

```yaml
    affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: size
            operator: Exists
```

## DaemonSet

Um DaemonSet garante que todos os Nodes (Ou alguns) rodem uma copia dos pods.

Casos de uso para os DaemonSets

- Quando queremos ter algum tipo de monitoramento fixo dentro do nosso node sem que ele se renove a cada deploy

- Quando queremos ter algum tipo de captura de log fixo dentro do nosso node

- O componente Kube-proxy pode ser deployado como um daemonset

## Static Pod

São gerenciados diretamente pelo kubelet em um node específico, sem o API Server. Diferente dos pods que são gerenciados pelo Control Plane o kubelet cuida de cada POD dentro do node e caso eles falhem ele os restarta.

O Kubelet automaticamente tenta criar um mirror Pod no Api Server para cada POD Estatico. Isso significa que os pods rodam em um node onde o API Server consegue enxerga-los, porém não podem ser controlados.

É importante mencionar que os arquivos YAML devem ser criados dentro de ``/etc/kubernetes/manifests`` que é onde o kubelet ira buscar pelos arquivos de especificação.

- Podemos utilizar os PODS estáticos para criarmos um Control Plane dentro de um Node. Em um cenário onde ja possuímos algum cluster pré-configurado, podemos em um futuro, necessitar de mais de um Control Plane então podemos criar um Node novo e dentro dele, gerar vários manifestos com os componentes do kubernetes dentro do diretório citado acima. Desta maneira não precisamos configurar um Node Control Plane do 0.

- Os pods estaticos tem a nomenclatura do tipo
  ``nomedopod``-``nomedonode``

- Outro ponto de extrema importância é sempre olhar qual é o caminho de configuração dentro do kubelet para os manifestos YAML. Para conseguirmos ver essa conf  basta executar um cat neste caminho ``/var/lib/kubelet/config.yaml``

## Metrics Server

Por padrão o k8s não vem com nenhuma configuração de analise de métricas. Temos a necessidade de instalar

```
minikube addons enable metrics-server
```

```
git clone https://github.com/kodekloudhub/kubernetes-metrics-server.git
```

```
kubectl create -f deploy/1.8+/
```