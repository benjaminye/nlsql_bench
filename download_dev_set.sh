mkdir data

wget https://bird-bench.oss-cn-beijing.aliyuncs.com/dev.zip
unzip dev.zip
rm dev.zip

unzip ./dev_20240627/dev_databases.zip -d ./llm/mini_dev_data/
rm ./dev_20240627/dev_databases.zip

mv ./dev_20240627/dev* ./data
rm -rf ./dev_20240627
