package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.Board_dao;
import mvc.model.Board_dto;

public class Board_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5; 

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
	
		if (command.equals("/BoardListAction.do")) {
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/board_list.jsp");
			rd.forward(request, response);
		} else if (command.equals("/BoardWriteForm.do")) {
				requestLoginName(request);
				RequestDispatcher rd = request.getRequestDispatcher("./board/board_writeform.jsp");
				rd.forward(request, response);				
		} else if (command.equals("/BoardWriteAction.do")) {
				requestBoardWrite(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
				rd.forward(request, response);						
		} else if (command.equals("/BoardViewAction.do")) {
				requestBoardView(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
				rd.forward(request, response);						
		} else if (command.equals("/BoardView.do")) {
				RequestDispatcher rd = request.getRequestDispatcher("./board/board_view.jsp");
				rd.forward(request, response);	
		} else if (command.equals("/BoardUpdateAction.do")) {
				requestBoardUpdate(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
				rd.forward(request, response);
		}else if (command.equals("/BoardDeleteAction.do")) {
				requestBoardDelete(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
				rd.forward(request, response);				
		} 
	}
		
	public void requestBoardList(HttpServletRequest request){
			
		Board_dao dao = Board_dao.getInstance();
		List<Board_dto> boardlist = new ArrayList<Board_dto>();
		
	  	int pageNum=1;
		int limit=LISTCOUNT;
		
		if(request.getParameter("pageNum")!=null)
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
				
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		int total_record=dao.getListCount(items, text);
		boardlist = dao.getBoardList(pageNum,limit, items, text); 
		
		int total_page;
		
		if (total_record % limit == 0){     
	     	total_page =total_record/limit;
	     	Math.floor(total_page);  
		}
		else{
		   total_page =total_record/limit;
		   Math.floor(total_page); 
		   total_page =  total_page + 1; 
		}		
   
   		request.setAttribute("pageNum", pageNum);		  
   		request.setAttribute("total_page", total_page);   
		request.setAttribute("total_record",total_record); 
		request.setAttribute("boardlist", boardlist);								
	}
	
	public void requestLoginName(HttpServletRequest request){
					
		String id = request.getParameter("id");	
		Board_dao  dao = Board_dao.getInstance();	
		String name = dao.getLoginNameById(id);			
		request.setAttribute("name", name);									
	}
	
	public void requestBoardWrite(HttpServletRequest request){
        Board_dao dao = Board_dao.getInstance();		
        Board_dto board = new Board_dto();

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");

        if (id == null || name == null || subject == null || content == null) {
            System.out.println("Error: Missing parameter");
            return;
        }

        board.setId(id);
        board.setName(name);
        board.setSubject(subject);
        board.setContent(content);	

        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
        String regist_day = formatter.format(new java.util.Date()); 

        board.setHit(0);
        board.setRegist_day(regist_day);
        board.setIp(request.getRemoteAddr());			

        try {
            dao.insertBoard(board);
        } catch (Exception e) {
            e.printStackTrace();
        }							
    }
	
	public void requestBoardView(HttpServletRequest request){
					
		Board_dao dao = Board_dao.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		
		Board_dto board = new Board_dto();
		board = dao.getBoardByNum(num, pageNum);		
		
		request.setAttribute("num", num);		 
   		request.setAttribute("page", pageNum); 
   		request.setAttribute("board", board);   									
	}
	
	public void requestBoardUpdate(HttpServletRequest request){
					
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		
		Board_dao dao = Board_dao.getInstance();		
		
		Board_dto board = new Board_dto();		
		board.setNum(num);
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));		
		
		 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		 String regist_day = formatter.format(new java.util.Date()); 
		 
		 board.setHit(0);
		 board.setRegist_day(regist_day);
		 board.setIp(request.getRemoteAddr());			
		
		 dao.updateBoard(board);								
	}
	
	public void requestBoardDelete(HttpServletRequest request){
					
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		
		Board_dao dao = Board_dao.getInstance();
		dao.deleteBoard(num);							
	}	
}