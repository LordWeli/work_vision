start:
	@echo "Starting Rails server..."
	@bin/rails server > /dev/null 2>&1 &
	@echo "Rails server started in background."

stop:
	@echo "Stopping Rails server..."
	@kill `lsof -t -i:3000`
	@echo "Rails server stopped."

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
