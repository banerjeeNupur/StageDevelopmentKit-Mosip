# StageDevelopmentKit-Mosip

1. Generate GPG keys

2. Run setup1.sh
    
   This will perform the following:
    
   - clone git repos for https://github.com/mosip/commons, https://github.com/mosip/mosip-config (branch 1.1.5.4)
   - wget jar for config : https://repo1.maven.org/maven2/io/mosip/kernel/kernel-config-server/1.1.2-rc3/kernel-config-server-1.1.2-rc3.jar
   
3. Change the following files

   - Properties file for mosip_master:
     
     **/commons/db_scripts/mosip_master/mosip_master_deploy.properties**
     
      ```
      DB_SERVERIP=postgres
      DB_PORT=5432
      SU_USER=postgres
      SU_USER_PWD=root
      DEFAULT_DB_NAME=postgres
      MOSIP_DB_NAME=mosip_master
      SYSADMIN_USER=sysadmin
      SYSADMIN_PWD=Mosipadm@dev123
      DBADMIN_PWD=Mosipadm@dev123
      APPADMIN_PWD=Mosipadm@dev123
      DBUSER_PWD=Mosip@dev123
      BASEPATH=/
      LOG_PATH=/logs/
      COMMON_ROLE_FILENAME=mosip_role_common.sql
      APP_ROLE_FILENAME=mosip_role_masteruser.sql
      DB_CREATION_FILENAME=mosip_master_db.sql
      ACCESS_GRANT_FILENAME=mosip_master_grants.sql
      DDL_FILENAME=mosip_master_ddl_deploy.sql
      DML_FLAG=1
      DML_FILENAME=mosip_master_dml_deploy.sql
      ```

    - AuditManagerBootApplication in kernel-auditmanager-service
      
      **/commons/kernel/kernel-auditmanager-service/src/main/java/io/mosip/kernel/auditmanager**
  
      ```
      replace ${mosip.auth.adapter.impl.basepackage} with io.mosip.kernel.auth.defaultadapter
      ```

4. Run setup2.sh
   
   This will do the following :
   
   - mvn clean install -DskipTests
   - run the compose file to build and run images for Auth, Audit, Config service and setup mosip_master database.
