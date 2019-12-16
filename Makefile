all: build-cnab-to-oci build-cnabs push

build-cnabs: build-k8s build-gke

build-k8s:
	docker build -t k8s-cnab:0.1.0-invoc -f k8s/cnab/build/Dockerfile k8s

build-gke:
	docker build -t gke-cnab:0.1.0-invoc -f gke/cnab/build/Dockerfile gke

build-cnab-to-oci:
	docker build --output type=local,dest=./bin --build-arg GOOS=$(shell go env GOOS) ./cnab-to-oci
	chmod +x ./bin/cnab-to-oci

push: push-k8s push-gke

push-k8s:
	./bin/cnab-to-oci push k8s/bundle.json --auto-update-bundle --target ${DOCKER_USERNAME}/k8s-cnab:0.1.0

push-gke:
	./bin/cnab-to-oci push gke/bundle.json --auto-update-bundle --target ${DOCKER_USERNAME}/gke-cnab:0.1.0

.PHONY: all build-cnabs build-cnab-to-oci build-k8s build-gke push push-k8s push-gke