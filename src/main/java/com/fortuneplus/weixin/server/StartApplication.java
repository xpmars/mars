package com.fortuneplus.weixin.server;


import org.mortbay.jetty.Connector;
import org.mortbay.jetty.Server;
import org.mortbay.jetty.nio.SelectChannelConnector;
import org.mortbay.jetty.webapp.WebAppContext;

import java.io.IOException;

/**
 * Created by xiaopang on 2015/9/20.
 */
class JettyServer {
    int port = 80; // 端口号
    String webContext = "/weixin"; // 上下文路径
    String resourceBase = "./src/main/webapp/"; // web工程目录

    public JettyServer(String configFile) throws IOException {
        if (configFile == null) {
        }
    }

    public void startServer() {

        try {
            Server server = new Server();
            Connector connector = new SelectChannelConnector();
            connector.setPort(port);
            server.setConnectors(new Connector[] { connector });
            WebAppContext webapp = new WebAppContext();
            webapp.setContextPath(webContext);
            webapp.setDescriptor(resourceBase + "/WEB-INF/web.xml");
            webapp.setResourceBase(resourceBase);
            server.setHandler(webapp);
            server.start();
            server.join();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) throws Exception {
        JettyServer server = new JettyServer(null);
        server.startServer();
    }

}

//public class StartApplication {
//    public static void main(String[] args) throws Exception {
//        JettyServer server = new JettyServer(null);
//        server.startServer();
//    }
//}