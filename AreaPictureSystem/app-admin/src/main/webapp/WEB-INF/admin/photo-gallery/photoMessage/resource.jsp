<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="en" class="app">
<style>
    p{
        height: 15px;
    }

</style>

<body>
<!-- 资源管理模块 -->
<div class="col-lg-9 animated fadeInRight">
    <div class="mail-box-header">

        <!-- 创建子文件夹 -->
        <div class="pull-right mail-search">
            <div class="input-group">
                <div class="input-group-btn" style="width: 0%">
                    <!--
                    <button type="submit" class="btn btn-sm btn-primary">
                        创建子文件夹
                    </button>-->

                    <button type="submit" class="btn btn-sm btn-primary">
                        全选
                    </button>

                </div>
            </div>
        </div>

        <c:choose>
            <c:when test="${not empty fa}">
                <h2>${fa.forderActivityName}</h2>
            </c:when>
            <c:otherwise>
                <h3>
                    请先： 选择活动 或 创建活动
                </h3>
            </c:otherwise>
        </c:choose>
        <!-- 管理 菜单 按扭  -->
        <div class="mail-tools tooltip-demo m-t-md">
            <!--当用户选择活动后，显示操作按扭-->
            <c:if test="${not empty sessionScope.checkActivityId}">
                <a data-toggle="modal"  href="form_basic.html#modal-form">
                    <button  class="btn btn-success " type="button"><i class="fa fa-upload">
                    </i>&nbsp;&nbsp;<span class="bold">上传图片</span>
                    </button>
                </a>
                <!--
                <button class="btn btn-info " type="button"><i class="fa fa-paste"></i> 编辑</button>
                -->

                <button class="btn btn-danger " type="button"><i class="fa fa-warning">
                </i><span class="bold">批量删除</span>
                </button>

                <button class="btn btn-primary " type="button"><i class="fa fa-check"></i>&nbsp;下载</button>


                <button class="btn btn-warning " type="button"><i class="fa fa-heart">
                </i> 收藏
                </button>
            </c:if>

        </div>
    </div>






    <!-- 资源内容展示 -->
    <div class="mail-box">
        <div>
            <!--  gallery 相册弹出层-->
            <div class="col-lg-12 gallery" >
                <ul style="display: initial;">
                    <c:forEach items="${listPhoto.datas}" var="item" varStatus="status">
                        <li><a target="_blank" href="${pageContext.request.contextPath}/file/getImg/${item.id}?type=">
                            <div class="file-box" >
                                <div class="file">
                                    <span class="corner"></span>

                                    <div id="item_4"  class="item image" style="height: 130px;text-align: center;">
                                        <img alt="image" class="img-responsive" style="margin: 0 auto;"
                                             src="${pageContext.request.contextPath}/file/getImg/${item.id}?type=min">
                                        <div class="tooltip_description" style="display:none" title="相机、图片信息">
                                            <!-- 图片信息-->
                                              <c:choose>
                                                  <c:when test="${empty item.editorImgInfo}">
                                                      <p style="text-align: center;">
                                                          未添加描述信息，请点 "描述" 管理 ....
                                                      </p>
                                                  </c:when>
                                                  <c:otherwise>
                                                      <!--名称-->
                                                      <c:if test="${not empty item.editorImgInfo.resourceName}">
                                                          <p>
                                                              <span style="float: left;">资源名称:
                                                                    <c:choose>
                                                                        <c:when test="${fn:length(item.editorImgInfo.resourceName)<15}">
                                                                            ${item.editorImgInfo.resourceName}
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            ${fn:substring(item.editorImgInfo.resourceName,0,15)}...
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                              </span>
                                                          </p>
                                                      </c:if>
                                                      <!--被拍摄者、摄影者-->
                                                      <c:if test="${not empty item.editorImgInfo.person}">
                                                          <p>
                                                              <span style="float:left;">被拍摄者:
                                                                      ${item.editorImgInfo.person}
                                                              </span>
                                                              <span style="float: right;padding-right: 10px;">
                                                                  摄影者: ${item.editorImgInfo.photographer}
                                                              </span>
                                                          </p>
                                                      </c:if>

                                                      <!--资源地址-->
                                                      <c:if test="${not empty item.editorImgInfo.resourceAddress}">
                                                          <p>
                                                              <span style="float: left;">拍摄地址:

                                                                  <c:choose>
                                                                      <c:when test="${fn:length(item.editorImgInfo.resourceAddress)<15}">
                                                                          ${item.editorImgInfo.resourceAddress}
                                                                      </c:when>
                                                                      <c:otherwise>
                                                                          ${fn:substring(item.editorImgInfo.resourceAddress,0,15)}...
                                                                      </c:otherwise>
                                                                  </c:choose>

                                                              </span>
                                                          </p>
                                                      </c:if>
                                                      <!--资源地址-->
                                                      <c:if test="${not empty item.editorImgInfo.description}">
                                                          <p>
                                                              <span style="float: left;">内容描述:

                                                               <c:choose>
                                                                   <c:when test="${fn:length(item.editorImgInfo.description)<15}">
                                                                       ${item.editorImgInfo.description}
                                                                   </c:when>
                                                                   <c:otherwise>
                                                                       ${fn:substring(item.editorImgInfo.description,0,15)}...
                                                                   </c:otherwise>
                                                               </c:choose>

                                                              </span>
                                                          </p>
                                                      </c:if>
                                                  </c:otherwise>

                                              </c:choose>

                                            <hr style="height:1px;border:none;border-top:1px solid #c7c7c7;" />
                                            <!-- 相机信息-->
                                            <c:choose>
                                                <c:when test="${empty item.imgInfoBean}">
                                                    <p style="text-align: center;">
                                                        图片信息加工处理中，请稍后....
                                                    </p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p>
                                                        <span style="float:left;">高度: ${item.imgInfoBean.imgHeight}</span>
                                                        <span style="float: right;padding-right: 10px;">宽度: ${item.imgInfoBean.imgWidth}</span>
                                                    </p>
                                                    <!-- 相机、型号-->
                                                    <c:if test="${not empty item.imgInfoBean.make &&
                                                          not empty item.imgInfoBean.model}">
                                                        <p>
                                                            <span style="float:left;">相机: ${item.imgInfoBean.make} </span>
                                                            <span style="float: right;padding-right: 10px;">型号: ${item.imgInfoBean.model}</span>
                                                        </p>
                                                    </c:if>
                                                    <!-- 检查闪光，模式 -->
                                                    <c:if test="${not empty item.imgInfoBean.flashMode &&
                                                          not empty item.imgInfoBean.easyShooting}">
                                                        <p>
                                                            <span style="float:left;">闪光: ${item.imgInfoBean.flashMode}</span>
                                                            <span style="float: right;padding-right: 10px;">模式: ${item.imgInfoBean.easyShooting}</span>
                                                        </p>
                                                    </c:if>
                                                    <!-- 检查 纬度，经度 -->

                                                    <c:if test="${not empty item.imgInfoBean.latitude &&
                                                            not empty item.imgInfoBean.longitude}">
                                                        <p>
                                                            <span style="float:left;">纬度: ${item.imgInfoBean.latitude}</span>
                                                            <span style="float: right;padding-right: 10px;">经度: ${item.imgInfoBean.longitude}</span>
                                                        </p>
                                                    </c:if>

                                                    <p>
                                                        <span style="float:left;">大小: ${item.imgInfoBean.imgSize} MB</span>
                                                    </p>
                                                    <p>
                                                        <span style="float: left;">名称: ${item.imgInfoBean.imgName}</span>
                                                    </p>
                                                    <p >
                                                        <span style="float:left;">拍摄时间: ${item.imgInfoBean.dateTime}</span>
                                                    </p>

                                                </c:otherwise>
                                            </c:choose>


                                        </div>


                                    </div>


                                    <div class="file-name" style="text-align: center;">
                                        <!--如果修改后的资源名称不为空-->

                                        <c:choose>
                                            <c:when test="${fn:length(item.originalName)<15}">
                                                ${item.originalName}
                                            </c:when>
                                            <c:otherwise>
                                                ${fn:substring(item.originalName,0,15)}...
                                            </c:otherwise>
                                        </c:choose>

                                        <br/>
                                        <small>
			                                                <span>
                                                                <a onclick="updateImg('${item.id}','${item.editorImgInfo.resourceName}','${item.editorImgInfo.person}',
                                                                        '${item.editorImgInfo.photographer}','${item.editorImgInfo.resourceAddress}',
                                                                        '${item.editorImgInfo.description}')"
                                                                   data-toggle="modal" data-target="#File_Made">
                                                                    描述
                                                                </a>
			                                                </span>
                                            <span style="padding-left: 10%;">
                                                                    <a onclick="deleteAlert('${item.id}','${sessionScope.checkActivityId}')">
                                                                    删除 </a>
			                                                </span>
                                        </small>
                                    </div>


                                </div>
                            </div>
                        </a></li>
                    </c:forEach>
                </ul>
            </div>

            <!-- 分页功能 -->
            <div style="text-align: center;margin-bottom: 5px;">
                <c:if test="${not empty listPhoto.datas}">
                    <div class="btn-group" style="margin: 0 auto;">
                        <a href="${pageContext.request.contextPath}/photoMessageAction/checkActivity?checkId=${sessionScope.checkActivityId}&type=${type}&pageNo=${listPhoto.upPage}" type="button" class="btn btn-white">
                            <i class="fa fa-chevron-left"></i>
                        </a>

                        <c:forEach items="${listPhoto.navigatepageNums}" var="nav">
                            <c:choose>
                                <c:when test="${nav == newslist.pageNo}">
                                    <a class="btn btn-white  active">${nav}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/photoMessageAction/checkActivity?checkId=${sessionScope.checkActivityId}&type=${type}&pageNo=${nav}"
                                       class="btn btn-white">${nav}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <a href="${pageContext.request.contextPath}/photoMessageAction/checkActivity?checkId=${sessionScope.checkActivityId}&type=${type}&pageNo=${listPhoto.nextPage}" type="button" class="btn btn-white">
                            <i class="fa fa-chevron-right"></i>
                        </a>
                    </div>
                </c:if>
            </div>
        </div>

    </div>
</div>

</body>
</html>
