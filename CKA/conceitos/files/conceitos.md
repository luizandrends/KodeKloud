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

