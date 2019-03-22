package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.AddressDTO;
import dto.CartDTO;
import dto.FaqDTO;
import dto.MemberDTO;
import dto.QnaDTO;
import dto.QnaPageDTO;
import email.SendEmail;
import email.Util;
import service.AddressService;
import service.CartService;
import service.FaqService;
import service.ListService;
import service.MemberService;
import service.OptionService;
import service.QnaService;

//http://localhost:8090/gogipam/main.do

//http://localhost:8090/gogipam/memagree.do
//http://localhost:8090/gogipam/memjoin.do
//http://localhost:8090/gogipam/productlist.do
//http://localhost:8090/gogipam/productdetail.do
//http://localhost:8090/gogipam/order.do

//http://localhost:8090/gogipam/login.do
//http://localhost:8090/gogipam/logout.do
//http://localhost:8090/gogipam/faqPage.do
//http://localhost:8090/gogipam/cart.do
//http://localhost:8090/gogipam/qnaPage.do
//http://localhost:8090/gogipam/identify.do


@Controller
public class MainController {
	private MemberService memberService;
	private ListService listService;
	private OptionService optionService;
	private AddressService addressService;
	private FaqService faqService;
	private CartService cartService;
	private QnaService qnaService;

	///////////////////////////////////////////////// Service 선언
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

	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}

	public void setFaqService(FaqService faqService) {
		this.faqService = faqService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	
	public void setQnaService(QnaService qnaService) {
		this.qnaService = qnaService;
	}
	///////////////////////////////////////////////////// setService 선언

	@RequestMapping("/main.do")
	public String main() {
		return "main";
	}
	///////////////////////////////////////////////////// 메인페이지 접근 매핑

	@RequestMapping("/introduce.do")
	public String introduce() {
		return "introduce";
	}
	////////////////////////////////////////////////////// 소개페이지 접근 매핑

	@RequestMapping(value = "/faqPage.do")
	public ModelAndView faqPage() {
		ModelAndView mav = new ModelAndView();
		String faq_category = "상품관련";

		mav.addObject("list", faqService.listProcess(faq_category));
		mav.setViewName("faq");
		return mav;

	}// end faqPage()///////////

	@RequestMapping(value = "/faqPage2.do", method = RequestMethod.GET)
	public @ResponseBody List<FaqDTO> faqPage2(@RequestParam String faq_category) {
		return faqService.listProcess(faq_category);
	}
	/////////////////////////////////////////////////////// FAQ 페이지 접근 매핑
	
	private String path;

	public void setPath(String path) {
		this.path = path;
	}
	
	QnaPageDTO pdto;
	
	// 페이지 실행.
	// mav로 해당 member_id가 지니는 데이터를 가져와 뿌려준다.
	@RequestMapping("/qnaPage.do")
	public @ResponseBody ModelAndView qnaPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<QnaDTO> list = null;
		// 세션에저장되어 있는 값을 가져온다. (member_id)
		String member_id = (String) session.getAttribute("member_id");

		// 총 레코드 수를 가져온다.
		int totalRecord = qnaService.countPro(member_id);
		int currentPage = 1;
		pdto = new QnaPageDTO(currentPage, totalRecord);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pdto", pdto);
		map.put("member_id", member_id);

		// System.out.println(map.get("member_id"));
		list = qnaService.listQuestionPro(map);

		// for (int i = 0; i < list.size(); i++) {
		// System.out.println(list.get(i).getQuestion_title());
		// }

		mav.addObject("list", list);
		mav.addObject("pdto", pdto);
		mav.setViewName("qna");

		return mav;
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 문의 내용을 삽입하는 메소드...
	@RequestMapping(value = "/insertQuestion.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> questionPro(QnaDTO dto, QnaPageDTO pdto, HttpSession session) {
		System.out.println(dto.getFilename());
		MultipartFile file = dto.getFilename();
		System.out.println("file:" + file);
		if (file != null) {
			String fileName = file.getOriginalFilename();
			// 중복파일명을 처리하기 위해 난수 발생.
			UUID random = UUID.randomUUID();
			// String root = request.getSession().getServletContext().getRealPath("/");
			// root+"temp/"
			// String saveDirectory = root + "temp" + File.separator;
			String saveDirectory = path;
			File fe = new File(saveDirectory);
			// 폴더가 있는지 확인하고~
			if (!fe.exists()) {
				fe.mkdir();
			}
			// 파일을 저장할 경로와 파일명 생성
			File ff = new File(saveDirectory, random + "_" + fileName);
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dto.setUpload(random + "_" + fileName);
		}

		String member_id = (String) session.getAttribute("member_id");
		dto.setMember_id(member_id);

		if (dto.getQuestion_file() == null) {
			dto.setQuestion_file("null");
		}

		qnaService.insertQuestionPro(dto);

		// 총 레코드 수를 가져온다.
		int totalRecord = qnaService.countPro(member_id);
		if (pdto.getCurrentPage() == 0) {
			pdto.setCurrentPage(1);
		}
		QnaPageDTO sendPdto = new QnaPageDTO(pdto.getCurrentPage(), totalRecord);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pdto", sendPdto);
		map.put("member_id", member_id);
		List<QnaDTO> list = qnaService.listQuestionPro(map);

		System.out.println("totalPage:" + sendPdto.getTotalPage());

		Map<String, Object> sendMap = new HashMap<String, Object>();
		sendMap.put("list", list);
		sendMap.put("pdto", sendPdto);

		return sendMap;
	}
	// // 문의 내용을 삽입하는 메소드...
	// @RequestMapping(value = "/insertQuestion.do", method = RequestMethod.POST)
	// public @ResponseBody Map<String, Object> questionPro(QnaDTO dto, QnaPageDTO
	// pdto, HttpSession session) {
	// String member_id = (String) session.getAttribute("member_id");
	// dto.setMember_id(member_id);
	//
	// if (dto.getQuestion_file() == null) {
	// dto.setQuestion_file("null");
	// }
	//
	// qnaService.insertQuestionPro(dto);
	//
	// // 총 레코드 수를 가져온다.
	// int totalRecord = qnaService.countPro(member_id);
	// if (pdto.getCurrentPage() == 0) {
	// pdto.setCurrentPage(1);
	// }
	// QnaPageDTO sendPdto = new QnaPageDTO(pdto.getCurrentPage(), totalRecord);
	//
	// Map<String, Object> map = new HashMap<String, Object>();
	// map.put("pdto", sendPdto);
	// map.put("member_id", member_id);
	// List<QnaDTO> list = qnaService.listQuestionPro(map);
	//
	// System.out.println("totalPage:" + sendPdto.getTotalPage());
	//
	// Map<String, Object> sendMap = new HashMap<String, Object>();
	// sendMap.put("list", list);
	// sendMap.put("pdto", sendPdto);
	//
	//
	//
	// return sendMap;
	// }

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value = "/changeQuestion.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> changeQuestion(QnaPageDTO pdto, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");

		QnaDTO dto = new QnaDTO();
		dto.setMember_id(member_id);

		if (dto.getQuestion_file() == null) {
			dto.setQuestion_file("null");
		}

		// 총 레코드 수를 가져온다.
		int totalRecord = qnaService.countPro(member_id);
		if (pdto.getCurrentPage() == 0) {
			pdto.setCurrentPage(1);
		}
		QnaPageDTO sendPdto = new QnaPageDTO(pdto.getCurrentPage(), totalRecord);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pdto", sendPdto);
		map.put("member_id", member_id);
		List<QnaDTO> list = qnaService.listQuestionPro(map);

		// System.out.println("totalPage:"+sendPdto.getTotalPage());

		Map<String, Object> sendMap = new HashMap<String, Object>();
		sendMap.put("list", list);
		sendMap.put("pdto", sendPdto);

		return sendMap;
	}
	///////////////////////////////////////////////////////////////////////////// QnA
	///////////////////////////////////////////////////////////////////////////// 관련
	///////////////////////////////////////////////////////////////////////////// 매핑

	@RequestMapping(value = "/memagree.do", method = RequestMethod.GET)
	public String memagree() {
		return "memagree";
	}

	@RequestMapping(value = "/memagree.do", method = RequestMethod.POST)
	public String memagreein() {
		return "redirect:/memjoin.do";
	}

	@RequestMapping(value = "/memjoin.do", method = RequestMethod.GET)
	public String memjoin() {
		return "memjoin";
	}

	@RequestMapping(value = "/memjoin.do", method = RequestMethod.POST)
	public String memjoinup(MemberDTO mdto) {
		memberService.insertProcess(mdto);
		return "redirect:/main.do";
	}

	@RequestMapping(value = "/dupidchk.do", method = RequestMethod.POST)
	@ResponseBody
	public String dupidchk(String member_id) {
		// System.out.println(member_id);
		MemberDTO dupIdChk = memberService.dupIdChkProcess(member_id);
		// System.out.println(dupIdChk);
		String res = "f";

		if (dupIdChk != null)
			res = "t";

		System.out.println(res);
		return res;
	}

	@RequestMapping(value = "/duptelchk.do", method = RequestMethod.POST)
	@ResponseBody
	public String duptelchk(String member_tel) {
		// System.out.println(member_tel);
		MemberDTO dupTelChk = memberService.dupTelChkProcess(member_tel);
		// System.out.println(dupTelChk);
		String res = "f";

		if (dupTelChk != null)
			res = "t";

		System.out.println(res);
		return res;
	}

	@RequestMapping("/login.do")
	public String loginform() {
		return "login";
	}

	// 회원 정보가 있는지 확인.
	@RequestMapping("/memCheck.do")
	public @ResponseBody String memCheck(String member_id, String member_pwd) {
		MemberDTO dto = new MemberDTO();
		dto.setMember_id(member_id);
		dto.setMember_pwd(member_pwd);

		if (memberService.loginProcess(dto) == 1) {

			return "success";
		} else {

			return "fail";
		}
	}

	// 입력한 아이디와 비번으로 회원정보 테이블에서 찾아서 결과값을 리턴.
	@RequestMapping("/logPro.do")
	public String loginPro(String returnUrl, MemberDTO dto, HttpSession session) {
		// System.out.println(member_id);
		// System.out.println(member_pwd);

		// MemDTO dto = new MemDTO();
		// dto.setMember_id(member_id);
		// dto.setMember_pwd(member_pwd);

		if (memberService.loginProcess(dto) == 1) {
			// System.out.println("기존 session 값 : " + session.getAttribute("member_id"));
			session.setAttribute("member_id", dto.getMember_id());
			// System.out.println("로그인 된 session 값 : " + session.getAttribute("member_id"));

			// 로그인 세션은 30분뒤 자동으로 해제됨.
			session.setMaxInactiveInterval(24 * 60 * 60);
			// System.out.println("로그인 성공!!");
			System.out.println("returnUrl : " + returnUrl);
			if (returnUrl != "") {
				return "redirect:/" + returnUrl;
			}
		}
		return "redirect:/main.do";

	}// end loginPro()/////////////////////////////////

	@RequestMapping("/logout.do")
	public String logoutProcess(HttpSession session) {
		session.removeAttribute("member_id");
		return "redirect:/main.do";
	}// end logoutProcess()

	@RequestMapping("/identify.do")
	public String identify() {
		return "identify";
	}// end identify()/////////////////////////

	@RequestMapping(value = "/findId.do", method = RequestMethod.POST)
	public @ResponseBody String findIdProcess(String member_name, String member_tel) {

		// System.out.println(member_name);
		// System.out.println(member_tel);

		MemberDTO dto = new MemberDTO();
		dto.setMember_name(member_name);
		dto.setMember_tel(member_tel);

		// System.out.println("찾은 아이디 : " + memService.findIdPro(dto));
		return memberService.findIdPro(dto);
	}// end findIdProcess()//////////////////////

	// 이메일 전송 처리 해주려면
	/*
	 * <!-- https://mvnrepository.com/artifact/javax.mail/mail --> <dependency>
	 * <groupId>javax.mail</groupId> <artifactId>mail</artifactId>
	 * <version>1.4.7</version> </dependency>
	 * 
	 * 추가해줘야한다.
	 */
	@RequestMapping(value = "/findPw.do")
	public @ResponseBody String findPwProcess(String member_id, String member_tel) {

		// System.out.println(member_id);
		// System.out.println(member_tel);

		MemberDTO dto = new MemberDTO();
		dto.setMember_id(member_id);
		dto.setMember_tel(member_tel);

		// System.out.println(memService.findPwPro(dto));
		String res = Integer.toString(memberService.findPwPro(dto));

		if (res.equals("1")) {
			return "1";
		} else {

			return "0";
		}
	}

	@RequestMapping(value = "/sendEmail.do", method = RequestMethod.POST)
	public @ResponseBody void sendEmailPro(String member_id) {
		String email = member_id;
		// 비밀번호 재설정 링크.
		String resetPassworeLink = "http://localhost:8090/gogipam/D" + Util.encryption(member_id) + ".do"; // 인증코드값 생성
		// System.out.println(resetPassworeLink);

		try {
			SendEmail.sendMail(email, resetPassworeLink); // 이메일 발송.
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// http://localhost:8090/myfaq/a.do
	// http://localhost:8090/myfaq/Dwkdcjfdjd@naver.com.do

	/**
	 * Pathvariable 예제
	 * 
	 * @return
	 */
	@RequestMapping("/{url}")
	public String page(@PathVariable("url") String url) {
		String returnUrl = "";
		System.out.println(url);
		// decryption 해줘야 한다는 의미에서 'D'를 붙였음..
		if (url.charAt(0) == 'D') {
			return "reset";
		}
		return "redirect:/" + url;
	}

	@RequestMapping(value = "/updatePwd.do", method = RequestMethod.POST)
	public @ResponseBody String updatePassword(String HEX_member_id, String member_pwd) {

		// System.out.println("start updatePassword() !! ");
		MemberDTO dto = new MemberDTO();

		// System.out.println(HEX_member_id);
		String member_id = Util.decryption(HEX_member_id);

		// System.out.println(member_id);
		dto.setMember_id(member_id);
		dto.setMember_pwd(member_pwd);

		memberService.updatePwdPro(dto);
		System.out.println(dto.getMember_pwd());
		return "성공";
	}
	////////////////////////////////////////////////////////////////// 회원 관련 매핑

	@RequestMapping("/productlist.do")
	public String productlist(Model model, HttpServletRequest request) {
		String list_category = (String) request.getParameter("target");

		if (list_category == null)
			list_category = "";

		if (!list_category.equals("all")) {
			if (list_category.equals(""))
				model.addAttribute("plist", listService.listAllProcess());
			else
				model.addAttribute("plist", listService.listGroupProcess(list_category));
		} else
			model.addAttribute("plist", listService.listAllProcess());
		return "productlist";
	}

	@RequestMapping("/productdetail.do")
	public String detail(Model model, HttpServletRequest request) {
		String namekey = (String) request.getParameter("target");
		model.addAttribute("plist", listService.listContentProcess(namekey));
		model.addAttribute("popt", optionService.loadOptionProcess(namekey));

		return "productdetail";
	}
	////////////////////////////////////////////////////////////////// 상품 리스트 관련 매핑

	@RequestMapping("/order.do")
	public ModelAndView order() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("adrList", addressService.selectAddressProcess("nananan1213@naver.com"));
		mav.addObject("countAdr", addressService.countAddressProcess("nananan1213@naver.com"));
		mav.setViewName("order");
		return mav;
	}

	@RequestMapping(value = "/adr_insert.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AddressDTO> orderAddrinsert(AddressDTO adto) {
		return addressService.insertAddressProcess(adto);

	}

	@RequestMapping(value = "/adr_update.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AddressDTO> orderAddrupdate(AddressDTO adto) {
		return addressService.updateAddressProcess(adto);

	}
	/////////////////////////////////////////////////////////////////// 상품 주문관련 매핑

	/// 총 가격 계산해주는 메소드
	public int totalPrice(String member_id) {

		// cart테이블에서 member_id컬럼의 값이 현재 로그인 되어있는 회원의 아이디만 가져온다.
		// List<CartDTO>에 넣어준다. (list)
		List<CartDTO> list = cartService.cartListPro(member_id);

		// 현재 회원이 장바구니에 담은 상품들의 전체 가격을 계산한다. (total_price)
		int total_price = 0;
		for (int i = 0; i < list.size(); i++) {
			int cart_price = list.get(i).getCart_price();
			int cart_amount = list.get(i).getCart_amount();
			total_price += (cart_price * cart_amount);
		}

		return total_price;
	}

	//////// 페이지 출력 기능
	// list, total_price 를 뷰로 보내주고 처리한다.
	@RequestMapping("/cart.do")
	public ModelAndView cart(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<CartDTO> list = null;

		// 세션에저장되어 있는 값을 가져온다. (member_id)
		String member_id = (String) session.getAttribute("member_id");

		// cart테이블에서 member_id컬럼의 값이 현재 로그인 되어있는 회원의 아이디만 가져온다.
		// List<CartDTO>에 넣어준다. (list)
		list = cartService.cartListPro(member_id);

		// 현재 회원이 장바구니에 담은 상품들의 전체 가격을 계산한다. (total_price)
		int total_price = totalPrice(member_id);

		mav.addObject("list", list);
		mav.addObject("total_price", total_price);

		mav.setViewName("cart");

		return mav;
	}// end emptyProcess()/////////////////////////

	//////// - + 눌렀을때 이벤트 처리
	@RequestMapping("/amountChange.do")
	public @ResponseBody List<Object> amountChange(String cart_num, String operation, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cart_num", cart_num);
		map.put("operation", operation);
		CartDTO dto = cartService.updateCartPro(map);

		// 세션에저장되어 있는 값을 가져온다. (member_id)
		String member_id = (String) session.getAttribute("member_id");

		int total_price = totalPrice(member_id);
		List<Object> objList = new ArrayList<Object>();

		// list에 dto와 total_price를 추가한다.
		objList.add(dto);
		objList.add(total_price);

		// dto와 total_price 담은 list를 반환한다.
		return objList;
	}

	//////// 삭제 눌렀을때 이벤트 처리
	@RequestMapping("/deleteCart.do")
	public @ResponseBody List<CartDTO> deleteCart(int cart_num, HttpSession session) {
		List<CartDTO> list = new ArrayList<CartDTO>();
		String member_id = (String) session.getAttribute("member_id");
		list = cartService.deleteCartPro(cart_num, member_id);

		return list;
	}
	//////////////////////////////////////////////////////////////////// 장바구니 관련 매핑
}
