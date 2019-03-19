package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;

import dto.MemberDTO;
import service.ListService;
import service.MemberService;
import service.OptionService;

//http://localhost:8090/gogipam/main.do
//http://localhost:8090/gogipam/memagree.do // �������
//http://localhost:8090/gogipam/memjoin.do // ȸ������
//http://localhost:8090/gogipam/productlist.do // ��ǰ ����Ʈ
//http://localhost:8090/gogipam/productdetail.do // ��ǰ ��������
//http://localhost:8090/gogipam/order.do // ��ǰ ��������

@Controller
public class MainController {   
	private MemberService memberService;
	private ListService listService;
	private OptionService optionService;

	public MainController() { 
	} 
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	public void setListService(ListService listService) {
		this.listService = listService;
	}  
	
	public void setOptionService(OptionService optionService) {
		this.optionService = optionService;
	}
	
	//���ε� �ϴ� �̹��� ���� ����� ���ۿ� �Ẹ��
	private void makeThumbnail(String filePath, String fileName, String fileExt) throws Exception {
		// ����� �������Ϸκ��� BufferedImage ��ü�� �����մϴ�.
		BufferedImage srcImg = ImageIO.read(new File(filePath));
		// ������� �ʺ�� ���� �Դϴ�.
		int dw = 250, dh = 150;
		
		// ���� �̹����� �ʺ�� ���� �Դϴ�.
		int ow = srcImg.getWidth();
		int oh = srcImg.getHeight();
		// ���� �ʺ� �������� �Ͽ� ������� ������ ���̸� ����մϴ�.
		int nw = ow; 
		int nh = (ow * dh) / dw;
		
		// ���� ���̰� �������� ���ٸ� crop�� �ȵǹǷ�
		// ���� ���̸� �������� ������� ������ �ʺ� ����մϴ�.
		if(nh > oh) { nw = (oh * dw) / dh; nh = oh; }
		
		// ���� ũ��� �����̹����� ������� crop �մϴ�.
		BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh);
		
		// crop�� �̹����� ������� �����մϴ�.
		BufferedImage destImg = Scalr.resize(cropImg, dw, dh);
		
		// ������� �����մϴ�. �̹��� �̸� �տ� "THUMB_" �� �ٿ� ǥ���߽��ϴ�.
		String thumbName = "/images/list" + "THUMB_" + fileName;
		File thumbFile = new File(thumbName);
		ImageIO.write(destImg, fileExt.toUpperCase(), thumbFile);
	}
	
	@RequestMapping("/main.do")
	public String main() {
		return "main";
	} // ���� ������
	
	@RequestMapping("/introduce.do")
	public String introduce() {
		return "introduce";
	} // ���� ������
	
	@RequestMapping(value="/memagree.do", method=RequestMethod.GET)
	public String memagree() {
		return "memagree";		
	} // ȸ������ ������� ������ �̵�
	
	@RequestMapping(value="/memagree.do", method=RequestMethod.POST)
	public String memagreein() {
		return "redirect:/memjoin.do";		
	} // ȸ������ ó��
	
	@RequestMapping(value="/memjoin.do", method=RequestMethod.GET)
	public String memjoin() {
		return "memjoin";		
	} // ȸ������ ������ �̵�
	
	@RequestMapping(value="/memjoin.do", method=RequestMethod.POST)
	public String memjoinup(MemberDTO mdto) {
		memberService.insertProcess(mdto);
		return "redirect:/main.do";		
	} // ȸ������ ó��
	
	@RequestMapping(value="/dupidchk.do", method=RequestMethod.POST)
	@ResponseBody
	public String dupidchk(String member_id) {
		System.out.println(member_id);
		MemberDTO dupIdChk = memberService.dupIdChkProcess(member_id);
		System.out.println(dupIdChk);		
		String res = "f";
		
		if(dupIdChk != null)
			res = "t";
		
		System.out.println(res);
		return res;
	} // ���̵� �ߺ�üũ �ϱ�
	
	@RequestMapping(value="/duptelchk.do", method=RequestMethod.POST)
	@ResponseBody
	public String duptelchk(String member_tel) {
		System.out.println(member_tel);
		MemberDTO dupTelChk = memberService.dupTelChkProcess(member_tel);
		System.out.println(dupTelChk);		
		String res = "f";
		
		if(dupTelChk != null)
			res = "t";
		
		System.out.println(res);
		return res;
	} // ����ó �ߺ�üũ �ϱ�
	
	@RequestMapping("/productlist.do")
	public String productlist(Model model, HttpServletRequest request) {
		String list_category = (String) request.getParameter("target");
		
		if(list_category == null)
			list_category = ""; // �׳� �׺���̼� �ٿ��� ���ý� �Ķ���Ͱ� ����. �ٵ� null�� �ְԵǸ� nullpointer ���� �߻��ϹǷ� null ��� "" ����
		
		if(!list_category.equals("all")) {
			if(list_category.equals(""))
				model.addAttribute("plist", listService.listAllProcess());
			else
				model.addAttribute("plist", listService.listGroupProcess(list_category));
		} else
			model.addAttribute("plist", listService.listAllProcess());			
		return "productlist";		
	} // ��ǰ ����Ʈ	(�̹��� 379 * 479)
	
	@RequestMapping("/productdetail.do")
	public String detail(Model model, HttpServletRequest request) {
		String namekey = (String) request.getParameter("target");
		model.addAttribute("plist", listService.listContentProcess(namekey));
		model.addAttribute("popt", optionService.loadOptionProcess(namekey));
		
		return "productdetail";
	} // �� ������
	
	@RequestMapping("/order.do")
	public String order() {
		return "order";
	} // ���� ������
}
