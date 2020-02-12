.PHONY: build-docker-images

dockerfiles += $(wildcard **/Dockerfile)

build-docker-images:
	@$(foreach file, $(dockerfiles), docker build -t sqs1/$(subst /,,$(dir $(file)))-action -f $(file) $(dir $(file));)