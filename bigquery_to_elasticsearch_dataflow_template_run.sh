#!/bin/bash
export JAVA_SCRIPT_ID_FN_GCS_PATH=gs://${PROJECT}_elastic-dataflow/udf/id_transform_${INDEX}.js
export OUTPUT_DEADLETTER_TABLE=${PROJECT}:${DATASET_NAME}.deadletter_table_${INDEX}
export BULK_INSERT_METHOD=CREATE
export MAX_RETRY_ATTEMPTS=3
export MAX_RETRY_DURATION=60000
export JAVA_SCRIPT_ID_FN_NAME=extractId
export USE_PARTIAL_UPDATE=false
export BUCKET_NAME=gs://${PROJECT}_elastic-dataflow

mvn clean package -PtemplatesRun \
-DskipTests \
-DprojectId="$PROJECT" \
-DbucketName="$BUCKET_NAME" \
-Dregion="$REGION" \
-DjobName="bigquery-to-elasticsearch-job" \
-DtemplateName="BigQuery_to_Elasticsearch" \
-Dparameters="inputTableSpec=$INPUT_TABLE_SPEC,outputDeadletterTable=$OUTPUT_DEADLETTER_TABLE,connectionUrl=$CONNECTION_URL,apiKey=$API_KEY,index=$INDEX,maxRetryAttempts=$MAX_RETRY_ATTEMPTS,maxRetryDuration=$MAX_RETRY_DURATION,javaScriptIdFnGcsPath=$JAVA_SCRIPT_ID_FN_GCS_PATH,javaScriptIdFnName=$JAVA_SCRIPT_ID_FN_NAME,usePartialUpdate=$USE_PARTIAL_UPDATE,bulkInsertMethod=$BULK_INSERT_METHOD" \
-pl v2/googlecloud-to-elasticsearch -am