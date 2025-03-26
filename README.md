
## 📘 Infraestrutura como Código: Script de Provisionamento de Servidor Web (Apache)

Este laboratório foi proposto pelo professor Denilson Bonatti, Tech Lead da DIO, no curso de introdução ao ambiente Linux. O objetivo foi realizar o deploy de uma aplicação em um servidor web utilizando Infraestrutura como Código (IaC) em um script de provisionamento.

### O que é Infraestrutura como Código (IaC)?

Infraestrutura como Código (IaC) refere-se ao processo de gerenciamento e provisionamento da infraestrutura por meio de código, ao invés de processos manuais. Com IaC, configurações da infraestrutura são armazenadas em arquivos de código, o que facilita tanto a edição quanto a distribuição dessas configurações. Além disso, a IaC garante que o mesmo ambiente seja provisionado de forma consistente todas as vezes.

### Controle de Versão

O controle de versão é um aspecto fundamental da IaC. Os arquivos de configuração devem ser tratados como código-fonte e versionados da mesma forma. Isso permite a modularização da infraestrutura, que pode ser combinada de diferentes maneiras por meio de automação.

---

### Passos Realizados

#### 1. Subir uma Máquina Virtual:

A máquina virtual foi criada na nuvem GCP com as seguintes configurações:

```bash
gcloud compute instances create webserver \
  --project=inner-precept-366512 \
  --zone=us-west1-b \
  --machine-type=e2-micro \
  --network-interface=network-tier=PREMIUM,subnet=default \
  --maintenance-policy=MIGRATE \
  --provisioning-model=STANDARD \
  --service-account=787341881121-compute@developer.gserviceaccount.com \
  --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
  --tags=http-server \
  --create-disk=auto-delete=yes,boot=yes,device-name=webserver,image=projects/debian-cloud/global/images/debian-11-bullseye-v20220920,mode=rw,size=10,type=projects/inner-precept-366512/zones/us-west4-b/diskTypes/pd-balanced \
  --no-shielded-secure-boot \
  --shielded-vtpm \
  --shielded-integrity-monitoring \
  --reservation-affinity=any
```

#### 2. Atualizar o servidor

Os seguintes passos foram executados para configurar o servidor:

- Instalar o Apache2
- Instalar o Unzip
- Baixar a aplicação do GitHub no diretório `/tmp`
- Copiar os arquivos da aplicação para o diretório padrão do Apache
- Subir o script de provisionamento para um repositório no GitHub

#### 3. Como usar o script

Para executar o script de provisionamento, siga os passos abaixo:

1. Crie uma pasta na raiz do servidor:

```bash
cd /
sudo mkdir script
```

2. Entre na pasta e crie o script com o nome `script-iac-webserver.sh`:

```bash
cd /script
sudo nano script-iac-webserver.sh
```

3. Copie o conteúdo do script padrão e altere o link da sua aplicação web (modifique o endereço do arquivo ZIP). Salve e feche o arquivo.

4. Conceda permissão de execução ao script:

```bash
sudo chmod +x script-iac-webserver.sh
```

5. Execute o script (recomenda-se realizar uma snapshot para segurança antes):

```bash
sudo ./script-iac-webserver.sh
```

---

### Subindo o Projeto para o GitHub

1. Verifique se o Git está instalado na máquina virtual:

```bash
apt install git -y
```

2. Configure o Git:

```bash
git config --global user.email "[EMAIL]"
git config --global user.name "[NOME DO USUÁRIO]"
```

3. Suba o projeto para o GitHub:

```bash
git init
git add .
git commit -m "Arquivos IaC v.1"
git branch -M main
git remote add origin git@github.com:AndersonGabrielCalasans/LinuxProject-InfraAsACode.git
git push -u origin main
```

---

