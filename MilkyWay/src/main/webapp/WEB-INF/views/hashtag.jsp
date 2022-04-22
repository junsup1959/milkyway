<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>  
    <section id="wrap" class="clearfix">
        <div id="leftWrap">
           <div class="contentList">
               
            <c:forEach var="imgList" items="${list }">
            <h2>${imgList.idx }</h2>
             <div class="contentWrap" onclick="location.href='${cpath }/read/${imgList.idx }'">
             <c:if test="${imgList.getFileList()[0] ne '' }">   <!-- img가 있을 경우 -->              
             <div class="tapWrap">   
                 <div id="tabImg" class="${imgList.idx }">
                      <c:forEach var="img" items="${imgList.getFileList() }" varStatus="status">                    
                     <c:choose>
                        <c:when test="${status.index + 1 eq 1}">
                              <div style="background-size:100% 100%; background-image: url('${cpath }/upload/${status.current }')" class="conImg on" title="1"></div>
                        </c:when>
                        <c:when test="${status.index + 1 ne 1}">
                              <div style="background-size:100% 100%; background-image: url('${cpath }/upload/${status.current }')" class="conImg" title="${status.index + 1 }"></div>
                        </c:when>
                     </c:choose>
                       </c:forEach>

                 </div>
                 
             </div>
             </c:if>    
             <div class="readContent"> content 내용 : ${imgList.getContent() }</div>
                <div class="replyWrap">
                        <details>
                            <summary>댓글보기</summary>
                            <div class="reply">
                                <a href="${cpath }/read/${imgList.idx  }">댓글작성</a>
                            </div>
                            
                            <div class="replyList">
                                <ul>
                                <c:forEach var="reply" items="${reList}">
                                <c:if test="${reply.board_idx eq imgList.idx }">
                                    <li> 
                                        <details style="display: inline-block"><summary>${reply.reply_content } </summary>
                                            <form id="r_replyForm" class="re_form">
                                            <input type="hidden" name="reply_idx">
                                            <input type="text" name="member_user" value="user"  class="re_user">
                                            <div name="r_reply_content" contenteditable="true"  class="re_cont"></div>
                                            <input type="submit" class="sub_btn" value="답글작성"> 
                                            </form>
                                        </details>
                                        <i class="xi-heart-o xi-2x" name="recommend" id="recommend"></i>
                                    </li>
                                    </c:if>
                                    </c:forEach>
                                    
                                </ul>
                            </div>
                           
                        </details>
                    </div>
                    
                </div>
         </c:forEach>
         </div>
         </div>
      
        <div id="rightWrap">
            <div>
            	<p>나를 위한 트렌드</p>
	            	<c:forEach var="hash" items="${hashList }">
	            		<div class="hashDiv" onclick="location.href='${cpath}/${hash.hashtag }'">
	            			<p>${hash.hashtag }</p>
	            			<p><fmt:formatNumber value="${hash.hashCnt }" pattern="###,###,###" /> 테그</p>
	            		</div>
	            	</c:forEach>
	            	<div class="hashDiv" onclick="">
						<p>더보기</p>	            	
	            	</div>
            </div>
        </div>
    </section>
    
    </body>
    </html>