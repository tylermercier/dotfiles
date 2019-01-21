#!/bin/bash

# Enable dev
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/lib/google-cloud-sdk/path.bash.inc' ]; then source '/usr/local/lib/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/lib/google-cloud-sdk/completion.bash.inc' ]; then source '/usr/local/lib/google-cloud-sdk/completion.bash.inc'; fi

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/tylermercier/.kube/config:/Users/tylermercier/.kube/config.shopify.cloudplatform
for file in /Users/tylermercier/src/github.com/Shopify/cloudplatform/workflow-utils/*.bash; do source ${file}; done
kubectl-short-aliases
