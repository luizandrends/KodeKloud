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