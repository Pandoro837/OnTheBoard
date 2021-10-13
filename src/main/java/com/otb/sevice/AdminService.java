package com.otb.sevice;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.otb.dao.AdminDao;
import com.otb.vo.ReservationDateVo;
import com.otb.vo.ReservationTimeVo;
import com.otb.vo.StoreImageVo;
import com.otb.vo.StoreVo;

@Service
public class AdminService {

	@Autowired AdminDao adminDao;
	
	//매장 정보 호출
	public StoreVo getStore(int userNo) {
		
		System.out.println("서비스 - 매장 확인");
		System.out.println(userNo);
		
		StoreVo storeVo = adminDao.selectStore(userNo);
		
		return storeVo;
		
	}
	
	// 매장 등록
	public void registerStoreInfo(StoreVo storeVo) {
		System.out.println("서비스 - 인서트 스토어 인포");
		System.out.println(storeVo.toString());
		
		adminDao.insertStoreInfo(storeVo);
	}
	
	// 매장 정보 수정
	public void modifyStoreInfo(StoreVo storeVo) {
		System.out.println("서비스 - 업데이트 스토어 인포");
		System.out.println(storeVo.toString());
		
		adminDao.updateStoreInfo(storeVo);
	}
	
	//매장 이미지 등록
	public void restoreImages(List<MultipartFile> fileList, int userNo) {
		
		System.out.println("서비스 도착");
		
		//저장 폴더 경로
		String saveDirectory = "C:\\JavaStudy\\upload\\otb";
		
		//매장 번호 호출
		int storeNo = adminDao.selectStore(userNo).getStoreNo();
		
		//이미지 저장
		for(MultipartFile image : fileList) {
			//이미지의 원래 이름
			String oriName = image.getOriginalFilename();
			
			//이미지의 확장자 명 구하기
			int indexNum = oriName.lastIndexOf(".");
			String exName = oriName.substring(indexNum);
			
			//이미지의 저장용 이름
			String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
			
			//저장 경로
			String storePathImage = saveDirectory +"\\"+ saveName;
			
			StoreImageVo storeImage = new StoreImageVo(storeNo, storePathImage);
			System.out.println(storeImage.toString());

			try {
				//파일 정보를 하드 디스크에 저장
				byte[] fileData = image.getBytes();
				
				OutputStream out = new FileOutputStream(storePathImage);
				BufferedOutputStream bf = new BufferedOutputStream(out);
				
				bf.write(fileData);
				bf.close();
				
				//파일 정보를 db에 저장
				adminDao.insertStoreImage(storeImage);
				
				int storeImageNo = storeImage.getStoreImageNo();
				System.out.println("매장 이미지 번호 " + storeImageNo);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		
	}	

	//매장 스케쥴 등록
	public void addSchedule(String date, String[] times, ReservationDateVo reservationDateVo) {
//		System.out.println("스케쥴 서비스 도착");
		String[] days = date.split(",");
		
		for(int i = 0; i < days.length; i ++) {
			reservationDateVo.setStoreReservationDate(days[i]);
			
			//날짜 번호를 찾는다
			int dateNo = adminDao.selectDateNo(reservationDateVo);
			
			//해당하는 날짜 번호가 없을 경우
			if(dateNo == 0) {
				System.out.println("날짜 번호 없음");
				//날짜 번호 생성
				adminDao.insertDate(reservationDateVo);
				
				dateNo = reservationDateVo.getReservationDateNo();
				System.out.println("date 인서트 이후 dateNo 값 비교");
				
				//해당 날짜번호를 FK로 갖는 시간 데이터 생성
				System.out.println(dateNo);
				for(int j = 0; j < times.length; j ++) {
					ReservationTimeVo reservationTimeVo = new ReservationTimeVo();
					reservationTimeVo.setReservationDateNo(dateNo);
					reservationTimeVo.setStoreReservationTime(times[j]);
					
					System.out.println(reservationTimeVo.toString());
					
					adminDao.insertTime(reservationTimeVo);
				}
			} else {
				System.out.println("날짜 번호 있음");
				//날짜 번호가 이미 있을 경우, 해당하는 날짜 번호를 갖는 시간을 모두 삭제
				adminDao.deleteTime(dateNo);
				
				//이후 재등록
				for(int j = 0; j < times.length; j ++) {
					ReservationTimeVo reservationTimeVo = new ReservationTimeVo();
					reservationTimeVo.setReservationDateNo(dateNo);
					reservationTimeVo.setStoreReservationTime(times[j]);
					
					System.out.println(reservationTimeVo.toString());
					
					adminDao.insertTime(reservationTimeVo);
				} 
				
			}
			
		}
		
	}

}
