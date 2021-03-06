<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<link href="<%=request.getContextPath()%>/js/z-tree/css/demo.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/js/z-tree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
<jsp:include page="/black/include/header.jsp" flush="false"></jsp:include>
<body class="p-statistical p-statistics-addmember">
	<div class="wrapper">
		<jsp:include page="/black/include/top.jsp" flush="true"></jsp:include>
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/My97DatePicker/WdatePicker.js"></script>
		<jsp:include page="/black/include/left.jsp" flush="true"></jsp:include> 
	
	<div class="content">
        <div class="crumb">
            <h5>系统设置 >> 系统通知</h5>
        </div>
         	<div class="content-container">
            <div class="row">
                <div class="col-md-12" role="main">
                    <h3 class="current-tit">
                    
	                    	  <c:choose>
                    	<c:when test="${ifcheck==1}">
	                    	<span onclick="location.href='<%=request.getContextPath() %>/system/statistic/getNewMemberStatistics?ifcheck=1'" style="display:inline-block;padding:0 8px 4px 3px;height:26px;border-bottom:2px solid #1badf2;text-decoration: none;width: 210px;text-align: center;cursor: pointer;">会员统计(当月每日)</span>
		                    <span onclick="location.href='<%=request.getContextPath() %>/system/statistic/getNewMemberStatistics?ifcheck=2'" style="display:inline-block;padding:0 8px 4px 3px;height:26px;border-bottom:0px solid #1badf2;text-decoration: none;width: 210px;text-align: center;cursor: pointer;">会员统计(当月每周)</span>
		                    <span onclick="location.href='<%=request.getContextPath() %>/system/statistic/getNewMemberStatistics?ifcheck=3'" style="display:inline-block;padding:0 8px 4px 3px;height:26px;border-bottom:0px solid #1badf2;text-decoration: none;width: 210px;text-align: center;cursor: pointer;">会员统计(当年每月)</span>
                    	</c:when>
                    	<c:when test="${ifcheck==2}">
                    		<span onclick="location.href='<%=request.getContextPath() %>/system/statistic/getNewMemberStatistics?ifcheck=1'" style="display:inline-block;padding:0 8px 4px 3px;height:26px;border-bottom:0px solid #1badf2;text-decoration: none;width: 210px;text-align: center;cursor: pointer;">会员统计(当月每日)</span>
		                    <span onclick="location.href='<%=request.getContextPath() %>/system/statistic/getNewMemberStatistics?ifcheck=2'" style="display:inline-block;padding:0 8px 4px 3px;height:26px;border-bottom:2px solid #1badf2;text-decoration: none;width: 210px;text-align: center;cursor: pointer;">会员统计(当月每周)</span>
		                    <span onclick="location.href='<%=request.getContextPath() %>/system/statistic/getNewMemberStatistics?ifcheck=3'" style="display:inline-block;padding:0 8px 4px 3px;height:26px;border-bottom:0px solid #1badf2;text-decoration: none;width: 210px;text-align: center;cursor: pointer;">会员统计(当年每月)</span>
                    	</c:when>
                    	<c:when test="${ifcheck==3}">
                    		<span onclick="location.href='<%=request.getContextPath() %>/system/statistic/getNewMemberStatistics?ifcheck=1'" style="display:inline-block;padding:0 8px 4px 3px;height:26px;border-bottom:0px solid #1badf2;text-decoration: none;width: 210px;text-align: center;cursor: pointer;">会员统计(当月每日)</span>
		                    <span onclick="location.href='<%=request.getContextPath() %>/system/statistic/getNewMemberStatistics?ifcheck=2'" style="display:inline-block;padding:0 8px 4px 3px;height:26px;border-bottom:0px solid #1badf2;text-decoration: none;width: 210px;text-align: center;cursor: pointer;">会员统计(当月每周)</span>
		                    <span onclick="location.href='<%=request.getContextPath() %>/system/statistic/getNewMemberStatistics?ifcheck=3'" style="display:inline-block;padding:0 8px 4px 3px;height:26px;border-bottom:2px solid #1badf2;text-decoration: none;width: 210px;text-align: center;cursor: pointer;">会员统计(当年每月)</span>
                    	</c:when>
                    </c:choose>
                    
                    </h3>
                    <div class="row area-list-dec">
                     <div class="area-search">
                            <form class="form-inline" method="post" role="form" action="<%=request.getContextPath()%>/system/statistic/getNewMemberStatistics?ifcheck=${ifcheck}">
                                <span>分销渠道：</span>
                                <div class="form-input" style="margin-left:30px;">
                                 	  <input type="text" name="agencyname" id="agency_parent_name"  value="${map.agencyname}" class="form-control parsley-validated" readonly="readonly" style="cursor: pointer;">
					                  <input type="hidden" name="agencyid" id="parentid" value="${map.agencyid}"/>
					                  <ul id="treeDemo"  class="ztree" style="margin-top:0; width:80%;position: absolute;z-index: 999999;height: auto;display:none;width:260px"></ul>
                                  </div>     
                                <div class="form-search-sub" style="margin-left:30px;">     
                                <button type="submit" class="btn btn-default"  style="margin-left:30px;"><i class="ico-report"></i>查询</button>
                                </div>
                            </form>
                     </div>
                        
                    </div>
                    <div class="table-responsive">
                             <div id="echarts_one" style="width: 100%;height: 385px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
<script type="text/javascript">
var setting = {
		view: {
			dblClickExpand: false,
			expandSpeed: "fast",
			fontCss : {color:"black"},
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable: true,
				idKey: "id",
				pIdKey: "pId",
				rootPId: 0
			}
		},
		callback: {
			/* beforeClick: beforeClick, */
			onClick: onClick
		}
	};
	var dataArray = new Array();
	<c:if test="${ifmanager==1}">   
		dataArray.push(obj={
		  userid:'',id:-1,pId:0,name:"平台"
	   });
	</c:if>
	 <c:choose>
	  <c:when test="${dataList1.size()>0}">
	  <c:forEach items="${dataList1}" var ="row">
	       var  obj ={
	    	userid:'${row.userid}',
	        id:'${row.agencyid}',
	        pId:'${row.parentid}',
	        name:'${row.agencyname}',
	        agencytype:'${row.agencytype}'
	       };
	        dataArray.push(obj);
	    </c:forEach>
	  </c:when>
	 </c:choose>
	 var zNodes = dataArray;

		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			v = "";
			id ="";
			userid="";
			nodes.sort(function compare(a,b){return a.id-b.id;});
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
				id+= nodes[i].id + ",";
				userid+= nodes[i].userid + ",";
			}
			if (v.length > 0 ) 
			v = v.substring(0, v.length-1);
			id = id.substring(0, id.length-1);
			userid= userid.substring(0, userid.length-1);
			var cityObj = $("#agency_parent_name");
			cityObj.attr("value", v);
			$("#parentid").val(userid);
			$("#treeDemo").hide();
		}

$(document).ready(function(){
	<c:if test="${dataList1.size()>0}">
		$('#agency_parent_name').click(function(){
			$("#treeDemo").toggle();
		});
	</c:if>
	$.fn.zTree.init($("#treeDemo"), setting, zNodes);

})
function AgencyChange(obj){
	if($(obj).val() != ''){
		$.ajax({   
			url:'<%=request.getContextPath() %>/system/getAgencyData?parentid_v='+$(obj).val(), 
			type:'post',
			dataType:'json',  
			success:function(data){
				$('select[name="salerid"]').html();  
				var str = "";
				$.each(data.data,function(i,item){ 
					str += "<option value="+item.userid+">"+item.agencyname+"</option>";   			
				});           
				$('select[name="salerid"]').append(str);    
				$('select[name="salerid"]').select2('val','${map.salerid}');
			} 
		});
	} 
}
$('select[name="agencyid"]').change();   


 $(function(){
	 $('#agencyid').select2({
		    maximumSelectionSize : 1,                               // 限制数量
	});
	 $('#salerid').select2({
		    maximumSelectionSize : 1,                               // 限制数量
	});
 });
	
 require.config({
	    paths: {
	        echarts: 'http://echarts.baidu.com/build/dist'
	    }
	});

	// 使用
	require(
	    [
	        'echarts',
	        'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
	    ],
	    function (ec) {
	    	var dataArray = new Array() ;
	    	var dataArraycount = new Array() ;
	    	<c:forEach items="${dataList }" var="item" varStatus="count">
	    		dataArray[${count.index }]='${item.comparetime }';
	    		dataArraycount[${count.index }]='${item.countnum }';
	    	</c:forEach>	
		option = {
			    title : {
			        text: '新增会员统计',
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['新增会员统计']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['bar', 'line']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            data : dataArray
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'新增会员统计',
			            type:'line',
			            data:dataArraycount,
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            }
			        }
			    ]
			};
		var myChart_Bar = echarts.init(document.getElementById("echarts_one")).setOption(option);
		
		var ecConfig = require('echarts/config');    
		 myChart_Bar.on(ecConfig.EVENT.CLICK, function (param) {  
			 var temp1="";  
			 var temp2="";
		        for(var i in param){

		        	//alert(i+'------'+eval("param."+i))      
		        	if(i == 'name'){ 
		        		temp1 = eval("param."+i);     
		        	}
		        	if(i == 'dataIndex'){
		        		temp2 = eval("param."+i); 
		        	}
		           // temp += i+":"+eval("param."+i)+"\n";

		        }    
		       // alert(temp1 + ' ' + temp2);     
		        $('input[name="index"]',$('#v_form')).val(temp2);    
		        $('input[name="name"]',$('#v_form')).val(temp1);    
		        $('#v_form').submit(); 
		    });   
	    })
	  </script>
	  <form action="<%=request.getContextPath() %>/system/addmembers" id="v_form" method="post">
	  	<input type="hidden" value="${ifcheck }" name="ifcheck"> 
	  	<input type="hidden" name="name">
	  	<input type="hidden" name="index">  
	  	<input type="hidden" value="${map.salerid}" name="salerid">
	  	<input type="hidden" value="${map.agencyid}" name="agencyid"> 
	  </form>

 
</body>
</html>