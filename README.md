# PREREQUIS
- une machine avec linux installée dessus
- git installé sur la machine  
- terraform d'installé
- ansible installé sur la machine
- un compte AWS

Pour installer git
https://git-scm.com/book/fr/v2/D%C3%A9marrage-rapide-Installation-de-Git

Pour installer terraform
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

Pour installer ansible
https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

# UTILITE
Les scripts terraform vont effectuer les opérations suivantes

- creation de 3 vm EC2 sur AWS
- création d'un bucket S3 pour stocker les information
- création des roles pour connecter les VMs EC2 au stockage S3

# INITIALISATION

## Cloner le repo git

creer un dossier avec mkdir
'sudo mkdir <nom fichier>'

Se mettre dans ce dossier pour executer des commandes
'cd <nom fichier>'

Cloner le repository  avec la commande 
'git clone https://github.com/Elliot862/TP_Terraform.git'

## Executer les fichiers terraform

'terraform init'
'terraform apply'

répondre "yes" à la question

# UTILISATION DU FICHIER DE VARIABLE
Les réglages se font via des variables qui doivent:
- être déclaré dans le fichier variables.tf
- être attribué dans le fichier terraform.tfvars




