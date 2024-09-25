# k8s-challenge
kubernetes deployment for challenge

Despliegue del proyecto: 

El despliegue del proyecto se realizara automatizado con ArgoCD. 

Requisitos: 

Minikube: 

Teniendo minikube instalado segun el SO es necesario ejecutar los siguientes comandos para iniciar el proyecto: 

"minikube start
minikube addons enable metrics-server # requisito para HPA
minikube dasboard & # Opcional para tener un panel web para monitorear procesos."

Luego de iniciado el cluster ejecutar el script para inicializar argo y deployar automaticamente los microservicios: 

en la carpeta raiz del repo ejecutar ./install-argocd.sh # validar permisos de ejecucion, en caso de faltar ejecutar "chmod +x install-argocd.sh"
