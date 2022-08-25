# Guia para configuração do iptables

Trabalhando com iptables, temos a seguinte sintaxe para ditar regras:

```jsx
sudo iptables [option] CHAIN_rule [-j target] 
```

Para listar as portas:

```jsx
sudo iptables -L INPUT
```

Autorizar portas - localhost, ssh, http, https:

```jsx
sudo iptables -A INPUT -i lo -j ACCEPT
```

```jsx
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

```jsx
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
```

```jsx
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
```

Para bloquear o tráfego de outras portas que não seja a que configuramos:

```jsx
sudo iptables -A INPUT -j DROP
```

Após configurar a tabela de portas que queremos deixar em aberto, precisamos salvar essa lista em um local para quando o SO reiniciar ele mesmo atualizar as portas, pois por padrão o ** iptables ** é desconfigurado ao desligar o SO.

---

Para isso temos o ** iptables-persistent ** que salva a nossa lista de regras e inicia junto com o sistema operacional. 

Instale ele com o comando:

```jsx
apt-get install iptables-persistent
```

Salve as suas regras, com o comando abaixo:

```jsx
sudo iptables-save > /etc/iptables/rules.v4
sudo ip6tables-save > /etc/iptables/rules.v6
```