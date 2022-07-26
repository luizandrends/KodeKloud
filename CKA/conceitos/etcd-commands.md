# Comandos ETCD


## Salvando snapshod com o etcdctl

```
etcdctl \ snapshot save <file-path>.db
```
Linha de comando responsável por tirar um snapshot do atual ETCD e salvar no diretório atual.

- Caso deseje salvar esse arquivo em algum diretório específico, basta declarar o caminho.

---

## Verificação do status do snapshot

```
etcdctl \ snapshot status <file-path>.db
```

---

## Restaurando ETCD baseado em um snapshot

```
service kube-apiserver stop
```

```
etcdctl \ snapshot restore <file-path>.db --data-dir /var/lib/<backup-path>
```

```
systemctl daemon-reload
```

```
service etcd restart
```

```
service kube-apiserver start
```
Comandos responsáveis por restaurar um ETCD baseado em um snapshot

- Primeiramente precisamos pausar o kube-apiserver para restaurar o ETCD.

- É importante ressaltar que precisamos ajustar o caminho configurado no 
etcd.service alterando o campo ``data-dir=/var/lib/<backup-path>``

- Após o procedimento precisamos reiniciar o daemon, etcd e o kube-apiserver

---

## Comando com endpoint, certificado ca, certificado do etcd e etcd key

```
snapshot save <your-path>.db \
--endpoints=https://127.0.0.1:2379 \
--cacert=/etc/etcd/ca/crt \
--cert=/etc/etcd/etcd-server.crt \
--key=/etc/etcd/etcd-server.key
```
---

# Tutorial ETCDCTL

Em todos os labs da KodeKloud, o ETCD é deployado como um pod estático no Control Plane Node. A versão utiliazada é a v3

Para fazer uso do ETCDCTL para tarefas como a restauração, certifique-se de que a variável de ambiente ETCDCTL_API está com o valor 3

Você pode fazer isso exportando a variável ETCDCTL_API diretamente para o uso do client. Isso pode ser feito dessa maneira:

```
export ETCDCTL_API=3
```

Para ver todas as opções para um sub comando específico, utilize a flag -h ou -help.

Por exemplo

```
etcdctl snapshot save -h
```