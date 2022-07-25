# Comandos para manutenção

## kubeadm

```
apt-get upgrade -y kubeadm=version
```

Linha de comando responsável pela atualização do kubeadm para a versão que deseja atualizar no node

---

```
apt-get upgrade -y kubelet=version
```

Linha de comando responsável pela atualização do kubelet para a versão que deseja atualizar o node.

---

```
kubeadm upgrade node config --kubelet-version <kubelet-version>
```

Linha de comando responsável pelo upgrade do kubelet dentro de um node.

---

```
systemctl restart kubelet
```
Linha de comando responsável pelo restart do serviço do kubelet

---

```
kubeadm upgrade plan
```

Linha de comando responsável por fazer o plan da atualização no node em que se encontra.

## Kubectl

```
kubectl drain <node-name>
```

Linha de comando responsável por mover os workloads de um node e não permite que pods sejam criados nesse node.

---

```
kubectl cordon <node-name>
```

Linha de comando responsável por tornar um node unschedulable.