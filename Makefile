DOCKER_CMD_PREFIX := docker run --rm -u $$(id -u):$$(id -g) -w /node/ci-ui -v $(shell pwd):/node/ci-ui
DOCKER_RUN_SUFFIX := -it --name react node:15
DOCKER_RUN := ${DOCKER_CMD_PREFIX} ${DOCKER_RUN_SUFFIX}
DISTFILE := ci-ui.tar.gz
DISTDIR := ci-ui
DIST_NODE_VERSION := 11
BUILDDIR := build

start:
	$(DOCKER_RUN) bash -c "yarn install && yarn start"

shell:
	$(DOCKER_RUN) bash

exec-shell:
	docker exec -it react bash

dist:
	rm -rf $(BUILDDIR) $(DISTFILE) $(DISTDIR)
	$(DOCKER_CMD_PREFIX) node:$(DIST_NODE_VERSION) bash -c "yarn install && yarn build"
	mv $(BUILDDIR) $(DISTDIR)
	tar -cvz -f $(DISTFILE) $(DISTDIR)

dist-container: dist
	box -t tinyci/ui-nginx:latest box-dist.rb
