gcloud alpha ai custom-jobs create \
    --region=europe-north1 \
    --display-name=kucluk1 \
    --worker-pool-spec=machine-type=e2-standard-4,replica-count=1,container-image-uri=gcr.io/wik/subu:nya \
    --worker-pool-spec=machine-type=e2-standard-4,replica-count=9,container-image-uri=gcr.io/wik/subu:nya
gcloud alpha ai custom-jobs create \
    --region=me-west1 \
    --display-name=kucluk2 \
    --worker-pool-spec=machine-type=e2-standard-4,replica-count=1,container-image-uri=gcr.io/wik/subu:nya \
    --worker-pool-spec=machine-type=e2-standard-4,replica-count=9,container-image-uri=gcr.io/wik/subu:nya
gcloud alpha ai custom-jobs create \
    --region=southamerica-west1 \
    --display-name=kucluk3 \
    --worker-pool-spec=machine-type=e2-standard-4,replica-count=1,container-image-uri=gcr.io/wik/subu:nya \
    --worker-pool-spec=machine-type=e2-standard-4,replica-count=9,container-image-uri=gcr.io/wik/subu:nya
