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