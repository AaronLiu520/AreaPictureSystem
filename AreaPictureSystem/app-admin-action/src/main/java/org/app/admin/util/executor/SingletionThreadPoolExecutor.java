package org.app.admin.util.executor;



import org.app.admin.util.Configure;

import java.util.concurrent.*;

/**
 * Resource Process;
 * @author Aaron Lau
 */
public class SingletionThreadPoolExecutor {

    private ExecutorService pool;


    private SingletionThreadPoolExecutor() {
        Configure ec= Configure.getInstance();
        pool=new ThreadPoolExecutor(
                Integer.parseInt(ec.getConfig().getProperty("corePoolSize")),
                Integer.parseInt(ec.getConfig().getProperty("maximumPoolSize")) ,
                Integer.parseInt(ec.getConfig().getProperty("keepAliveTime")),
                TimeUnit.SECONDS,
                new LinkedBlockingQueue<Runnable>(Integer.parseInt(ec.getConfig().getProperty("queue"))),
                new Rejected());
    }

    private static class InnerSingletion {
        private static SingletionThreadPoolExecutor single = new SingletionThreadPoolExecutor();
    }

    public static SingletionThreadPoolExecutor getInstance(){
        return InnerSingletion.single;
    }


    public ExecutorService getPool() {
        return pool;
    }

}
