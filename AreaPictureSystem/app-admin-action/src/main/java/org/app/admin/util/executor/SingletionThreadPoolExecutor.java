package org.app.admin.util.executor;


import org.app.admin.util.Configure;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * Resource Process;
 * @author Aaron Lau
 */
public class SingletionThreadPoolExecutor {

    private ExecutorService pool;


    private SingletionThreadPoolExecutor() {
        Configure ec= Configure.getInstance();
        pool=new ThreadPoolExecutor(ec.getValueInt("corePoolSize"),ec.getValueInt("maximumPoolSize"),
                ec.getValueInt("keepAliveTime"),
                TimeUnit.SECONDS,
                new LinkedBlockingQueue<Runnable>(),
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
