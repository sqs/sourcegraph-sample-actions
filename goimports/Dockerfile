FROM golang:alpine

# goimports needs to fetch Go modules, which requires Git.
RUN apk update && apk upgrade && \
	apk add --no-cache git openssh

CMD go get golang.org/x/tools/cmd/goimports && \
	goimports -w .
