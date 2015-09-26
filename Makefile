JUNIT_DIR?=junit_reports
FEATURES_DIR?=features
SPLIT_FEATUERS_DIR?=split_features


run_all_in_parallel:
	make -j test_iphone6_8.0_real_device

test_iphone6_8.0_real_device:
	deviceName='iPhone 6 Device' platformVersion='8.0' platformName=iOS \
		JUNIT_DIR=junit_reports/test_iphone6_8.0_real_device \
		make parallel_cucumber

parallel_cucumber:
	-rm -rf $(JUNIT_DIR)
	parallel_cucumber $(FEATURES_DIR) -o "--format junit --out $(JUNIT_DIR) --format pretty" -n 20
