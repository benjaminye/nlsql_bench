db_root_path='./mini_dev_data/dev_databases/'
diff_json_path='./data/mini_dev_sqlite.json' # _sqlite.json, _mysql.json, _postgresql.json
# Path where the predicted SQL queries are stored
predicted_sql_path='./exp_result/custom/'

ground_truth_path='./data/'
num_cpus=4
meta_time_out=30.0


data_mode='mini_dev' # dev, train, mini_dev
# Choose the engine to run, e.g. gpt-4, gpt-4-32k, gpt-4-turbo, gpt-35-turbo, GPT35-turbo-instruct
engine='mistral-navigator'
sql_dialect='SQLite'

mode_gt='gt'
mode_predict='gpt'




echo "starting to compare with knowledge for ex engine: ${engine} sql_dialect: ${sql_dialect}"
python3 -u ./src/evaluation_ex.py --db_root_path ${db_root_path} --predicted_sql_path ${predicted_sql_path} --data_mode ${data_mode} \
--ground_truth_path ${ground_truth_path} --num_cpus ${num_cpus} --mode_gt ${mode_gt} --mode_predict ${mode_predict} \
--diff_json_path ${diff_json_path} --meta_time_out ${meta_time_out} --engine ${engine} --sql_dialect ${sql_dialect}



echo "starting to compare with knowledge for ves engine: ${engine} sql_dialect: ${sql_dialect}"
python3 -u ./src/evaluation_ves.py --db_root_path ${db_root_path} --predicted_sql_path ${predicted_sql_path} --data_mode ${data_mode} \
--ground_truth_path ${ground_truth_path} --num_cpus ${num_cpus} --mode_gt ${mode_gt} --mode_predict ${mode_predict} \
--diff_json_path ${diff_json_path} --meta_time_out ${meta_time_out}  --engine ${engine} --sql_dialect ${sql_dialect}


echo "starting to compare with knowledge for soft-f1 engine: ${engine} sql_dialect: ${sql_dialect}"
python3 -u ./src/evaluation_f1.py --db_root_path ${db_root_path} --predicted_sql_path ${predicted_sql_path} --data_mode ${data_mode} \
--ground_truth_path ${ground_truth_path} --num_cpus ${num_cpus} --mode_gt ${mode_gt} --mode_predict ${mode_predict} \
--diff_json_path ${diff_json_path} --meta_time_out ${meta_time_out}  --engine ${engine} --sql_dialect ${sql_dialect}