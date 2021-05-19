
# challenge-ia

## Technical Test

Tools used in this challenge:

- Prometheus
- AlertManager
- Docker
- cAdvisor
- Grafana
- Node_Exporter
- Github Actions
- terraform

## **How to install it:**
Clone the repositório challenge-ia:

<pre><code># git clone https://github.com/joao-dore/challenge-ia.git</code></pre>

## Install Docker and create Swarm cluster:

<pre><code># curl -fsSL https://get.docker.com | sh
# docker swarm init
</code></pre>

## Deploy Stack with Docker Swarm:

<pre><code># docker stack deploy -c docker-compose.yml challenge-ia

Creating network challenge_backend
Creating network challenge_frontend
Creating service challenge_cadvisor
Creating service challenge_grafana
Creating service challenge_application
Creating service challenge_prometheus
Creating service challenge_node-exporter
Creating service challenge_alertmanager
</code></pre>

Verify if services are ok:
<pre><code>
# docker service ls

ID             NAME                      MODE         REPLICAS   IMAGE                                   PORTS
mpwif3cjs6yg   challenge_alertmanager    replicated   1/1        linuxtips/alertmanager_alpine:latest    *:9093->9093/tcp
2nxpjljif8l8   challenge_application     replicated   1/1        joaodore/node:latest                    *:8081->8081/tcp
13jkwa3a6rgk   challenge_cadvisor        global       1/1        google/cadvisor:latest                  *:8080->8080/tcp
oudqakf7pnx6   challenge_grafana         replicated   1/1        grafana/grafana:latest                  *:3000->3000/tcp
jm6yqx47lb49   challenge_node-exporter   global       1/1        linuxtips/node-exporter_alpine:latest   *:9100->9100/tcp
p9mms8zth0ue   challenge_prometheus      replicated   1/1        linuxtips/prometheus_alpine:latest      *:9090->9090/tcp
</code></pre>

 
## Access Services in Browser

To access Prometheus interface on browser:

<pre><code>http://YOUR_IP:9090</code></pre>

To access AlertManager interface on browser:

<pre><code>http://YOUR_IP:9093</code></pre>

To access Grafana interface on browser:
  
<pre><code>http://YOUR_IP:3000
user: admin
passwd: atlantico
</code></pre>

create a Prometheus data source using the URL below:

<pre><code>http://tasks.prometheus:9090/

On the dashboard section import the json "challenge_dashboard" just to
check some customizable dashboards.
</code></pre>

To access Prometheus Node_exporter metrics on browser:

<pre><code>http://YOUR_IP:9100/metrics</code></pre>
