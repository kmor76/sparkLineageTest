../bin/spark-shell \
--master local[*] \
--conf spark.hadoop.fs.s3a.access.key=lRzQo7Nr5Jg36n3nimDI \
--conf spark.hadoop.fs.s3a.secret.key=jA5j0Yhp9LY3I9E7WwCsKYDOV738COT53pT8S4vI \
--conf spark.hadoop.fs.s3a.endpoint=http://minio:9000 \
--conf spark.hadoop.fs.s3a.path.style.access=True \
--conf spark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem \
--conf spark.jars.packages=io.acryl:datahub-spark-lineage:0.10.4 \
--conf spark.extraListeners=datahub.spark.DatahubSparkListener \
--conf spark.datahub.rest.server=http://datahub-gms:8080

cd ../jars
wget https://repo1.maven.org/maven2/io/acryl/datahub-spark-lineage/0.10.4-3/datahub-spark-lineage-0.10.4-3.jar


../bin/spark-sql \
--master local[*] \
--conf spark.hadoop.fs.s3a.access.key=lRzQo7Nr5Jg36n3nimDI \
--conf spark.hadoop.fs.s3a.secret.key=jA5j0Yhp9LY3I9E7WwCsKYDOV738COT53pT8S4vI \
--conf spark.hadoop.fs.s3a.endpoint=http://minio:9000 \
--conf spark.hadoop.fs.s3a.path.style.access=True \
--conf spark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem


../bin/spark-sql \
--master local[*] \
--conf spark.hadoop.fs.s3a.access.key=lRzQo7Nr5Jg36n3nimDI \
--conf spark.hadoop.fs.s3a.secret.key=jA5j0Yhp9LY3I9E7WwCsKYDOV738COT53pT8S4vI \
--conf spark.hadoop.fs.s3a.endpoint=http://minio:9000 \
--conf spark.hadoop.fs.s3a.path.style.access=True \
--conf spark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem \
--conf spark.jars.packages=io.acryl:datahub-spark-lineage:0.10.4 \
--conf spark.extraListeners=datahub.spark.DatahubSparkListener \
--conf spark.datahub.rest.server=http://datahub-gms:8080




../sbin/start-thriftserver.sh \
  --conf spark.hadoop.fs.s3a.endpoint=http://minio:9000 \
  --conf spark.hadoop.fs.s3a.path.style.access=True \
  --conf spark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem \
  --conf spark.hadoop.fs.s3a.access.key=lRzQo7Nr5Jg36n3nimDI \
  --conf spark.hadoop.fs.s3a.secret.key=jA5j0Yhp9LY3I9E7WwCsKYDOV738COT53pT8S4vI \
  --hiveconf hive.server2.thrift.port=10000 \
  --hiveconf hive.server2.thrift.bind.host=0.0.0.0 \
  --master local[*]

!connect jdbc:hive2://spark:10000