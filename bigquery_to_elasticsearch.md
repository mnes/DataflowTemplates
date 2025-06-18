## Install java 17
```
brew install openjdk@17
```

## Install maven
```
brew install maven
```

## Environment variables setting
```
cp .env.example .env
```
change env variables in `.env` file according the project
## Allow direnv
```
allow direnv
```
## Build and Run dataflow
```
bash ./bigquery_to_elasticsearch_dataflow_template_run.sh
```
this will create 
- dataflow template in `gs://{PROJECT}_elastic-dataflow/{Date}_RC01/flex/BigQuery_to_Elasticsearch`
- template image in `gcr.io/{PROJECT}/{Date}_rc01/bigquery-to-elasticsearch`
- and it will also run the dataflow in corresponding project `Dataflow/Jobs`

use the template for next time use without building
- `gs://{PROJECT}_elastic-dataflow/{Date}_RC01/flex/BigQuery_to_Elasticsearch`