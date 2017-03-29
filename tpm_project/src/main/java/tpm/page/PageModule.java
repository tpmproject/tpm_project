package tpm.page;
/*
 * 1. 페이지 이름
 * 2. 총 게시물 수
 * 3. 보여줄 리스트 수
 * 4. 보여줄 페이지 수
 * 5. 현재 사용자의 위치
 */

public class PageModule {
	public static String makePage(String pageName, int totalCnt, int listSize, int pageSize, int cp){
		
		int totalPage = totalCnt/listSize + 1; // 총 페이지 수
		if(totalCnt % listSize == 0)totalPage--;

		int userGroup = cp / pageSize; // 해당 페이지의 페이지 그룹
		if(cp % pageSize == 0)userGroup--;  
		StringBuffer sb = new StringBuffer();
		
		if(userGroup != 0){ // 현재 그룹이 첫 페이지 그룹이 아닌 경우
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize + pageSize;
			sb.append(temp);
			sb.append("'>&lt;&lt;</a>");
		} 
		
		for(int i = (userGroup * pageSize) + 1 ; i <= (userGroup * pageSize) + pageSize ; i++){
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");

			if(i == totalPage)break;
		}
		
		if(userGroup != (totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)){ // 현재 그룹이 마지막 페이지가 해당하는 그룹에 해당되지 않는 경우
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp = ((userGroup+1)*pageSize) + 1;
			sb.append(temp);
			sb.append("'>&gt;&gt;</a>");
		} 
		
		return sb.toString();
	}
}

