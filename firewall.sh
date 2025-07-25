#!/bin/bash

export GCP_PROJECT_NAME="{{ gcp_project }}"
export SERVICE_ACCOUNT_PRIVATE_KEY_JSON="{{ gcp_cred_file }}"

# Lógica para configurar a regra da firewall
gcloud compute firewall-rules create laravelio-firewall --allow=tcp:80 --source-ranges=0.0.0.0/0 --project=$GCP_PROJECT_NAME
