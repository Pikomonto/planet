<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<c:choose>
				<c:when test="${sessionScope.LOG_STATUS=='true'}">
				<div class="headerline ButtonBlok">
						<div class="table-cell-block">
							<form method="post" action="/planet/MyCabinet"  onsubmit="return My_Cabinet()">
								<input type="submit" class="loginButton" value="${Text['MY_CABINET']}" />
							</form>
							<br>
							<form method="post" onsubmit="return Log_out()">
								<input type="hidden" name="command" value="Log_Out" /> <input
									type="submit" class="loginButton" value="${Text['LOG_OUT']}" />
							</form>
						</div>
					</div>
				<div class="headerline loginblock loginform">
						<div class="table-cell-block">
							<div class="userImg">
								<img src="${pageContext.request.contextPath}/img/user_icon1.png" alt="user">
							</div>
							<div class="loginform">
								<div class="customfield">
									<p>${Text['HEADER_HELLO']} ${sessionScope.uname}</p>
								</div>
								<div class="customfield">
									<p>${Text['USER_MESSAGE']} 0 ${Text['USER_MESSAGE2']}</p>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
				<div class="headerline ButtonBlok">
						<div class="table-cell-block">
							<input class="geenButton loginButton" form="loginform"
								type="submit" value="${Text['HEADER_BT_LOGIN']}" />
							<div class="loginlink">
								<a class="passrec-popup" href="#reg-form">${Text['HEADER_REGISTER']}</a>
							</div>
							<div class="loginlink">
								<a href="#passrec-form" class="passrec-popup">${Text['HEADER_FORGOTPASS']}</a>
							</div>
						</div>
					</div>
					<div class="headerline loginblock">
						<form id="loginform" method="post" class="loginform" onsubmit="return Log_in()">
							<input type="hidden" name="command" value="Log_In" />
							<div class="field">
								<label for="log">${Text['HEADER_LOGIN']}</label>
								<input type="text" id="log" name="name" placeholder=" ${Text['PLACEHOLDER_NAME']}" required>
							</div>
							<div class="field">
								<label for="pass">${Text['HEADER_PASSWORD']}</label> 
								<input type="password" id="pass" name="password" placeholder=" ${Text['PLACEHOLDER_PASS']}" required />
							</div>
							<div class="customfield">
								<input id="rememberMe" type="checkbox" name="remember" />
								<label for="rememberMe">${Text['REMEMBER_ME']}</label>
							</div>
						</form>
					</div>
				</c:otherwise>
			</c:choose>