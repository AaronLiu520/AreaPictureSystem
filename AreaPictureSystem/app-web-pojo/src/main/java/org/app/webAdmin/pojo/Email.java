package org.app.webAdmin.pojo;
public class Email {  
  
    /** 发件人 **/  
    private String fromAddress; 
    
    /**发件人昵称**/
    private String nick;
      
    /** 收件人 **/  
    private String toAddress;  
  
    /** 邮件主题 **/  
    private String subject;  
  
    /** 邮件内容 **/  
    private String content;  
  
      
      
    public String getFromAddress() {  
        return fromAddress;  
    }  
  
    public void setFromAddress(String fromAddress) {  
        this.fromAddress = fromAddress;  
    }  
  
    public String getToAddress() {  
        return toAddress;  
    }  
  
    public void setToAddress(String toAddress) {  
        this.toAddress = toAddress;  
    }  
  
    public String getSubject() {  
        return subject;  
    }  
  
    public void setSubject(String subject) {  
        this.subject = subject;  
    }  
  
    public String getContent() {  
        return content;  
    }  
  
    public void setContent(String content) {  
        this.content = content;  
    }

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	@Override
	public String toString() {
		return "Email [fromAddress=" + fromAddress + ", nick=" + nick + ", toAddress=" + toAddress + ", subject="
				+ subject + ", content=" + content + "]";
	}

	
    
}  