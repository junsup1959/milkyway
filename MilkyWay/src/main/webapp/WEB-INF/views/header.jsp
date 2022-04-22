<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <title>SNS-main</title>

    <style>
        *{
            margin: 0;
            padding: 0;
            text-decoration: none;
            list-style: none;
            box-sizing: border-box;
            color: inherit;
            
        }
        body {
            width: 100%;
            height: 100vh;
            overflow: scroll;
            overflow-x: hidden;
            overflow-y: hidden;
        }
        .clearfix::after, .clearfix::before {
            content: '';
            display: block;
            clear: both;
        }
        
        /* header */
        #header {
            width: 100%;
            height: 80px;
            padding: 10px 30px;
            border-bottom: 1px solid #ccc;
        }
        
        #header .logo {
            float: left;
            display: block;
            width: 195px;
            background: linear-gradient(to right, #00067a, #3498db, #8e44ad);
            -webkit-background-clip: text;
              background-clip: text;
            color : transparent;
            font-size: 40px;
            font-weight: bold;
        }
        #header #searchForm {
            float: left;
            width: 300px;
            margin-left: 280px;
            margin-top: 15px;
        }
        #header #searchForm >input[type="text"] {         
            width: 100%;
            height: 40px;        
            padding-left: 20px;
            line-height: 40px;
            border: 1px solid #ccc;
            border-radius: 22px;
        }
        

        #header .iconWrap {
            float: right;
            width: 300px;
            height: 60px;
            margin-top: 15px;
            
        }
        #header .iconWrap >i {
            margin-left: 20px;
            background: linear-gradient(to bottom left, #00067a, #3498db, #8e44ad);
            -webkit-background-clip: text;
              background-clip: text;
            color : transparent;
            font-size: 32px;
        }
        
        /* body */
        #wrap{
            width: 1250px;
            height: 100%;
            margin: 0 auto;
            padding: 20px;
        }
        
        #wrap > #leftWrap {
           float : left;
            width: 750px;
            height: 650px;
            overflow-y: auto;
        }
        
         #wrap > #rightWrap {
            float: right;
            width : 450px;
            height: 650px;
            margin: 0 auto;
            padding: 20px;
         }
        
        #leftWrap .contentList .contentWrap {
            width: 650px;
            margin : 10px auto;
            padding: 20px;
            background: #fff;
            border : 2px solid;
/*            border-radius: 30px;*/
            border-image:linear-gradient(to top,#8e44ad, #00067a, #3498db); 
            border-image-slice: 1;
            
        }
        
        #leftWrap .contentList .contentWrap .readContent {
            width: 100%;
            height: 150px;
            padding : 10px;
        }
        
        /* 스토리추가 modal */
        #modal {
            position: absolute;
            display: none;
            width: 700px;
            height: 500px;
            padding: 20px;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            background: #fff;
            border-radius: 20px;
            z-index: 15;
        }
         .filebox label { 
           display: inline-block;  
         float: right;
           padding: .5em .75em; 
           color: #999; 
           font-size: inherit; 
           line-height: normal; 
           vertical-align: middle; 
           background-color: #fdfdfd; 
           cursor: pointer; 
           border: 1px solid #ebebeb; 
           border-bottom-color: #e2e2e2; 
           border-radius: .25em; 
           } 
        .filebox input[type="file"] { /* 파일 필드 숨기기 */ 
           position: absolute; 
           width: 1px; 
           height: 1px; 
           padding: 0; 
           margin: -1px; 
           overflow: hidden; 
           clip:rect(0,0,0,0); 
           border: 0; 
           }
         #content {
           padding-top: 10px;
           width:100%; 
           height:200px;
           border:none; 
           font-size: 12pt;
           font: inherit; 
        }
        #content:focus{
           outline:none;
        }
        .image {
            width: 100%;
            height: 150px;
        }
        .img {
            width: 150px;
            height: 100px;
            margin: 5px;
        }
        .bg {
            position: absolute;
            display: none;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: rgba(0,0,0,0.6);
            z-index: 10;
        }
   
        .replyWrap{
            font-size: 14px;
            color : #3498db;
        }
        .replyWrap .re_form {
            width: 100%;
            padding: 10px;
        }
        .replyList {padding-left: 15px;}
        .replyList > ul > li {margin-bottom : 20px;}
        .re_user {
            display: inline-block;
            width: 40px;
            height: 40px;
            line-height: 40px;
            background: #000;
            color : #fff;
            text-align: center;
            border: none;
            border-radius: 50%;
        }
        
        .replyWrap .re_form .re_cont {
            display: inline-block;
            width: 270px;
            height: 80px;
            line-height: 40px;
            border: 1px solid #ccc;
            border-radius: 7px;
        }
        .sub_btn {
           display : inline-block;
            width: 60px;
            height: 30px;
            line-height : 30px;
            background:  #00067a;
            color : #fff;
            font-size: 14px;
            font-weight: bold;
            text-align : center;
            border: none;
            border-radius: 10px;
        }
        .sub_btn:hover {
            background: #8e44ad;
        }
        .r_sub {margin-left : 200px}
        .r_sub_btn {
           display: inline-block;
            float : right; 
            width : 50px; 
            margin : 5px; 
            background : #8e44ad;
        }
        
        .red {
            color: red;
        }
            /* content img tab? slder?*/
        .tapWrap {
            position: relative;
            width: 100%;
            height: 600px;
            background : #222;
            margin: 0 auto; 
        }
        #tabBtn {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translate(-50%,-10px);
            z-index: 100;
        }
        #tabBtn div {          
            display: inline-block;
            width: 10px;
            height: 10px;
            margin-left: 5px;
            border: none;
            border-radius: 50%;
            background: coral;
            
        }
        
        #tabImg div {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            display: none;
        }
        #tabImg div.on {display: block}
        
        #prev {
            position: absolute;
            width: 30px;
            height: 30px;
            top: 50%;
            left: 10px;
            font-size: 22px;
            font-weight: bold;
            color: coral;
            z-index: 150;
        }
        
        #next {
            position: absolute;
            width: 30px;
            height: 30px;
            top: 50%;
            right: 5px;
            font-size: 22px;
            font-weight: bold;
            color: coral;
            z-index: 150;
        }
        .title:empty:not(:focus):before {
           content: attr(data-placeholder)
      }
       .hashDiv{
          cursor: pointer;
          padding: 10px;
             width: 300px; 
             height: auto; 
             border: 2px solid;
             border-image: linear-gradient(to top,#8e44ad, #00067a, #3498db);
             border-image-slice: 1;
       }
        
       /* home img */
        .conImagWrap {
           width : 100%;
           height : 400px;
        }

        .conImagWrap .contImg img {
           display : inline-block;      
        }
        .conImagWrap .contImg1{
           width : 100%;
        }
        .conImagWrap  .contImg2 {
           width : 100%;
           height : 190px;
           object-fit : cover;
        }
        .conImagWrap .contImg3{      
           width : 49%;
           height: 190px;
           object-fit : cover;
        }
       .conImagWrap .contImg4{      
           width : 49%;
           height: 190px;
           object-fit : cover;
        }
    </style> 
</head>
<body>
    <header id="header" class="clearfix">
        <h1 class="logo"><a href="${cpath }/">MilkyWay</a></h1>
        <form id="searchForm" method="get" action="${cpath }/hashSearch" >
            <input type="text" id="searchHash" name="search" placeholder="검색" value="${hashtag }">
        </form>
        <div class="iconWrap">
            <i class="xi-home xi-2x" title="home"></i>
            <i class="xi-users-o xi-2x" title="친구목록"></i>
            <i class="xi-bell-o xi-2x" title="알람"></i>
            <i class="xi-plus-circle xi-2x" id="newBoard" title="스토리추가"></i>
            <i class="xi-radiobox-blank xi-2x" title="profile" onclick="location.href='${cpath}/member/modify/'"></i>
        </div>
    </header>
    
    <div id="modal">
        <h2>게시물 만들기</h2>
        <hr>
        <form id="writeBoard"  enctype="multipart/form-data" method="post">
      <div  class="title" id="content" contenteditable="true"  oninput="hashtag(event)" data-placeholder="무슨 생각을 하고 계신가요?"></div>
        <div id="hashtag"></div>
           <div class="image"></div>
           <div class="filebox">
               <label for="uploadFile">사진</label> 
               <input type="file" id="uploadFile"accept="image/*" onchange="imgUp(this)" multiple="multiple">
           </div>
         <input type="submit">
        </form>
    </div>

    <div class="bg"></div>
    
    
    <script>
    const newBoard = document.getElementById('newBoard')
    const bg = document.querySelector('.bg')
    const modal = document.querySelector('#modal')
    newBoard.onclick = function(){
        modal.style.display = 'block'
        bg.style.display = 'block'
    }
    bg.onclick = function(){
        modal.style.display = 'none'
        bg.style.display = 'none'
    }
    </script>
    
<!--     이미지 올렸을때 미리보기 4개 -->
    <script>
        const uploadFile = new Array()
        
        function imgUp(upload){
           
            const file = upload.files
              for(let i=0;i<file.length;i++){
                 let flag =true
               for(let b=0;b<uploadFile.length;b++){
                  if(uploadFile[b].name==file[i].name){
                     flag=false;
                  }
               }
               if(flag){
                   uploadFile.push(file[i])
                  if(uploadFile.length<=4){
                     const img = document.createElement("img")
                      img.setAttribute("class", 'img')
                      img.src = URL.createObjectURL(file[i])
                      const image = document.querySelector('.image')
                      image.appendChild(img)
                  }else{
                         uploadFile.pop()
                         alert('4개까지 첨부');
                         break;
                       }
                       
                    }
                 }
              
        document.querySelectorAll('.img').forEach(img => img.onclick = function(e){
            e.target.style.display="none"
            const name = e.target.title         
            const index = uploadFile.indexOf(name)
            console.log(index)
            uploadFile.splice(index, 1)
            console.log(uploadFile.length)
        })
} 
</script>
    
<!--     게시글 등록 -->
    <script>
    document.forms.writeBoard.onsubmit = function(event){
        event.preventDefault()
        const writer = '${login.member_nick}'
        const content = document.getElementById("content").innerHTML
        console.log("content : " + content)
        const hashtag = document.getElementById("hashtag").innerText
        console.log("hashtag : " + hashtag)
        
        for(let i=0; i < uploadFile.length ; i++){
           console.log(uploadFile[i])
        }
        const formData = new FormData(event.target)   
        console.log("formData : "+formData)
        for(let i = 0; i < uploadFile.length; i++){
              formData.append("uploadFile", uploadFile[i]);
        }  
        formData.append("writer", writer)
        formData.append("content", content)
        formData.append("hashtag", hashtag)
        
        
        const url = "${cpath}/"
           const opt = {
              method: 'POST',
              body: formData,
           }
        fetch(url, opt)
        .then(resp => resp.text())
        .then(text => {
           console.log(text)
           if(+text == 1){
              alert("게시글을 등록하였습니다.")
              location.href = "${cpath}/"
           }else{
                alert("게시글 등록 실패하였습니다.")
              location.href = "${cpath}/"
           }
        })
        
     }
    </script>
    
<!--   해시태그 -->
    <script>
    
    function hashtag(event){
      const content =event.target.innerText.replaceAll("\n" , " ")
      const hashArea = document.getElementById("hashtag")
      let text ='';
      let splited= content.split(' ')
      hash = '';
      for(let i=0;i<splited.length;i++){
        if(i==content.lastIndexOf(" ")==content.length)
           text+=" "
         if(splited[i].indexOf('#')==-1){
            text+=splited[i]+" "
         }else{
            let splited2 =splited[i].split('#')
            for(let b=0;b<splited2.length;b++){
               if(b==0){
                  text+=splited2[b]
               }else if(b==splited2.length-1){
                     text+='<a href=" ">#'+splited2[b]+'</a>'+' '
                     hash += '<a href=" ">#'+splited2[b]+'</a>'+' '
               }else{
                      text+='<a href=" ">#'+splited2[b]+'</a>'
                     hash += '<a href=" ">#'+splited2[b]+'</a>'+' '
               }
            }
           
         }
      }
       hashArea.innerHTML = hash
      console.log(text)
      /* event.target.innerHTML=text;
      const b= window.getSelection()
     let a = event.target.innerText.length
     let c = b.anchorNode
     b.collapse(c,a) */
      
    }
    </script>
    
    
<!--     드래그 앤 드랍 -->
   <script>
   
   let dropbox;

   dropbox = document.querySelector(".image");
   dropbox.addEventListener("dragenter", dragenter, false);
   dropbox.addEventListener("dragover", dragover, false);
   dropbox.addEventListener("drop", drop, false);
   
   function dragenter(e) {
        e.stopPropagation();
        e.preventDefault();
      }

   function dragover(e) {
     e.stopPropagation();
     e.preventDefault();
   }
   
   function drop(e) {
        e.stopPropagation();
        e.preventDefault();

        const dt = e.dataTransfer;
        const files = dt.files;

        imgUp(files);
      }
   </script>