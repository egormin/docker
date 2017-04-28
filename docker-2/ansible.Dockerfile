#connecting previously created python
FROM python
MAINTAINER ilya_khamiakou
RUN pip install ansible==2.2.1
WORKDIR /data
CMD ["bash"]
