package org.app.admin.util.executor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;

public class Rejected implements RejectedExecutionHandler {
    private static final Logger log = LoggerFactory
            .getLogger(Rejected.class);

    //拒绝
    public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
        //写日志记录
        log.error("当前被拒绝任务为：" + r.toString());
    }
}
