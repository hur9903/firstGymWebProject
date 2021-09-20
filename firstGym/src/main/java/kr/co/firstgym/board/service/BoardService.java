package kr.co.firstgym.board.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.jcodec.api.FrameGrab;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.common.model.Picture;
import org.jcodec.scale.AWTUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.firstgym.board.mapper.IBoardImageMapper;
import kr.co.firstgym.board.mapper.IBoardMapper;
import kr.co.firstgym.command.BoardImageVO;
import kr.co.firstgym.command.BoardVO;

@Service
public class BoardService implements IBoardService{

	@Autowired
	private IBoardMapper boardMapper;
	
	@Autowired
	private IBoardImageMapper imageMapper;
	
	@Override
	public void regist(BoardVO boardInfo, List<MultipartFile> images, MultipartFile video) {
		
		List<String> imagePaths = new ArrayList<>();
		
		if(! video.isEmpty()) { //동영상이 있을 경우
			System.out.println("동영상: " + video.getOriginalFilename());
			//동영상 저장
			String videoPath = registFile(video, "C:\\firstGym\\video", "video");
			boardInfo.setBoardVideo(videoPath);
			
			
			//썸네일 이미지 저장
			String[] fileNames = videoPath.split("/");
			String fileName = fileNames[fileNames.length - 1];
			
			boardInfo.setBoardThum(registThumVideo("C:\\firstGym\\video\\" + fileName));
			
			if(! images.get(0).isEmpty()) { //사진이 있을 경우, 사진 저장 + 사진 주소 저장
				
				for(MultipartFile image : images) {
					System.out.println("동영상과 이미지: " + image.getOriginalFilename());
					imagePaths.add(registFile(image, "C:\\firstGym\\image", "img"));
				}
			}
		} else { //동영상이 없을 경우
			if(! images.get(0).isEmpty()) { //사진이 있을 경우, 사진 저장 + 사진 주소 저장 + 썸내일 뽑기+ 썸내일 주소 저장
				
				for(MultipartFile image : images) {
					System.out.println("이미지만: " + image.getOriginalFilename());
					imagePaths.add(registFile(image, "C:\\firstGym\\image", "img"));
				}
				boardInfo.setBoardThum(imagePaths.get(0));
			}
		}
		
		boardMapper.regist(boardInfo);
		
		//이미지 주소 db 등록
		if(! imagePaths.isEmpty()) {
			int boardNum = boardMapper.getArticleNo(boardInfo.getUserId());
			
			BoardImageVO imageVO = new BoardImageVO();
			imageVO.setBoardNum(boardNum);
			
			for(String path : imagePaths) {
				imageVO.setImgBoard(path);
				imageMapper.regist(imageVO);
			}
		}
		
	}
	
	//동영상 썸네일 추출및 저장 + 저장 경로 반환
	private String registThumVideo(String videoPath) {
		
		String uploadPath = "C:\\firstGym\\image";
		makeDir(uploadPath);
		
		UUID uuid = UUID.randomUUID();
		LocalDate time = LocalDate.now();
		String[] uuids = uuid.toString().split("-");
		String newFileName = uuids[0] + time.getDayOfYear();
		
		String savePath = uploadPath + "\\" + newFileName + ".png";
		
		String returnPath = "/boardImg/" + newFileName + ".png";
		
		try {
	        double startSec = 0;

	        FrameGrab grab = FrameGrab.createFrameGrab(NIOUtils.readableChannel(new File(videoPath)));
	        grab.seekToSecondPrecise(startSec);

	        Picture picture = grab.getNativeFrame();
	        BufferedImage bufferedImage = AWTUtil.toBufferedImage(picture);
	        ImageIO.write(bufferedImage, "png", new File(savePath));

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

		return returnPath;
	}
	
	//게시글 파일 저장 + 저장 경로 반환
	private String registFile(MultipartFile file, String uploadPath, String imgOrVideo) {
		
		makeDir(uploadPath);
		
		String originFileName = file.getOriginalFilename();
		String fileExtension = originFileName.substring(originFileName.lastIndexOf("."), originFileName.length());
		
		UUID uuid = UUID.randomUUID();
		LocalDate time = LocalDate.now();
		String[] uuids = uuid.toString().split("-");
		String newFileName = uuids[0] + time.getDayOfYear();
		
		String savePath = uploadPath + "\\" + newFileName + fileExtension;
		String returnPath;
		if(imgOrVideo.equals("img")) {
			returnPath = "/boardImg/" + newFileName + fileExtension;
		}else {
			returnPath = "/boardVideo/" + newFileName + fileExtension;
		}
		
		
		try {
			File saveFile = new File(savePath);
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return returnPath;
	}
	
	//폴더생성
	private void makeDir(String path) {
		
		File folder = new File("C:\\firstGym");
		
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		folder = new File(path);
		
		if(!folder.exists()) {
			folder.mkdir();
		}
	}

	@Override
	public BoardVO getArticle(int boardNum) {
		
		BoardVO article = boardMapper.getArticle(boardNum);
		
		return article;
	}
	
	@Override
	public List<String> getImages(int boardNum) {
		return imageMapper.getImages(boardNum);
	}

	@Override
	public int getArticleNo(String userId) {
		return boardMapper.getArticleNo(userId);
	}
	
	@Override
	public List<BoardVO> getBoard() {
		// TODO Auto-generated method stub
		return null;
	}


}
