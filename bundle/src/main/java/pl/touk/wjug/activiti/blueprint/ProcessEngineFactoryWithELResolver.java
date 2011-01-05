package pl.touk.wjug.activiti.blueprint;

import org.activiti.engine.delegate.VariableScope;
import org.activiti.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.activiti.engine.impl.el.ExpressionManager;
import org.activiti.engine.impl.el.VariableScopeElResolver;
import org.activiti.engine.impl.javax.el.*;
import org.activiti.osgi.blueprint.ProcessEngineFactory;
import org.osgi.service.blueprint.container.BlueprintContainer;


public class ProcessEngineFactoryWithELResolver extends ProcessEngineFactory {

    private BlueprintContainer blueprintContainer;

    public void setBlueprintContainer(BlueprintContainer blueprintContainer) {
        this.blueprintContainer = blueprintContainer;
    }

    @Override
    public void init() throws Exception {
        ((ProcessEngineConfigurationImpl) getProcessEngineConfiguration()).setExpressionManager(new BlueprintExpressionManager());
        super.init();
    }

    public class BlueprintExpressionManager extends ExpressionManager {
        @Override
        protected ELResolver createElResolver(VariableScope variableScope) {
            CompositeELResolver compositeElResolver = new CompositeELResolver();
            compositeElResolver.add(new VariableScopeElResolver(variableScope));
            compositeElResolver.add(new BlueprintELResolver(blueprintContainer));
            compositeElResolver.add(new ArrayELResolver());
            compositeElResolver.add(new ListELResolver());
            compositeElResolver.add(new MapELResolver());
            compositeElResolver.add(new BeanELResolver());
            return compositeElResolver;
        }

    }
}
