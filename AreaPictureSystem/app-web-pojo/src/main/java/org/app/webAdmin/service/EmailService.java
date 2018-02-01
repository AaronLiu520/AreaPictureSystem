package org.app.webAdmin.service;

import java.io.UnsupportedEncodingException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.app.webAdmin.pojo.Contest;
import org.app.webAdmin.pojo.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;

/**
 * 
 * @ClassName: EmailService
 * @Description: TODO(邮件)
 * @author fliay
 * @date 2018年1月17日 下午2:13:41
 *
 */
@Repository
public class EmailService extends GeneralServiceImpl<Email> {

	
	@Autowired
	private JavaMailSender mailSender;// 注入Spring封装的javamail，Spring的xml中已让框架装配
	
	@Autowired
	private TaskExecutor taskExecutor;// 注入Spring封装的异步执行器
	
	public void sendMail(Email email) throws MessagingException{
		sendMailByAsynchronousMode(email);
		
	}
	
	
	public void  sendMailByAsynchronousMode(final Email email){
		
		
		taskExecutor.execute(new Runnable() {
			
			public void run() {
				
				try {
					sendMailBySynchronizationMode(email);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		});
	}
	
	
	public void sendMailBySynchronizationMode(Email email) throws MessagingException{
		
		MimeMessage mime = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mime, true, "utf-8");  
	
		 //设置自定义发件人昵称    
        String nick="";    
        try {    
            nick=javax.mail.internet.MimeUtility.encodeText(email.getNick());    
        } catch (UnsupportedEncodingException e) {    
            e.printStackTrace();    
        }  

		
	
		
		helper.setFrom(nick); //发件人
		helper.setTo(email.getToAddress());		//收件人
		helper.setReplyTo(email.getFromAddress());//回复到
		helper.setSubject(email.getSubject());	//邮件主题
		helper.setText(email.getContent(),true);// true表示设定html格式  
		mailSender.send(mime);
	}
	
	
	
	

}
