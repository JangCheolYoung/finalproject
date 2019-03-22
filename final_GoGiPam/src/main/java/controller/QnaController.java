package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.QnaDTO;
import dto.QnaPageDTO;
import service.QnaService;

// http://localhost:8090/myf/qnaPage.do

@Controller
public class QnaController {
	private QnaService qnaService;
	private String path;

	public void setPath(String path) {
		this.path = path;
	}
	
	QnaPageDTO pdto;

	public QnaController() {
	}

	public void setQnaService(QnaService qnaService) {
		this.qnaService = qnaService;
	}
	

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

//		System.out.println(map.get("member_id"));
		list = qnaService.listQuestionPro(map);

//		for (int i = 0; i < list.size(); i++) {
//			System.out.println(list.get(i).getQuestion_title());
//		}

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
		if(file != null) {
			String fileName = file.getOriginalFilename();
			//중복파일명을 처리하기 위해 난수 발생.
			UUID random = UUID.randomUUID();
			//String root = request.getSession().getServletContext().getRealPath("/");
			//root+"temp/"
			//String saveDirectory = root + "temp" + File.separator;
			String saveDirectory = path;
			File fe = new File(saveDirectory);
			//폴더가 있는지 확인하고~
			if(!fe.exists()) {
				fe.mkdir();
			}
			//파일을 저장할 경로와 파일명 생성
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
//	// 문의 내용을 삽입하는 메소드...
//	@RequestMapping(value = "/insertQuestion.do", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> questionPro(QnaDTO dto, QnaPageDTO pdto, HttpSession session) {
//		String member_id = (String) session.getAttribute("member_id");
//		dto.setMember_id(member_id);
//		
//		if (dto.getQuestion_file() == null) {
//			dto.setQuestion_file("null");
//		}
//		
//		qnaService.insertQuestionPro(dto);
//		
//		// 총 레코드 수를 가져온다.
//		int totalRecord = qnaService.countPro(member_id);
//		if (pdto.getCurrentPage() == 0) {
//			pdto.setCurrentPage(1);
//		}
//		QnaPageDTO sendPdto = new QnaPageDTO(pdto.getCurrentPage(), totalRecord);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("pdto", sendPdto);
//		map.put("member_id", member_id);
//		List<QnaDTO> list = qnaService.listQuestionPro(map);
//		
//		System.out.println("totalPage:" + sendPdto.getTotalPage());
//		
//		Map<String, Object> sendMap = new HashMap<String, Object>();
//		sendMap.put("list", list);
//		sendMap.put("pdto", sendPdto);
//		
//		
//		
//		return sendMap;
//	}

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

}// end class/////////////////////////////
