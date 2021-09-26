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
import kr.co.firstgym.command.BoardPageVO;
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
			System.out.println("파일 저장 성공: " + savePath);
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
		
		if(article.getUserId() == null) {
			article.setUserId("(탈퇴한 회원입니다)");
		}
		
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
	public List<BoardVO> getBoard(BoardPageVO page) {
		
		List<BoardVO> returnBoard = boardMapper.getBoard(page);
		
		for(BoardVO vo : returnBoard) {
			if(vo.getUserId() == null) {
				vo.setUserId("(탈퇴한 회원입니다)");
			}
		}
		
		return returnBoard;
	}

	@Override
	public int getTotalArticleNum(BoardPageVO page) {
		return boardMapper.getTotalArticleNum(page);
	}

	@Override
	public void deleteArticle(int boardNum) {
		
		BoardVO article = boardMapper.getArticle(boardNum);
		
		String video = article.getBoardVideo();
		String thum = article.getBoardThum();
		List<String> images = imageMapper.getImages(boardNum);
		
		//영상삭제
		if(video != null) {
			String videoRealPath = getRealFilePath(video, "video");
			String thumRealPath = getRealFilePath(thum, "img");
			
			deleteFile(videoRealPath);
			deleteFile(thumRealPath);
		}
		
		//이미지 삭제
		if(! images.isEmpty()) {
			for(String image : images) {
				String imageRealPath = getRealFilePath(image, "img");
				
				deleteFile(imageRealPath);
			}
		}
		
		//db에서 게시글 삭제
		boardMapper.deleteArticle(boardNum);	
	}

	private void deleteFile(String path) {
		File file = new File(path);
		if(file.exists()) {
			if(file.delete()) {
				System.out.println(path + " 삭제 완료");
			} else {
				System.out.println(path + " 삭제 실패");
			}
		}
	}
	
	private String getRealFilePath(String path, String imgOrVideo) {
		String[] fileNameSplit = path.split("/");
		String fileName = fileNameSplit[fileNameSplit.length - 1];
		
		String fileRealPath = "";
		
		if(imgOrVideo.equals("img")) {
			fileRealPath = "C:\\firstGym\\image\\" + fileName;
		}else {
			fileRealPath = "C:\\firstGym\\video\\" + fileName;			
		}
		
		return fileRealPath;
	}

	@Override
	public void updateArticle(BoardVO boardInfo, List<MultipartFile> images, MultipartFile video, boolean imageDelCheck) {
		
		//기존의 게시글, 이미지 정보
		BoardVO oldArticle = boardMapper.getArticle(boardInfo.getBoardNum());
		List<String> oldImages = imageMapper.getImages(boardInfo.getBoardNum());
		
		//이미지 매퍼로 보낼 vo객체
		BoardImageVO registImage = new BoardImageVO();
		registImage.setBoardNum(boardInfo.getBoardNum());
		
		boardInfo.setBoardThum(oldArticle.getBoardThum());
		boardInfo.setBoardVideo(oldArticle.getBoardVideo());
		
		if(! video.isEmpty()) { //새로운 동영상이 있을 때
			if(oldArticle.getBoardVideo() != null) { //기존 동영상이 있다면 기존의 동영상 삭제 + 썸네일 삭제	
				
				String oldVideoPath = getRealFilePath(oldArticle.getBoardVideo(), "video");
				deleteFile(oldVideoPath);
				String oldThumPath = getRealFilePath(oldArticle.getBoardThum(), "img");
				deleteFile(oldThumPath);
			}
			
			//동영상 등록
			String videoPath = registFile(video, "C:\\firstGym\\video", "video");
			boardInfo.setBoardVideo(videoPath);
			
			//썸네일 이미지 저장
			boardInfo.setBoardThum(registThumVideo(getRealFilePath(videoPath, "video")));
			
			System.out.println(imageDelCheck);
			if(imageDelCheck) { //기존 이미지 삭제
				for(String oldImage : oldImages) {
					//이미지 저장소에서 삭제
					String oldImagePath = getRealFilePath(oldImage, "img");
					deleteFile(oldImagePath);
					//이미지 경로 데이터 베이스에서 삭제
					imageMapper.delete(oldImage);
				}
			}
			
			if(! images.get(0).isEmpty()) { //이미지 등록
				for(MultipartFile image : images) {
					System.out.println(image.getOriginalFilename());
					registImage.setImgBoard(registFile(image, "C:\\firstGym\\image", "img"));
					imageMapper.regist(registImage);
				}
			}
			
		} else { //동영상 없을 때			
			
			System.out.println("동영상 없음");
			
			List<String> newImages = new ArrayList<>();
			boolean needNewThum = false;
			
			if(imageDelCheck) { //기존 이미지 삭제
				for(String oldImage : oldImages) {
					//이미지 저장소에서 삭제
					String oldImagePath = getRealFilePath(oldImage, "img");
					deleteFile(oldImagePath);
					//이미지 경로 데이터 베이스에서 삭제
					imageMapper.delete(oldImage);
					
					if(boardInfo.getBoardVideo() == null) {
						boardInfo.setBoardThum("none");
					}
				}	
			}
			
			//썸네일 등록여부 검사
			if(boardInfo.getBoardVideo() == null) {
				System.out.println("service: 썸네일 지워짐");
				needNewThum = true;
			}
			
			if(! images.get(0).isEmpty()) { //이미지 등록
				for(MultipartFile image : images) {
					System.out.println(image.getOriginalFilename());
					String imgPath = registFile(image, "C:\\firstGym\\image", "img");
					registImage.setImgBoard(imgPath);
					newImages.add(imgPath);
					imageMapper.regist(registImage);
				}
				if(needNewThum) {
					System.out.println("썸네일 받아라!!");
					boardInfo.setBoardThum(newImages.get(0));
				}
			}
		}
		
		//매퍼는 null인식 못해서 none으로 넣어서 거른다.
		if(boardInfo.getBoardThum() == null) {
			boardInfo.setBoardThum("none");
		}
		if(boardInfo.getBoardVideo() == null) {
			boardInfo.setBoardVideo("none");
		}
		
		boardMapper.updateArticle(boardInfo);
		
	}
}
