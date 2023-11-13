.PHONY: up
up:
	sh ./local_install.sh

.PHONY: install-crossplane-cli
install-crossplane-cli:
	@if ! command -v crossplane &> /dev/null; then \
  echo "Installing crossplane"; \
  cd scripts; \
  curl -sL "https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh" | sh && sudo mv crossplane /usr/local/bin; \
  cd .. ;\
fi

.PHONY: crossplane-config
crossplane-config: install-crossplane-cli
	echo "hi"

.PHONY: clean
clean:
	k3d registry delete k3d-backstack.localhost
	k3d cluster delete backstack

.PHONY: login-to-ghcr
login-to-ghcr:
	cho $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
