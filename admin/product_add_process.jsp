<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.sql.*" %>
<%@ include file="../db/db_conn.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");

    String filename = "";
    String realFolder = request.getServletContext().getRealPath("img");
    String encType = "utf-8";
    int maxSize = 5 * 1024 * 1024;

    DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
    MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, policy);

    String productId = multi.getParameter("productId");
    String name = multi.getParameter("name");
    String unitPrice = multi.getParameter("unitPrice");
    String description = multi.getParameter("description");
    String manufacturer = multi.getParameter("manufacturer");
    String category = multi.getParameter("category");
    String unitsInStock = multi.getParameter("unitsInStock");
    String condition = multi.getParameter("condition");

    Integer price;

    if (unitPrice.isEmpty())
        price = 0;
    else
        price = Integer.valueOf(unitPrice);

    long stock;

    if(unitsInStock.isEmpty())
        stock = 0;
    else
        stock = Long.valueOf(unitsInStock);

    Enumeration files =multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);

    String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
    pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, name);
	pstmt.setString(3, unitPrice);
	pstmt.setString(4, description);
	pstmt.setString(5, manufacturer);
    pstmt.setString(6, category);
	pstmt.setString(7, unitsInStock);
	pstmt.setString(8, condition);
	pstmt.setString(9, fileName);
	pstmt.executeUpdate();
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

    /*ProductRepository dao = ProductRepository.getInstance();

    Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
    newProduct.setFilename(fileName);

    dao.addProduct(newProduct);*/

    response.sendRedirect("index_ad.jsp");
%>