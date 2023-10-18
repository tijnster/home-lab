tf-kubernetes-apply:
		cd terraform/proxmox-kubernetes && terraform plan
		cd terraform/proxmox-kubernetes && terraform apply -auto-approve

tf-kubernetes-remove:
		cd terraform/proxmox-kubernetes && terraform destroy -auto-approve

ansible-kubernetes-deploy:
		cd ansible && ansible-playbook -i ansible-hosts.txt ansible-install-kubernetes-deps.yml
		cd ansible && ansible-playbook -i ansible-hosts.txt ansible-init-cluster.yml
		cd ansible && ansible-playbook -i ansible-hosts.txt ansible-get-join-command.yml
		cd ansible && ansible-playbook -i ansible-hosts.txt ansible-join-workers.yml
