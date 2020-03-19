FROM debian:sid

#    git gcc pkg-config make libxml2-dev libxslt-dev ruby ruby-dev  \
#      bundler golang protobuf-compiler libprotobuf-dev && \

RUN apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
      ca-certificates \
      git golang protobuf-compiler libprotobuf-dev && \
    go get github.com/golang/protobuf/protoc-gen-go && \
    go get github.com/uber/prototool/cmd/prototool


ENV PATH="/root/go/bin:${PATH}"
ADD prototool.yaml /protos/prototool.yaml
