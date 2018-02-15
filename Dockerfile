FROM alpine:3.6

RUN apk add --no-cache curl && \
    curl -L -o /tmp/helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.8.1-linux-amd64.tar.gz && \
    tar xvf /tmp/helm.tar.gz && \
    mv linux-amd64/helm /usr/bin/helm && \
    rm /tmp/helm.tar.gz

ENV HELM_HOST "tiller-deploy.kube-system:44134"

# We use sleep 60 here to work around issues with 'kubectl run' missing output.
# Instead, launch a pod with this image using 'kubectl run hs --restart=Never ...'
# and then use 'kubectl exec hs helm install ...'
ENTRYPOINT ["sleep", "60"]
