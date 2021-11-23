cd commons
mvn clean install -DskipTests
cd ..

docker-compose -f StageDevKit-Compose.yml up
