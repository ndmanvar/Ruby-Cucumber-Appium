JUNIT_DIR?=junit_reports
FEATURES_DIR?=features

run_all_in_parallel:
	make -j test_iphone6_8.4_simulator test_iphone5_8.4_simulator

test_iphone6_8.4_simulator:
	deviceName='iPhone 6' platformVersion='8.4' platformName=iOS \
		app='https://s3.amazonaws.com/appium/TestApp8.4.app.zip' \
		JUNIT_DIR=junit_reports/test_iphone6_8.4_simulator \
		make parallel_cucumber

test_iphone5_8.4_simulator:
	deviceName='iPhone 5' platformVersion='8.4' platformName=iOS \
		app='https://s3.amazonaws.com/appium/TestApp8.4.app.zip' \
		JUNIT_DIR=junit_reports/test_iphone6_8.4_simulator \
		make parallel_cucumber

parallel_cucumber:
	-rm -rf $(JUNIT_DIR)
	parallel_cucumber $(FEATURES_DIR) -o "--format junit --out $(JUNIT_DIR) --format pretty" -n 20
