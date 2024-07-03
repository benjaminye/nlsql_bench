mkdir ./llm/data

wget https://bird-bench.oss-cn-beijing.aliyuncs.com/minidev.zip
unzip minidev.zip
rm minidev.zip

mv ./minidev/MINIDEV/dev_databases ./llm/mini_dev_data
mv ./minidev/MINIDEV/dev* ./llm/data
mv ./minidev/MINIDEV/mini_dev* ./llm/data

rm -rf ./minidev