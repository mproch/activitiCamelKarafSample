package pl.touk.wjug.activiti.blueprint;

import org.activiti.engine.impl.cfg.JtaProcessEngineConfiguration;

import javax.sql.DataSource;
import javax.transaction.TransactionManager;

public class ConfigurationFactory {

    DataSource dataSource;

    TransactionManager transactionManager;


    public JtaProcessEngineConfiguration getConfiguration() {
        JtaProcessEngineConfiguration conf =
                new JtaProcessEngineConfiguration();
        conf.setDataSource(dataSource);
        conf.setDatabaseSchemaUpdate("true");
        conf.setTransactionManager(transactionManager);
        conf.setJobExecutorActivate(true);
        return conf;
    }

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void setTransactionManager(TransactionManager transactionManager) {
        this.transactionManager = transactionManager;
    }
}
