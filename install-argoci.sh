#!/bin/bash

# Crear namespace argocd
kubectl create namespace argocd

# Instalar ArgoCD
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Esperar a que los pods de ArgoCD estén listos
echo "Esperando a que ArgoCD se despliegue..."
kubectl wait --for=condition=available --timeout=600s deployment/argocd-server -n argocd

# Exponer ArgoCD (opcionalmente puedes usar LoadBalancer o NodePort)
kubectl port-forward svc/argocd-server -n argocd 8080:443 &

# Obtener la contraseña de admin
ARGO_PWD=$(kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode)
echo "La contraseña de admin es: $ARGO_PWD"

# Aplicar el manifiesto de la aplicación de ArgoCD
kubectl apply -f argo-application.yaml

echo "La aplicación ha sido configurada en ArgoCD"
