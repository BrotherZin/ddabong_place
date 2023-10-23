package com.ezen.dda.personalfunction;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class PersonalFnController {
	@Autowired
	SqlSession sqlSession;

	static String imagepath = "C:\\Users\\wjdql\\ddabong_place\\ddabong_place\\src\\main\\webapp\\image";

	// 매장 상세 정보,해당 매장 리뷰 등을 출력.
	@RequestMapping(value = "/detailview")
	public String detailview(HttpServletRequest request, Model mo) {
		String storeID = request.getParameter("store_id");

		int mon = LocalDate.now().getMonthValue(); // 현재 월을 숫자 1~12 로 받아옴
		String month; // 문자 월
		switch (mon) { // 숫자 월을 문자 월로 변환
		case 1:
			month = "jan";
			break;
		case 2:
			month = "feb";
			break;
		case 3:
			month = "mar";
			break;
		case 4:
			month = "apr";
			break;
		case 5:
			month = "may";
			break;
		case 6:
			month = "jun";
			break;
		case 7:
			month = "jul";
			break;
		case 8:
			month = "aug";
			break;
		case 9:
			month = "sep";
			break;
		case 10:
			month = "oct";
			break;
		case 11:
			month = "nov";
			break;
		default:
			month = "dcb";
		}

		PersonalFnService ss = sqlSession.getMapper(PersonalFnService.class);

		ArrayList<ReviewDTO> reviewlist = ss.review(storeID);
		ArrayList<DDAbongDTO> ddabonglist = ss.ddabong(storeID, month);
		ArrayList<RegistrationDTO> registrationlist = ss.registration(storeID);

		// registrationlist의 다중 이미지 출력
		// 이미지 파일명을 처리하여 imageList에 저장
		for (RegistrationDTO registrationDTO : registrationlist) {
			String image = registrationDTO.getImage(); // dto의 이미지 데이터를 image에 저장.

			// image가 null이거나 비어있을경우가 아닐때 imageFileNames에 콤마와 공백을 기준으로 배열저장.
			if (image != null && !image.isEmpty()) {
				String[] imageFileNames = image.split("[,\\s]+");

				// imageFileNames를 리스트화 시키고 ArrayList에 집어넣은 imageList를 만들고 DTO의 imagelist 배열에
				// 저장.
				List<String> imageList = new ArrayList<>(Arrays.asList(imageFileNames));
				registrationDTO.setImageList(imageList);
			}
		}

		for (ReviewDTO reviewDTO : reviewlist) {
			String image = reviewDTO.getImage();

			if (image != null && !image.isEmpty()) {
				String[] imageFileNames = image.split("[,\\s]+");

				List<String> imageList = new ArrayList<>(Arrays.asList(imageFileNames));
				reviewDTO.setImageList(imageList);
			}
		}

		mo.addAttribute("reviewlist", reviewlist);
		mo.addAttribute("ddabonglist", ddabonglist);
		mo.addAttribute("registrationlist", registrationlist);

		return "personaldetail";
	}

	// 예약페이지로 이동 및 해당 매장의 정보를 예약 페이지로 전송.
	@RequestMapping(value = "/reserv")
	public String reserv(HttpServletRequest request, Model mo) {

		String storeID = request.getParameter("storeID");
		String storename = request.getParameter("storename");
		mo.addAttribute("storeID", storeID);
		mo.addAttribute("storename", storename);

		return "reservation";
	}

	// 예약내역을 저장.
	@RequestMapping(value = "/reservsave")
	public String reservsave(HttpServletRequest request, Model mo) {

		String storeID = request.getParameter("storeid");
		String customer_id = request.getParameter("customer_id");
		String reservation_date = request.getParameter("reservation_date").substring(0, 10);
		String reservation_time = request.getParameter("reservation_time");
		String reservation_name = request.getParameter("reservation_name");
		int person_num = Integer.parseInt(request.getParameter("person_num"));

		PersonalFnService ss = sqlSession.getMapper(PersonalFnService.class);
		ss.reservation(customer_id, storeID, reservation_date, reservation_time, person_num, reservation_name);

		return "redirect:/main";
	}

	// 리뷰 데이터를 저장.
	@RequestMapping(value = "/review", method = RequestMethod.POST)
	public String reviewsave(MultipartHttpServletRequest mul) {
		List<MultipartFile> filelist = mul.getFiles("reviewfile");
		String content = mul.getParameter("reviewcontent");
		double star = Double.parseDouble(mul.getParameter("star"));
		String storeid = mul.getParameter("storeid");
		String customerid = mul.getParameter("customerid");

		String imagesname = "";
		for (MultipartFile mf : filelist) {
			String imagefile = mf.getOriginalFilename();
			imagesname += imagefile + " ";
			try {
				mf.transferTo(new File(imagepath + "//" + imagefile));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		// 현재 날짜 정보를 가져와서 datestring에 저장.
		LocalDate today = LocalDate.now();
		String dateString = today.toString(); // datestring=예약일자(예약등록일).

		PersonalFnService ss = sqlSession.getMapper(PersonalFnService.class);
		ArrayList<ReviewDTO> reservnumlist = ss.reservnumlist(storeid, customerid);
		Double reservnum = (double) reservnumlist.get(0).getReservation_num();
		ss.reviewsave(reservnum, content, imagesname, star, dateString);

		return "redirect:/main";
	}
	
	// 리뷰 작성전 예약이력 체크
	@ResponseBody
	@RequestMapping(value = "/reviewcheck")
	public String reviewcheck(String storeid, String customerid) {
		PersonalFnService ss = sqlSession.getMapper(PersonalFnService.class);
		int cnt = ss.reviewcheck(customerid, storeid);
		String bb = null;
		if (cnt == 0) {
			bb = "ok";
		} else {
			bb = "";
		}
		return bb;
	}
	
	// 예약 중복 확인
	@ResponseBody
	@RequestMapping(value = "/duplicatecheck")
	public String duplicatecheck(String customer_id,String reservation_date) {
		PersonalFnService ss=sqlSession.getMapper(PersonalFnService.class);
		int cnt=ss.duplicatecheck(customer_id,reservation_date);
		String bb = null;
		if (cnt == 0) {
			bb = "ok"; 
		} else {
			bb = "";
		}
		return bb;
	}
	

	// 예약현황
	@RequestMapping(value = "/myStatus", method = RequestMethod.GET)
	public String myStatus(HttpServletRequest request, Model mo) {
		String customer_id = request.getParameter("customer_id");
		PersonalFnService ps = sqlSession.getMapper(PersonalFnService.class);

		ArrayList<ReservationDTO> ReservationList = ps.myStatus(customer_id);
		mo.addAttribute("ReservationList", ReservationList);
		return "myStatus";
	}

	// 예약 삭제
	@RequestMapping(value = "/ReservationDelete")
	public String ReservationDelete(HttpServletRequest request) {
		String reservation_num = request.getParameter("reservation_num");
		PersonalFnService ss = sqlSession.getMapper(PersonalFnService.class);
		ss.reservationDelete(reservation_num);

		return "myStatus";
	}
}
