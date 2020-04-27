package daily.admin.bi.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.bi.dao.AdminBiDao;
import daily.admin.bi.vo.AdminBiVO;

@Service
public class AdminBiServiceImpl implements AdminBiService{

	@Autowired
	AdminBiDao biDao;
	
	
	@Override
	public ModelAndView list() throws ParseException {
	
		ModelAndView mav=new ModelAndView();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd"); //날짜 형식
		Calendar c = Calendar.getInstance(); //오늘날짜
		String [] date = new String[7]; 
		
		date[0]=sdf.format(c.getTime()); //오늘날짜
		  for(int i=1; i<7;i++) {
			  c.add(Calendar.DATE, 1);
			date[i]=sdf.format(c.getTime());
			
		  }
		  System.out.println(sdf.parse(date[1]));
		  
		  
		  mav.addObject("curDate", date);
		  
		return mav;
	}

}
