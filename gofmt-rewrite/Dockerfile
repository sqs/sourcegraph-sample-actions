FROM golang:alpine

CMD find -name '*.go' | xargs gofmt -w -r 'http.Get(url) -> ctxhttp.Get(ctx, nil, url)'
