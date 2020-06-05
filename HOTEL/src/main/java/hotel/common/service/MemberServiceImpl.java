package hotel.common.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import hotel.common.dao.MemberDAO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService{
	Logger log = Logger.getLogger(this.getClass());


	@Resource(name="MemberDAO")
	private MemberDAO memberDAO;
	
	// org.springframework.mail.javamail.JavaMailSender
    private JavaMailSender javaMailSender;
 
    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    } 
	

	@Override
	public String selectMyLogin(Map<String, Object> map, String id) throws Exception {
		
		return (String) memberDAO.selectMyLogin(map, id);
	}

	
	@Override
	public Map<String, Object> selectMemInfo(String id) throws Exception {
		Map<String,Object> resultMap = memberDAO.selectMemInfo(id);
		return resultMap;
	}

	
	@Override
	public void updateMember(Map<String, Object> map) throws Exception {
		memberDAO.updateMember(map);
	}

	
	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		memberDAO.deleteMember(map);
	}


	@Override
	public boolean send(String subject, String text, String from, String to, String filePath) {
		// javax.mail.internet.MimeMessage
        MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            // org.springframework.mail.javamail.MimeMessageHelper
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            helper.setText(text, true);
            helper.setFrom(from);
            helper.setTo(to);
 
          
            if (filePath != null) {
                File file = new File(filePath);
                if (file.exists()) {
                    helper.addAttachment(file.getName(), new File(filePath));
                }
            }
 
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
	}

	

	/*
	 * @Override public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
	 *  sampleDAO.updateHitCnt(map); 
	 *  Map<String, Object> resultMap = sampleDAO.selectBoardDetail(map); 
	 *  
	 *  return resultMap; 
	 *  }
	 * 
	 * @Override public void updateBoard(Map<String, Object> map) throws Exception{
	 * sampleDAO.updateBoard(map); }
	 * 
	 * @Override public void deleteBoard(Map<String, Object> map) throws Exception {
	 * sampleDAO.deleteBoard(map); }
	 */

}
