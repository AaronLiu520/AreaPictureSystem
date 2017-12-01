package org.app.admin.util.executor;

import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;

public class Rejected implements RejectedExecutionHandler {


    //拒绝业务
    public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {

        //写日志记录
        System.out.println("自定义处理..");
        System.out.println("当前被拒绝任务为：" + r.toString());
    }
}
