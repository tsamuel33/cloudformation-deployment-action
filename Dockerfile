FROM ubuntu:22.04

RUN apt update && apt install -y \
    python3 \
    git \
    pip && pip install \
    cfn-lint \
    boto3 \
    GitPython \
    jsonpath-ng

COPY ./scripts /scripts
ENTRYPOINT [ "/scripts/entrypoint.sh" ]