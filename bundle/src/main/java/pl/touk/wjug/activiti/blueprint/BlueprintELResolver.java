package pl.touk.wjug.activiti.blueprint;

import org.activiti.engine.impl.javax.el.ELContext;
import org.activiti.engine.impl.javax.el.ELResolver;
import org.osgi.service.blueprint.container.BlueprintContainer;

import java.beans.FeatureDescriptor;
import java.util.Iterator;

/**
 * @see org.activiti.spring.ApplicationContextElResolver
 */
public class BlueprintELResolver extends ELResolver {

    private BlueprintContainer blueprintContainer;

    public BlueprintELResolver(BlueprintContainer blueprintContainer) {
        this.blueprintContainer = blueprintContainer;
    }

    public Object getValue(ELContext context, Object base, Object property) {
        if (base == null) {
            // according to javadoc, can only be a String
            String key = (String) property;
            for (String componentId : blueprintContainer.getComponentIds()) {
                if (componentId.equals(key)) {
                    context.setPropertyResolved(true);
                    return blueprintContainer.getComponentInstance(key);
                }
            }
        }

        return null;
    }

    public boolean isReadOnly(ELContext context, Object base, Object property) {
        return true;
    }

    public void setValue(ELContext context, Object base, Object property, Object value) {
    }

    public Class<?> getCommonPropertyType(ELContext context, Object arg) {
        return Object.class;
    }

    public Iterator<FeatureDescriptor> getFeatureDescriptors(ELContext context, Object arg) {
        return null;
    }

    public Class<?> getType(ELContext context, Object arg1, Object arg2) {
        return Object.class;
    }
}
