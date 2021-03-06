<%@page contentType="text/html; UTF-8"  pageEncoding="UTF-8" language="java"  %>
<%@include file="common.jsp"%>

<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>医生信息</title>
    <meta charset="UTF-8">
    <base target="_self" href="<%=basePath%>">
    <link rel="stylesheet" href="css/doctor.css" />
</head>
<script src="js/jquery-1.11.2.min.js"></script>
<body>
<header class="header">
    <header id="fastTop" class="header" style="height: 100px;">
        <div class="search_box">
                <span class="logo">
                    <a href="">
                        <img src="images/logo.jpg"></a>
                </span>
            <input type="hidden" id="current-area-info" data-province="16" data-city="371" data-region="0" data-provtag="0" data-value="1">

            <div class="keyword">
                <form method="get" id="med_form" onKeyDown="if(event.keyCode==13)return false;" action="doctor/doctorList?grade=${grade}&deid=${dept.deid}" >
                    <input type="text" name="key" value = "${key}"   autocomplete="off" placeholder="请输入医院/科室/疾病/症状/医生姓名" id="search-tips-input" value="">
                    <button  onclick="$('#med_form').submit()"   type="button" class="btn-doctor" id="querySearch">搜&nbsp;索</button>
                </form>
                <div class="search-suggest-layer" style="display: none; border: 1px #eaeaea solid; margin-top: -2px; width: 466px; background-color: #fff; border-bottom-left-radius: 4px; border-bottom-right-radius: 4px; position: absolute; z-index: 1;"></div>
            </div>
        </div>
    </header>
</header>

<div class="wrap">

    <div class="container" data-accuracy="0">
        <div class="select-condition">
            <div class="select-detail" data-type="1">
                <h4>一级科室:</h4>
                <ul class="dropmenus" id="depart-level1-ul" style="margin-bottom: 10px;">
                    <li data-department-flag="1" data-value="0" id="depart0" <c:if test="${empty deid }"> class="select-cur" </c:if> data-child="1"><a href="doctor/doctorList?grade=${grade}&key=${key}">全部</a></li>
                    <c:forEach items="${deptList1}" var="dept">
                        <li data-department-flag="1" <c:if test="${deid == dept.deid }"> class="select-cur" </c:if>  id="${dept.dename}"><a href="doctor/doctorList?key=${key}&grade=${grade}&deid=${dept.deid}">${dept.dename}</a></li>
                    </c:forEach>

                </ul>

                <h4>二级科室:</h4>
                <ul class="dropmenus" id="depart-level2-ul" style="margin-bottom: 10px;">
                    <%--<li data-department-flag="1" data-value="0" id="depart0" <c:if test="${empty deid }"> class="select-cur" </c:if> data-child="1"><a href="doctor/doctorList?grade=${grade}">全部</a></li>--%>
                    <c:forEach items="${deptList2}" var="dept">
                        <li data-department-flag="1"  <c:if test="${deid == dept.deid }"> class="select-cur" </c:if>   id="${dept.dename}"><a href="doctor/doctorList?key=${key}&grade=${grade}&deid=${dept.deid}">${dept.dename}</a></li>
                    </c:forEach>
                </ul>

            </div>

            <div class="select-detail mains-doctor" data-type="3" style="border-top-width: 1px; border-top-style: dashed; border-top-color: rgb(234, 234, 234);">
                <h4>医生职称:</h4>
                <ul class="dropmenus" id="medtitle-ul">
                    <li data-value="0" id="title0" <c:if test="${empty grade}"> class="select-cur" </c:if> ><a href="doctor/doctorList?key=${key}&deid=${deid}">全部</a></li>
                    <li data-value="1" id="title1" <c:if test="${ grade==1}">class="select-cur"</c:if>  ><a href="doctor/doctorList?key=${key}&grade=1&deid=${deid}">主任医师</a></li>
                    <li data-value="1" id="title2" <c:if test="${ grade==2}">class="select-cur"</c:if> ><a href="doctor/doctorList?key=${key}&grade=2&deid=${deid}">副主任医师</a></li>
                    <li data-value="3" id="title3"<c:if test="${ grade==3}">class="select-cur"</c:if> ><a href="doctor/doctorList?key=${key}&grade=3&deid=${deid}">主治医师</a></li>
                    <li data-value="4" id="title4"<c:if test="${ grade==4}">class="select-cur"</c:if> ><a href="doctor/doctorList?key=${key}&grade=4&deid=${deid}">普通医师</a></li>
                </ul>
            </div>
        </div>
        <div class="doctor-info-box">
            <h4>符合条件的
                <label class="curdotor"><em id="doc_total">${page.totalCount}</em></label>
                名优质医生</h4>
            <ul id="doctor-info-list" class="doctor-info-list" style="display: block;">
                <c:forEach var="doctor" items="${page.data}">
                    <li class="doctor-info-single" style="border-top-width: 1px; border-right-width: 1px; border-left-width: 1px; border-style: solid solid none; border-top-color: rgb(234, 234, 234); border-right-color: rgb(255, 255, 255); border-left-color: rgb(255, 255, 255);">
                        <div class="doctor-card clearfix">
                            <div class="info-pic"><a href="doctor/detail/${doctor.did}" target="_blank">
                                <img src="${doctor.image}"></a></div>
                            <div class="infos">
                                <div class="info-title" style="margin-top: -10px"><a href="doctor/detail/${doctor.did}" target="_blank">
                                    <div>${doctor.dname}</div>
                                </a><span class="doctor-medtitle">
                                <c:choose>
                                    <c:when test="${doctor.grade == 1}">主任医师</c:when>
                                    <c:when test="${doctor.grade == 2}">副主任医师</c:when>
                                    <c:when test="${doctor.grade == 3}">主治医师</c:when>
                                    <c:when test="${doctor.grade == 4}">普通医师</c:when>
                                </c:choose>

                            </span>/<span class="doctor-title">教授，博士生导师</span><p class="info-hospittal">
                                    <span><a href="hospital/detail/${doctor.hospital.hid}" target="_blank">${doctor.hospital.hname}</a></span>
                                    <span>（${doctor.dept.dename}）</span>
                                    <table cellspacing="0" cellpadding="0">
                                        <tbody>
                                        <tr >
                                            <td class="first-td" valign="top">医院地址: </td>
                                            <td class="last-td" valign="top">${doctor.hospital.address}</td>
                                        </tr>
                                        <tr >
                                            <td class="first-td" valign="top">擅长诊治: </td>
                                            <td class="last-td" valign="top">${doctor.skill}</td>
                                        </tr>

                                        </tbody>

                                    </table>
                                    <div class="rate"><span>总推荐度：</span><div class="grade-star"><i class="star-right star-light star-fixed"></i><i class="star-right star-light star-fixed"></i><i class="star-right star-light star-fixed"></i><i class="star-right star-light star-fixed"></i><i class="star-right star-gray-light star-fixed"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="server-but fr">
                                <p><a href="doctor/detail/${doctor.did}" target="_self">预约挂号</a></p>
                            </div>
                        </div>
                    </li>
                </c:forEach>

            </ul>

            <c:if test="${empty page.data}">
                <div class="result-empty doctor-empty" style="display: block;">
                    <img src="images/no-doctor.png" class="resultimg">
                    <div class="result-text">抱歉！没有符合条件的医生</div>
                </div>
            </c:if>
        </div>
        <c:if test="${!empty page.data}">


            <div class="pagination-x pull-right" style="margin-top: 100px">
                <span class="pagers">
                    <ul class="pagination-x-list">
                        <ul>
                                <li>
                                   <a class="dropmenus" href="doctor/doctorList?pageNum=1&key=${key}&grade=${grade}&deid=${deid}" >
                                    <label>首页</label>
                                   </a>
                               </li>
                            <c:if test="${page.pageNum == 1}" >
                            <li>
                            <a class="prev-off" >
                                <label>上一页</label>
                            </a>
                            </li>
                            </c:if>
                            <c:if test="${page.pageNum != 1}">
                                <li>
                                 <a class="prev-on" href="doctor/doctorList?pageNum=${page.pageNum-1}&key=${key}&grade=${grade}&deid=${deid}">
                                    <label>上一页</label>
                                </a>
                                </li>
                            </c:if>
                                <li>
                                    <span>
                                    第${page.pageNum}页/共${page.totalPage}页
                                    </span>
                               </li>

                            <c:if test="${page.pageNum == page.totalPage}">
                               <li>
                                   <a class="next-off" >
                                    <label>下一页</label>
                                   </a>
                               </li>
                            </c:if>
                           <c:if test="${page.pageNum != page.totalPage}">
                           <li>
                           <a class="next-on" href = "doctor/doctorList?pageNum=${page.pageNum+1}&key=${key}&grade=${grade}&deid=${deid}">
                                <label>下一页</label>
                           </a>
                            </li>
                           </c:if>
                                <li>
                                   <a class="dropmenus" href="doctor/doctorList?pageNum=${page.totalPage}&key=${key}&grade=${grade}&deid=${deid}">
                                    <label>末页</label>
                                   </a>
                               </li>
                        </ul>
                    </ul>
                </span>
            </div>
        </c:if>


    </div>


    <input type="hidden" id="search-tag" value=""><aside class="right-sidebar">
    <article class="broad" style="border-bottom: none; margin-bottom: 0px;">
        <h1 class="title">挂号规则</h1>
        <div class="ct">
            <p class="depics"><b class="sq">1.</b>每日8:00左右更新后一天号源</p>
            <p class="depics"><b class="sq">2.</b>可预约当天和未来2周号源</p>
            <p class="depics"><b class="sq">3.</b>请参考短信提示，到医院就诊</p>
            <p class="depics"><b class="sq">4.</b>就诊前一天16:00前，到“平顶山预约挂号平台”&gt;“我的预约”，可取消预约</p>
            <p class="depics"><b class="sq">5.</b>如需帮助，可拨打客服4000-xxx-xxx(10:00-18:00)</p>
        </div>
    </article>
    <article class="broad" style="margin-bottom: 0px;">
        <h1 class="title">帮助中心</h1>
        <div class="ct">
            <p class="depics"><b class="sq">1.</b><a target="_blank" href="#">如何注册账号？</a></p>
            <p class="depics"><b class="sq">2.</b><a target="_blank" href="#">如何选择医生？</a></p>
            <p class="depics"><b class="sq">3.</b><a target="_blank" href="#">如何预约医生？</a></p>
            <p class="depics"><b class="sq">4.</b><a target="_blank" href="#">如何评价医生？</a></p>
            <a class="more" target="_blank" href="#">查看更多&gt;</a>
        </div>
    </article>


</aside>
    <div class="result-empty hospital-empty" style="display: none;">
        <img src="images/no-hospital.png" class="resultimg"><div class="result-text">抱歉！没有符合条件的医院</div>
    </div>
</div>



<footer id="footer-three" class="footer-box footer-three clear path" data-src="http://dpp.bdimg.com/static/pc/201604261639/asset" data-href="" data-api="http://yi.baidu.com" data-passport="https://passport.baidu.com">
    <div class="footer-con">
        <div class="footer-info-url">
            <dd class="fo-link">
                <a href="#" target="_blank"><span>帮助</span>|</a>
                <a href="#" target="_blank"><span>用户协议</span>|</a>
                <a href="#" target="_blank"><span>意见反馈</span></a>
                <a href="#" target="_blank"><span>©2022 KasumiUtako &nbsp;&nbsp;隐私条款</span></a>
            </dd>
        </div>
    </div>
</footer>


<script type="text/javascript">

</script>
</body>
</html>


