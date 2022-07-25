# Documentação para o update de um cluster com o kubeadm

Doc de referência:
https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/

Tutorial para ubuntu, debian e hypriotos

1 - Primeiramente precisamos ver qual sistema operacional estamos

---

2 - Buscar pela release que vá satisfazer o seu cenário de atualização:

```
apt update
apt-cache madison kubeadm
```
---
3 - Iniciar a atualização no contro-plane

```
apt-mark unhold kubeadm && \
 apt-get update && apt-get install -y kubeadm=<versão-kubeadm>-00 && \
 apt-mark hold kubeadm
```
---
4 - Verificar se o download funcionou com a versão desejada

```
kubeadm version
```
---

5 - Verificar o plan do upgrade


```
kubeadm upgrade plan
```

 - Esse comando vai checar se o seu cluster pode receber atualizações, e busca por versões que você pode atualizar. Também mostra uma tabela com versões disponíveis para os componentes.

 ---

6 - Escolha uma versão para fazer o update

```
sudo kubeadm upgrade apply v<versão escolhida>
```
---

7 - Atualização do kubelet

- Se rodarmos o comando ``kubectl get nodes`` podemos perceber que a versão não está condizente com a que selecionamos. Por isso é de suma importância que façamos a atualização do kubelet.

---

8 - Drain dos pods para a atualização do control-plane.

```
kubectl drain <nome-do-node> --ignore-daemonsets
```

---

9 - Upgrade do kubelet e kubectl

```
apt-mark unhold kubelet kubectl && \
apt-get update && apt-get install -y kubelet=<versao-kubelet>-00 kubectl=<versao-kubectl>-00 && \
apt-mark hold kubelet kubectl
```
---

10 - Reiniciar o daemon e kubelet

```
sudo systemctl daemon-reload
```

```
sudo systemctl restart kubelet
```
---

11 - Tornar o controlplane schedulable

```
kubectl uncordon <nome-do-node>
```

---

12 - Tornar o worker node desejado para unschedulable

```
kubectl drain <nome-do-node>
```

---

13 - Logar dentro do node via ssh

---

14 - Fazer a instalação do kubeadm

```
apt-mark unhold kubeadm && \
apt-get update && apt-get install -y kubeadm=<versao-kubeadm-00>&& \
apt-mark hold kubeadm

```

- É de suma importância escolher a versão que foi escolhida para o kubeadm do control plane
---

15 - Fazer o upgrade do kubeadm

```
sudo kubeadm upgrade node
```
---

16 - Upgrade do kubelet e do kubectl

```
apt-mark unhold kubelet kubectl && \
apt-get update && apt-get install -y kubelet=<versao-kubelet>-00 kubectl=<versao-kubectl>-00 && \
apt-mark hold kubelet kubectl
```
---

17 - Reiniciar o daemon e o kubelet

```
sudo systemctl daemon-reload
```

```
sudo systemctl restart kubelet
```

