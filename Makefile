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
		kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.1.1/cert-manager.yaml

install-reflector:
		helm repo add emberstack https://emberstack.github.io/helm-charts
		helm repo update
		helm upgrade --install reflector emberstack/reflector
