/*
    js/selector.js 파일의 내용
    
    - 웹페이지에 로딩할 javascript 를 따로 준비해 놓을 수 있다.
*/
function $(selector){
    const result=document.querySelector(selector);
    return result;
}