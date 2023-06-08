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