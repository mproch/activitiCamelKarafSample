create table ACT_CY_CONFIG (
	ID_ varchar,
    VALUE_ clob,
    REV_ integer,
    primary key (ID_)
);

create table ACT_CY_LINK (
	ID_ varchar NOT NULL,
	SOURCE_CONNECTOR_ID_ varchar,
	SOURCE_ARTIFACT_ID_ varchar,
	SOURCE_ELEMENT_ID_ varchar DEFAULT NULL,
	SOURCE_ELEMENT_NAME_ varchar DEFAULT NULL,
	SOURCE_REVISION_ bigint DEFAULT NULL,
	TARGET_CONNECTOR_ID_ varchar,
	TARGET_ARTIFACT_ID_ varchar,
	TARGET_ELEMENT_ID_ varchar DEFAULT NULL,
	TARGET_ELEMENT_NAME_ varchar DEFAULT NULL,
	TARGET_REVISION_ bigint DEFAULT NULL,
	LINK_TYPE_ varchar,
	COMMENT_ varchar,
	LINKED_BOTH_WAYS_ boolean,
	primary key(ID_)
);

create table ACT_CY_PEOPLE_LINK (
	ID_ varchar NOT NULL,
	SOURCE_CONNECTOR_ID_ varchar,
	SOURCE_ARTIFACT_ID_ varchar,
	SOURCE_REVISION_ bigint DEFAULT NULL,
	USER_ID_ varchar,
	GROUP_ID_ varchar,
	LINK_TYPE_ varchar,
	COMMENT_ varchar,
	primary key(ID_)
);

create table ACT_CY_TAG (
	ID_ varchar NOT NULL,
	NAME_ varchar NOT NULL,
	CONNECTOR_ID_ varchar NOT NULL,
	ARTIFACT_ID_ varchar NOT NULL,
	ALIAS_ varchar DEFAULT NULL,
	primary key(ID_)	
);

create table ACT_CY_COMMENT (
	ID_ varchar NOT NULL,
	CONNECTOR_ID_ varchar NOT NULL,
	NODE_ID_ varchar NOT NULL,
	ELEMENT_ID_ varchar DEFAULT NULL,
	CONTENT_ varchar NOT NULL,
	AUTHOR_ varchar,
	DATE_ timestamp NOT NULL,
	ANSWERED_COMMENT_ID_ varchar DEFAULT NULL,
	primary key(ID_)
);
 
create index ACT_CY_IDX_COMMENT on ACT_CY_COMMENT(ANSWERED_COMMENT_ID_);
alter table ACT_CY_COMMENT 
    add constraint FK_CY_COMMENT_COMMENT 
    foreign key (ANSWERED_COMMENT_ID_) 
    references ACT_CY_COMMENT;


insert into ACT_ID_GROUP values ('admin',       1, 'System administrator', 'security-role');
insert into ACT_ID_GROUP values ('user',        1, 'User', 'security-role');
insert into ACT_ID_GROUP values ('manager',     1, 'Manager', 'security-role');
insert into ACT_ID_GROUP values ('management',  1, 'Management',  'assignment');
insert into ACT_ID_GROUP values ('accountancy', 1, 'Accountancy', 'assignment');
insert into ACT_ID_GROUP values ('engineering', 1, 'Engineering', 'assignment');
insert into ACT_ID_GROUP values ('sales',       1, 'Sales', 'assignment');

insert into ACT_ID_USER values ('kermit', 1, 'Kermit', 'the Frog', 'kermit@localhost', 'kermit');
insert into ACT_ID_MEMBERSHIP values ('kermit', 'admin');
insert into ACT_ID_MEMBERSHIP values ('kermit', 'manager');
insert into ACT_ID_MEMBERSHIP values ('kermit', 'management');
insert into ACT_ID_MEMBERSHIP values ('kermit', 'accountancy');
insert into ACT_ID_MEMBERSHIP values ('kermit', 'engineering');
insert into ACT_ID_MEMBERSHIP values ('kermit', 'sales');

insert into ACT_ID_USER values ('fozzie', 1, 'Fozzie', 'Bear', 'fozzie@localhost', 'fozzie');
insert into ACT_ID_MEMBERSHIP values ('fozzie', 'user');
insert into ACT_ID_MEMBERSHIP values ('fozzie', 'accountancy');

insert into ACT_ID_USER values ('gonzo', 1, 'Gonzo', 'the Great', 'gonzo@localhost', 'gonzo');
insert into ACT_ID_MEMBERSHIP values ('gonzo', 'manager');
insert into ACT_ID_MEMBERSHIP values ('gonzo', 'management');
insert into ACT_ID_MEMBERSHIP values ('gonzo', 'accountancy');
insert into ACT_ID_MEMBERSHIP values ('gonzo', 'sales');

update ACT_GE_PROPERTY
set VALUE_ = '10'
where NAME_ = 'next.dbid';




delete from  ACT_CY_CONFIG;

insert into ACT_CY_CONFIG values ('kermit', '<org.activiti.cycle.impl.conf.ConfigurationContainer>
  <name>kermit</name>
  <linkedConnectors>
    <org.activiti.cycle.impl.connector.signavio.SignavioConnectorConfiguration>
      <id>Activiti</id>
      <name>Activiti Modeler</name>
      <signavioBaseUrl>http://localhost:8080/activiti-modeler/</signavioBaseUrl>
      <loginRequired>false</loginRequired>
      <credentialsSaved>true</credentialsSaved>
      <user></user>
      <password></password>
    </org.activiti.cycle.impl.connector.signavio.SignavioConnectorConfiguration>
    <org.activiti.cycle.impl.connector.fs.FileSystemConnectorConfiguration>
      <id>Workspace</id>
      <name>Eclipse Workspace (File System)</name>
      <baseFilePath>/home/mproch/apps/activiti/activiti-5.1/workspace/activiti-cycle-examples</baseFilePath>
    </org.activiti.cycle.impl.connector.fs.FileSystemConnectorConfiguration>
  </linkedConnectors>
  <parentContainers/>
</org.activiti.cycle.impl.conf.ConfigurationContainer>', 1);
insert into ACT_CY_CONFIG values ('fozzie', '<org.activiti.cycle.impl.conf.ConfigurationContainer>
  <name>fozzie</name>
  <linkedConnectors>
    <org.activiti.cycle.impl.connector.signavio.SignavioConnectorConfiguration>
      <id>Activiti</id>
      <name>Activiti Modeler</name>
      <signavioBaseUrl>http://localhost:8080/activiti-modeler/</signavioBaseUrl>
      <loginRequired>false</loginRequired>
      <credentialsSaved>true</credentialsSaved>
      <user></user>
      <password></password>
    </org.activiti.cycle.impl.connector.signavio.SignavioConnectorConfiguration>
    <org.activiti.cycle.impl.connector.fs.FileSystemConnectorConfiguration>
      <id>Workspace</id>
      <name>Eclipse Workspace (File System)</name>
      <baseFilePath>/home/mproch/apps/activiti/activiti-5.1/workspace/activiti-cycle-examples</baseFilePath>
    </org.activiti.cycle.impl.connector.fs.FileSystemConnectorConfiguration>
  </linkedConnectors>
  <parentContainers/>
</org.activiti.cycle.impl.conf.ConfigurationContainer>', 1);
insert into ACT_CY_CONFIG values ('gonzo', '<org.activiti.cycle.impl.conf.ConfigurationContainer>
  <name>gonzo</name>
  <linkedConnectors>
    <org.activiti.cycle.impl.connector.signavio.SignavioConnectorConfiguration>
      <id>Activiti</id>
      <name>Activiti Modeler</name>
      <signavioBaseUrl>http://localhost:8080/activiti-modeler/</signavioBaseUrl>
      <loginRequired>false</loginRequired>
      <credentialsSaved>true</credentialsSaved>
      <user></user>
      <password></password>
    </org.activiti.cycle.impl.connector.signavio.SignavioConnectorConfiguration>
    <org.activiti.cycle.impl.connector.fs.FileSystemConnectorConfiguration>
      <id>Workspace</id>
      <name>Eclipse Workspace (File System)</name>
      <baseFilePath>/home/mproch/apps/activiti/activiti-5.1/workspace/activiti-cycle-examples</baseFilePath>
    </org.activiti.cycle.impl.connector.fs.FileSystemConnectorConfiguration>
  </linkedConnectors>
  <parentContainers/>
</org.activiti.cycle.impl.conf.ConfigurationContainer>', 1);

