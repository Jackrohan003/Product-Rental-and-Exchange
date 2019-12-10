package com.chat.model;

public class Chat {
	
	private int chatid;
	private String fromemail;
	private String toemail;
	private String msg;
	private String fromname;
	private String toname;
	
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public String getFromname() {
		return fromname;
	}
	public void setFromname(String fromname) {
		this.fromname = fromname;
	}
	public String getToname() {
		return toname;
	}
	public void setToname(String toname) {
		this.toname = toname;
	}
	public String getFromemail() {
		return fromemail;
	}
	public void setFromemail(String fromemail) {
		this.fromemail = fromemail;
	}
	public String getToemail() {
		return toemail;
	}
	public void setToemail(String toemail) {
		this.toemail = toemail;
	}
	public int getChatid() {
		return chatid;
	}
	public void setChatid(int chatid) {
		this.chatid = chatid;
	}
	
	

}
