start:
	@echo "Starting webpack-dev-server and Rails server..."
	@bin/webpack-dev-server > /dev/null 2>&1 &
	@rails server > /dev/null 2>&1 &
	@echo "Webpack-dev-server and Rails server started in background."

stop:
	@echo "Stopping webpack-dev-server and Rails server..."
	@kill `lsof -t -i:3000`
	@kill `lsof -t -i:3035`
	@echo "Webpack-dev-server and Rails server stopped."

db_setup:
	@echo "\nStarting the database creation 🔨\n"
	@rails db:create
	@echo "Database created successfully. 🎉\n"

	@echo "Starting the database migration 🔨\n"
	@rails db:migrate
	@echo "Database migrated successfully. 🎉\n"

db_reset:
	@echo "Starting database drop 🔨\n"
	@rails db:drop
	@echo "Database dropped successfully. 🎉\n"
	$(MAKE) db_setup
	@echo "\nDatabase has been reset successfully. 🎉\n"
