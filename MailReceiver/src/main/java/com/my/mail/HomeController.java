package com.my.mail;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage.RecipientType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	private static List<MailInfo> mailList = new ArrayList<MailInfo>();
	
	@RequestMapping("/")
	public String home() {
		
		return "home";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView mailList(@RequestParam("userId") String userId,@RequestParam("userPwd") String userPwd)  {
		
		ModelAndView modelAndView = getMail(userId, userPwd);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/mailDetail", method=RequestMethod.POST)
	public ModelAndView mailDetail(@RequestParam("count") int count) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/mailDetail");
		modelAndView.addObject("mail", mailList.get(count));
		
		return modelAndView;
		
	}
	
	public ModelAndView getMail(String userId, String userPwd) {
		
		Properties properties = new Properties();
		properties.put("mail.store.protocol", "pop3");
		properties.put("mail.pop3.ssl.enable", "true");
		Session session = Session.getDefaultInstance(properties, null);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/mailList");
		
		try {
			
			Store store = session.getStore("pop3");
			store.connect("pop.gmail.com", userId, userPwd);
			
			Folder folder = store.getFolder("INBOX");
			folder.open(Folder.READ_ONLY);
			
			Message messages[] = folder.getMessages();
			
			for(Message mail : messages) {
				MailInfo mailInfo = new MailInfo();
				DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.LONG);
				String sentDate = dateFormat.format(mail.getSentDate());
				String content="";
				
				if(mail.getContent().toString().contains("Multipart")) {
					Multipart mp = (Multipart)mail.getContent();
					for(int i=0; i<mp.getCount();i++) {
						MimeBodyPart bp = (MimeBodyPart) mp.getBodyPart(i);
						if(bp.getContentType().contains("text/html")) {
							content = bp.getContent().toString();
						}
					}
				}else
					mail.getContent().toString();
				
				mailInfo.setFrom(InternetAddress.toUnicodeString(mail.getFrom()));
				mailInfo.setRecipient(userId);
				mailInfo.setContent(content);
				mailInfo.setSubject(mail.getSubject());
				mailInfo.setSentDate(sentDate);
				mailInfo.setSize(mail.getSize());
				
				mailList.add(mailInfo);
			}
			modelAndView.addObject("mailList", mailList);
			
			folder.close();
			store.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.setViewName("/errorPage");
		}
		return modelAndView;
	}
	
}
