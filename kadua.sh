gcloud alpha ai custom-jobs create \
    --region=europe-north1 \
    --display-name=kucluk1 \
    --worker-pool-spec=machine-type=e2-standard-32,replica-count=1,container-image-uri=gcr.io/wik/subu:nya \
    --worker-pool-spec=machine-type=e2-standard-8,replica-count=1,container-image-uri=gcr.io/wik/subu:nya