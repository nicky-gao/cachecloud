<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/manage/commons/taglibs.jsp"%>
<div class="row">
	<div class="col-md-12">
		<h3 class="page-title">
			机器列表
		</h3>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="portlet box light-grey">
			<div class="portlet-title">
				<div class="caption"><i class="fa fa-globe"></i>机器列表</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"></a>
				</div>
			</div>
			<div class="portlet-body">
				<table class="table table-striped table-bordered table-hover" id="tableDataList">
					<thead>
						<tr>
							<th>ip</th>
							<th>内存使用率</th>
							<th>已分配内存</th>
							<th>CPU使用率</th>
							<th>网络流量</th>
							<th>机器负载</th>
							<th>是否是虚机</th>
							<th>额外说明</th>
							<th>机房</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${machineList}" var="machine">
							<tr class="odd gradeX">
								<td>
									<a target="_blank" href="/manage/machine/machineInstances?ip=${machine.ip}">${machine.ip}</a>
								</td>
								<td>
									<span style="display:none"><fmt:formatNumber value="${machine.memoryUsageRatio / 100}" pattern="0.00"/></span>
                                          
                                          <div class="progress margin-custom-bottom0">
                                              <fmt:formatNumber var="fmtMemoryUsageRatio" value="${machine.memoryUsageRatio}" pattern="0.00"/>
                                              <c:choose>
                                                  <c:when test="${fmtMemoryUsageRatio >= 80.00}">
                                              <div class="progress-bar progress-bar-danger"
                                                           role="progressbar" aria-valuenow="${machine.memoryUsageRatio}" aria-valuemax="100"
                                                           aria-valuemin="0" style="width: ${machine.memoryUsageRatio}%">
                                                      </c:when>
                                                      <c:otherwise>
                                              <div class="progress-bar progress-bar-success"
                                                               role="progressbar" aria-valuenow="${machine.memoryUsageRatio}" aria-valuemax="100"
                                                               aria-valuemin="0" style="width: ${machine.memoryUsageRatio}%">
                                                      </c:otherwise>
                                              </c:choose>
                                                  <label style="color: #000000">
                                                      <fmt:formatNumber value="${((machine.memoryTotal-machine.memoryFree)/1024/1024/1024)}" pattern="0.00"/>G&nbsp;&nbsp;Used/
                                                      <fmt:formatNumber value="${ machine.memoryTotal/1024/1024/1024}" pattern="0.00"/>G&nbsp;&nbsp;Total
                                                  </label>
                                            </div>
                                            
								</td>
                                <td>
                                    <fmt:formatNumber var="fmtMemoryAllocatedRatio" value="${((machine.memoryAllocated)/1024)*100.0/(machine.memoryTotal/1024/1024/1024)}" pattern="0.00"/>
                                	<span  style="display:none"><fmt:formatNumber value="${fmtMemoryAllocatedRatio / 100}" pattern="0.00"/></span>
                                    <div class="progress margin-custom-bottom0">
                                        <c:choose>
                                        <c:when test="${fmtMemoryAllocatedRatio >= 80.00}">
                                        <div class="progress-bar progress-bar-danger"
                                             role="progressbar" aria-valuenow="${fmtMemoryAllocatedRatio}" aria-valuemax="100"
                                             aria-valuemin="0" style="width: ${fmtMemoryAllocatedRatio}%">
                                            </c:when>
                                            <c:otherwise>
                                            <div class="progress-bar progress-bar-success"
                                                 role="progressbar" aria-valuenow="${fmtMemoryAllocatedRatio}" aria-valuemax="100"
                                                 aria-valuemin="0" style="width: ${fmtMemoryAllocatedRatio}%">				                    		</c:otherwise>
                                                </c:choose>
                                                <label style="color: #000000">
                                                    <fmt:formatNumber value="${((machine.memoryAllocated)/1024)}" pattern="0.00"/>G&nbsp;&nbsp;Used/
                                                    <fmt:formatNumber value="${ machine.memoryTotal/1024/1024/1024}" pattern="0.00"/>G&nbsp;&nbsp;Total
                                                </label>
                                            </div>
                                        </div>
                                </td>
								<td>${machine.cpuUsage}</td>
								<td>
									<fmt:formatNumber value="${machine.traffic / 1024 / 1024}" pattern="0.00"/>M
								</td>
								<td>${machine.load}</td>
                                <td>
                                	<c:choose>
                                		<c:when test="${machine.info.virtual == 1}">
                                			是
                                			<br/>
                                			物理机:${machine.info.realIp}
                                		</c:when>
                                		<c:otherwise>
                                			否
                                		</c:otherwise>
                                	</c:choose>
                                </td>
								<td>${machine.info.extraDesc}</td>
								<td>${machine.info.room}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>