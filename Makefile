BUCKET ?= sra.arup.digital

default: dev

all: setup build deploy

cleanDeps:
	rm -rf node_modules
	rm -rf package-lock.json

clean:
	rm -rf dist

setup: cleanDeps
	npm install

dev:
	npm run dev

build: clean
	npm run build

deploy:
	aws s3 cp build s3://$(BUCKET)/ --recursive --acl public-read --region ap-southeast-2

.PHONY: setup dev clean build deploy default all cleanDeps
