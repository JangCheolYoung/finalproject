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
//http://localhost:8090/gogipam/memagree.do // 약관동의
//http://localhost:8090/gogipam/memjoin.do // 회원가입
//http://localhost:8090/gogipam/productlist.do // 상품 리스트
//http://localhost:8090/gogipam/productdetail.do // 상품 상세페이지
//http://localhost:8090/gogipam/order.do // 상품 상세페이지

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
	
	//업로드 하는 이미지 파일 썸네일 제작에 써보자
	private void makeThumbnail(String filePath, String fileName, String fileExt) throws Exception {
		// 저장된 원본파일로부터 BufferedImage 객체를 생성합니다.
		BufferedImage srcImg = ImageIO.read(new File(filePath));
		// 썸네일의 너비와 높이 입니다.
		int dw = 250, dh = 150;
		
		// 원본 이미지의 너비와 높이 입니다.
		int ow = srcImg.getWidth();
		int oh = srcImg.getHeight();
		// 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다.
		int nw = ow; 
		int nh = (ow * dh) / dw;
		
		// 계산된 높이가 원본보다 높다면 crop이 안되므로
		// 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다.
		if(nh > oh) { nw = (oh * dw) / dh; nh = oh; }
		
		// 계산된 크기로 원본이미지를 가운데에서 crop 합니다.
		BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh);
		
		// crop된 이미지로 썸네일을 생성합니다.
		BufferedImage destImg = Scalr.resize(cropImg, dw, dh);
		
		// 썸네일을 저장합니다. 이미지 이름 앞에 "THUMB_" 를 붙여 표시했습니다.
		String thumbName = "/images/list" + "THUMB_" + fileName;
		File thumbFile = new File(thumbName);
		ImageIO.write(destImg, fileExt.toUpperCase(), thumbFile);
	}
	
	@RequestMapping("/main.do")
	public String main() {
		return "main";
	} // 메인 페이지
	
	@RequestMapping("/introduce.do")
	public String introduce() {
		return "introduce";
	} // 메인 페이지
	
	@RequestMapping(value="/memagree.do", method=RequestMethod.GET)
	public String memagree() {
		return "memagree";		
	} // 회원가입 약관동의 페이지 이동
	
	@RequestMapping(value="/memagree.do", method=RequestMethod.POST)
	public String memagreein() {
		return "redirect:/memjoin.do";		
	} // 회원가입 처리
	
	@RequestMapping(value="/memjoin.do", method=RequestMethod.GET)
	public String memjoin() {
		return "memjoin";		
	} // 회원가입 페이지 이동
	
	@RequestMapping(value="/memjoin.do", method=RequestMethod.POST)
	public String memjoinup(MemberDTO mdto) {
		memberService.insertProcess(mdto);
		return "redirect:/main.do";		
	} // 회원가입 처리
	
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
	} // 아이디 중복체크 하기
	
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
	} // 연락처 중복체크 하기
	
	@RequestMapping("/productlist.do")
	public String productlist(Model model, HttpServletRequest request) {
		String list_category = (String) request.getParameter("target");
		
		if(list_category == null)
			list_category = ""; // 그냥 네비게이션 바에서 선택시 파라미터가 없다. 근데 null을 넣게되면 nullpointer 오류 발생하므로 null 대신 "" 대입
		
		if(!list_category.equals("all")) {
			if(list_category.equals(""))
				model.addAttribute("plist", listService.listAllProcess());
			else
				model.addAttribute("plist", listService.listGroupProcess(list_category));
		} else
			model.addAttribute("plist", listService.listAllProcess());			
		return "productlist";		
	} // 상품 리스트	(이미지 379 * 479)
	
	@RequestMapping("/productdetail.do")
	public String detail(Model model, HttpServletRequest request) {
		String namekey = (String) request.getParameter("target");
		model.addAttribute("plist", listService.listContentProcess(namekey));
		model.addAttribute("popt", optionService.loadOptionProcess(namekey));
		
		return "productdetail";
	} // 상세 페이지
	
	@RequestMapping("/order.do")
	public String order() {
		return "order";
	} // 메인 페이지
}
