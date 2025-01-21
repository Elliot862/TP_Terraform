# TP_Terraform
# TP_Terraform
Atelier
Titre : TP Terraform : Provisionnement d'Infrastructure sur AWS
Description : Ce TP a pour objectif de mettre en pratique les concepts de Terraform en créant et
configurant une infrastructure sur AWS. Les apprenants utiliseront des modules, des variables,
et des outputs pour personnaliser et étendre leurs configurations.
Automatisation d'Infrastructure avec Terraform et
Ansible
Mettre en place une infrastructure cloud sur AWS en utilisant Terraform pour provisionner les ressources
nécessaires et Ansible pour la configuration des machines.
Provisionnement d'Infrastructure
Provisionner l'infrastructure définie dans votre fichier de configuration.
Initialiser le projet Terraform
Initialisez votre projet Terraform pour télécharger les plugins nécessaires.
Dans le terminal, exécutez `terraform init` dans le dossier `terraform_project`.Vérifiez que les plugins sont
téléchargés sans erreurs.Appliquer la configuration
Créez l'infrastructure en utilisant la commande Terraform apply.
Exécutez `terraform apply` dans le terminal.Confirmez l'application en tapant 'yes' lorsqu'il vous le demande.
Vérifiez dans la console AWS que l'instance EC2 a bien été créée.


Travaux Pratiques : Automatisation d'Infrastructure avec Terraform et Ansible
Objectif du TP : Mettre en place une infrastructure cloud sur AWS en utilisant Terraform pour provisionner les ressources nécessaires et Ansible pour la configuration des machines.

Contexte : Votre entreprise souhaite automatiser le déploiement d'une infrastructure cloud évolutive et reproductible. L'objectif est de créer une architecture comprenant des instances EC2 et un bucket S3 dans un réseau bien configuré. Vous utiliserez Terraform pour la création des ressources et Ansible pour l'installation de Docker sur les machines.

Partie 1 : Provisionnement avec Terraform
1.	Configuration des ressources AWS
•	Créer un fichier paramétrique permettant d'utiliser des variables pour définir la région AWS. 
•	Provisionner 3 instances EC2 avec accès SSH. 
•	Créer un bucket S3. 
•	Configurer un VPC, un subnet, une gateway Internet et des groupes de sécurité permettant la connexion SSH aux instances. 
2.	Structuration des fichiers (Point bonus)
•	Séparer la configuration en plusieurs fichiers Terraform : 
•	main.tf : Définition des ressources principales. 
•	variables.tf : Déclaration des variables. 
•	outputs.tf : Définition des sorties utiles (IP des EC2, nom du bucket S3). 
•	provider.tf : Configuration du fournisseur AWS. 
Livrables attendus :
•	Code Terraform structuré. 
•	Fichier terraform.tfvars pour définir les valeurs de variables. 
•	Commandes utilisées pour appliquer la configuration. 

Partie 2 : Configuration avec Ansible
1.	Configuration de l'inventaire Ansible
•	Récupérer les adresses IP des instances EC2 provisionnées. 
•	Créer un fichier d'inventaire Ansible contenant les IP des machines. 
2.	Installation de Docker sur les EC2
•	Écrire un playbook Ansible pour : 
•	Mettre à jour les paquets. 
•	Installer Docker. 
•	Démarrer et activer le service Docker. 
3.	Exécution du playbook
•	Se connecter aux machines via SSH. 
•	Exécuter le playbook Ansible pour automatiser l'installation de Docker. 
Livrables attendus :
•	Fichier d'inventaire Ansible. 
•	Playbook Ansible pour l'installation de Docker. 
•	Commandes utilisées pour exécuter Ansible. 

Critères de validation :
•	Infrastructure fonctionnelle avec les 3 instances EC2 et le bucket S3. 
•	Possibilité de se connecter aux instances via SSH. 
•	Docker installé et fonctionnel sur toutes les machines. 
•	Respect de la structuration demandée des fichiers Terraform. 
Point bonus :
•	Mise en place d'un module Terraform réutilisable pour les ressources EC2. 
•	Automatisation complète via un script d'exécution. 

Consignes de rendu :
•	Dépôt du code sur un repository Git (GitHub, GitLab, etc.). 
•	Un fichier README.md expliquant les étapes pour reproduire l'infrastructure. 
•	Capture d'écran de la connexion aux instances et de la vérification de l'installation de Docker. 

Bonne chance et bon travail !

