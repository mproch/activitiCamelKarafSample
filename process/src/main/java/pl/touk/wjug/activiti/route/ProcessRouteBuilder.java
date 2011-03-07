package pl.touk.wjug.activiti.route;

import org.apache.camel.Body;
import org.apache.camel.Properties;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.language.XPath;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;


public class ProcessRouteBuilder extends RouteBuilder {

    @Override
    public void configure() throws Exception {

        from("activiti:camelProcess:serviceTask").setBody().property("var1").
                to("mock:service1", "file:///tmp/activiti/serviceTask");

        from( "file:///tmp/activiti/startProcess")
                .setProperty("PROCESS_KEY_PROPERTY").xpath("//@key")
                .bean(ConvertToMap.class)
                .to("activiti:camelProcess");

         from( "file:///tmp/activiti/receive")
                 .convertBodyTo(String.class)
                 .setProperty("PROCESS_KEY_PROPERTY").xpath("//@key")
                 .to("activiti:camelProcess:receive");

    }

    public static class ConvertToMap {
        public Map<String, Object> map(@XPath("//@var1") String value) {
            HashMap<String, Object> o = new HashMap<String, Object>();
            o.put("var1", value);
            return o;
        }
    }


}