package kr.co.firstgym.bmi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.firstgym.bmiresult.mapper.IBmiResultListMapper;
import kr.co.firstgym.command.BmiCheckVO;
import kr.co.firstgym.command.BmiResultVO;

@Service
public class BmiService implements IBmiService {
	
	@Autowired
	private IBmiResultListMapper mapper;
	
	@Override
	public void insertBMI(BmiCheckVO vo, String userId) {
		BmiResultVO result = new BmiResultVO();
		result.setUserId(userId);
		int age = 2021 - vo.getYear() + 1;
		double bmiValue = vo.getWeight() / Math.pow((double)vo.getHeight()/100, 2);
		System.out.println("bmi지수: " + bmiValue);
		
		if(age > 19) {
			if(bmiValue < 18.5) result.setBmiResult("underweight");
			else if(bmiValue < 22.9) result.setBmiResult("normalweight");
			else if(bmiValue < 24.9) result.setBmiResult("overweight");
			else result.setBmiResult("obesity");
		} else {
			if(vo.getGender().equals("male")) {
				if(bmiValue < 17.33) result.setBmiResult("underweight");
				else if(bmiValue < 24.95) result.setBmiResult("normalweight");
				else if(bmiValue < 25) result.setBmiResult("overweight");
				else result.setBmiResult("obesity");
			} else {
				if(bmiValue < 17.27) result.setBmiResult("underweight");
				else if(bmiValue < 23.89) result.setBmiResult("normalweight");
				else if(bmiValue < 25) result.setBmiResult("overweight");
				else result.setBmiResult("obesity");
			}
		}
		
		System.out.println(result);
		
		mapper.insertBMI(result);
		
	}

//	@Override
//	public List<BmiResultVO> selectOne(String userId, PageVO paging) {
//		System.out.println("service: " + userId);
//		Map<String, Object> map = new HashMap<>();
//		map.put("paging", paging);
//		map.put("userId", userId);
//		
//		return mapper.selectOne(map);
//	}
//	
//	@Override
//	public int countBMI(String userId) {
//		return mapper.countBMI(userId);
//	}
//
//	@Override
//	public int totCount(SearchPagingVO paging) {
//		// TODO Auto-generated method stub
//		return 0;
//	}

	
	
	
}
