package home;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class Music {
	
	@RequestMapping("/")
	public ModelAndView goMain(ModelAndView mv, RedirectView rv) {
		rv.setUrl("/bfMain.mr");
		mv.setView(rv);
		return mv;
	}
}
