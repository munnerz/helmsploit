# Helmsploit

This is a really simple docker image that demonstrates whether an attacker would
be able to escalate their privileges via Tiller's gRPC API.

You can run it with:

```
kubectl run --restart=Never --image=munnerz/helmsploit:2.8.1 hs && sleep 10 && kubectl exec hs helm list
```

Replace 'helm list' with 'helm install' and you will realise despite your fine-grained
RBAC policies, anyone with access to your pods can manipulate helm deployments (and deploy
new charts).

This is not a bug in Helm or Tiller, rather a not-so-well-known fact of Tiller's default
deployment (via `helm init`).

If you want to secure Tiller against this kind of attack, take a look at the [Helm documentation](https://github.com/kubernetes/helm/blob/master/docs/tiller_ssl.md).

