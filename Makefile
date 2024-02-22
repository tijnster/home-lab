tf-deploy-vm:
		cd terraform && terraform plan
		cd terraform && terraform apply -auto-approve

tf-remove-vm:
		cd terraform && terraform destroy -auto-approve

ansible-kubernetes-deploy:
		cd ansible && ansible-playbook -i ansible-hosts.txt ansible-install-kubernetes-deps.yml
		cd ansible && ansible-playbook -i ansible-hosts.txt ansible-init-cluster.yml
		cd ansible && ansible-playbook -i ansible-hosts.txt ansible-get-join-command.yml
		cd ansible && ansible-playbook -i ansible-hosts.txt ansible-join-workers.yml

install-certmanager:
		kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.3/cert-manager.yaml

install-reflector:
		helm repo add emberstack https://emberstack.github.io/helm-charts
		helm repo update
		helm upgrade --install reflector emberstack/reflector

install-metallb:
		kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.12/config/manifests/metallb-native.yaml

install-nginx-controller:
		kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/cloud/deploy.yaml

install-k8-dashboard:
		kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

