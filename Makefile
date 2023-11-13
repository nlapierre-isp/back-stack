 CROSSPLANE_CLI_VERSION="v1.13.2"

.PHONY: install-crossplane-cli
install-crossplane-cli:
	@if ! command -v crossplane &> /dev/null; then \
  echo "Installing crossplane cli in /usr/local/bin directory"; \
  cd scripts; \
  export XP_VERSION="${CROSSPLANE_CLI_VERSION}" && curl -sL "https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh" | sh && sudo mv crossplane /usr/local/bin; \
  cd .. ;\
fi
	@if [ "$(crossplane --version)" != "${CROSSPLANE_CLI_VERSION}" ]; then \
  echo "Installing crossplane version ${CROSSPLANE_CLI_VERSION} in /usr/local/bin directory"; \
  cd scripts; \
  export XP_VERSION="${CROSSPLANE_CLI_VERSION}" && curl -sL "https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh" | sh && sudo mv crossplane /usr/local/bin; \
  cd .. ;\
fi

.PHONY: crossplane-config
crossplane-config: install-crossplane-cli
	echo "hi"

.PHONY: asdf-install
asdf-install:
	-@while read -r line; do \
  linearray=($$line); \
  asdf plugin add $$linearray > /dev/null || true; \
done < .tool-versions
	@asdf install > /dev/null
	@echo "installed asdf dependencies"

.PHONY: clean
clean:
	k3d registry delete k3d-backstack.localhost
	k3d cluster delete backstack

.PHONY: up
up: clean install-crossplane-cli asdf-install
	sh local-install.sh
