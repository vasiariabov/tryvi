FROM alpine:latest 

ARG TRIVY_USERNAME
ARG TRIVY_PASSWORD
ARG IMAGE_TEST

ENV TRIVY_USERNAME=$TRIVY_USERNAME
ENV TRIVY_PASSWORD=$TRIVY_PASSWORD
ENV IMAGE_TEST=$IMAGE_TEST

RUN apk add curl \ 
&& curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/master/contrib/install.sh | sh -s -- -b /usr/local/bin

CMD ["sh", "-c", "trivy image $IMAGE_TEST"]
