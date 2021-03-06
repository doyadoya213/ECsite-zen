<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="./css/productDetails.css">
<title>商品詳細</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="main">
		<div id="selectedProduct">
			<div id="sProductImage">
				<img src="<s:property value='session.d_image_file_path'/>"
					alt="Photo" width="300px" height="250px">
			</div>
			<div id="sProductInfo">
				<table class="table">
					<tbody>
						<tr>
							<td colspan="2"><h3>
									<s:property value="session.d_product_name" />
								</h3></td>
						</tr>
						<tr>
							<th>かな</th>
							<td><s:property value="session.d_product_name_kana" /></td>
						</tr>
						<tr>
							<th>価格</th>
							<td><s:property value="session.d_product_price" />円</td>
						</tr>
						<tr>
							<th>発売日</th>
							<td><s:property value="session.d_release_date" /></td>
						</tr>
						<tr>
							<th>販売会社</th>
							<td><s:property value="session.d_release_company" /></td>
						</tr>
						<tr>
							<th>在庫:</th>
							<td><s:property value="session.d_stock" />個</td>
						</tr>
						<tr>
							<th>購入個数</th>
							<td><s:form action="goCartInsertAction" id="form"
									name="form">
									<s:if test="session.d_stock > 0">
										<s:select id="selectbtn" name="product_count" list="stockList" />
										<s:submit id="insertbtn" value=" カートに入れる"
											onclick="goCartInsertAction();">
											<s:hidden name="product_id" value="%{session.d_product_id}" />
										</s:submit>
									</s:if>
									<s:else>
										<p>在庫がありません。</p>
										<s:hidden name="product_id" value="%{session.d_product_id}" />
									</s:else>
								</s:form></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="clear"></div>
			<div id="sproductDetail">
				<h2>
					<s:property value="session.d_product_description" />
				</h2>
			</div>
		</div>
		<s:iterator value="sugestList">
			<div id="sugestProduct">
				<ul>
					<li><a
						href="<s:url action="ProductDetailsAction"><s:param name="product_id" value="%{product_id}" /></s:url>"><img
							src="<s:property value='image_file_path'/>" alt="Photo"
							width="70" height="70"></a></li>
					<li><h4>商品名:<s:property value="product_name" /></h4></li>
					<li><h4>かな:<s:property value="product_name_kana" /></h4></li>
					<li><h4>価格:<s:property value="price" />円</h4>
					</li>
					<s:hidden name="product_id" value="%{product_id}" />
				</ul>
			</div>
		</s:iterator>
		<div class="clear"></div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>