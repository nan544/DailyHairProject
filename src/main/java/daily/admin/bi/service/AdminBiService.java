package daily.admin.bi.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import daily.admin.bi.vo.AdminBiVO;

public interface AdminBiService {
	public ModelAndView list() throws ParseException;
	
}
