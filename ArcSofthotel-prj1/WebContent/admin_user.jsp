<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":"
        + request.getServerPort() + request.getContextPath() + "/"; %>

<!Doctype html>
<html>
    <head>
        <base href="<%=basePath%>">
        <title>用户管理</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/js/jquery-ui/jquery-ui.min.css">
        <script src="./assets/js/jquery-3.3.1.min.js"></script>
        <script src="./assets/js/jquery.serializejson.min.js"></script>
        <script src="./assets/js/jquery-ui/jquery-ui.min.js"></script>
        
    </head>
    <style>
    body
    {
	background-color:Azure;}
	h1{background-color:#F0FFFF	;}
	p{background-color:rgb(240,255,255);
	}
	body {
	     	margin-left: 0px;
	       	margin-top: 0px;
      		margin-right: 0px;
       		margin-bottom: 0px;
		}
		
		div.index{
			position:relative;
			width: 100%;
			height: 14rem;
		}
		
		a:hover{
			text-decoration:none;
			color:greenyellow;
		}
		
		.mybtn{
			 width: 12rem;
			 height: 100%;
			 background:green;
			 color: #F9F9F9;
			 text-align: center;
			 margin-right:4cm;
			 line-height: 35px;
			 float:right;
		}
		
		.mybtn:hover{
			background: pink;
		}
		
		
		#preview {
						border: 1px solid #ccc;
						width: 50%;
						height: 200px;
						background-size: contain;
						background-repeat: no-repeat;
						background-position: center center;
					}
    </style>
    <body>
    <div class="index" id="backimg">
		<div style="width: 100%;height: 27.8%;">
			<div style="margin-left:0cm;line-height: 35px;float:left;">✉ARCSOFTHOTEL@gmail.com</div>
			<div style="margin-left:1cm;line-height: 35px;float:left;">☎623-1234</div>
			<div style="width: 8rem;height: 100%;float:right;margin-right:0cm;line-height: 35px;text-align: center;color: #000000;border:1px solid #ddd;">
			    <a href = "register.jsp" >注册</a>
			</div>
			<div class="mybtn">Book A Room</div>
		</div>
		<div style="width: 100%;height: 72.2%;background: Beige;border-bottom: 8px solid rgba(0,0,0,0.06);">
			<div style="width:35%;height: 50%;text-align: center;position:relative;top: 1rem;left: 50rem;">
				<span style="font-size: 2.5rem;">欢迎来到虹软酒店</span>
			</div>
			<div style="width:35%;height: 30%;text-align: center;position:relative;top: 1.3rem;left: 50rem;">
				<span style="font-size: 1rem;">加入我们屡获殊荣的忠诚计划，享受专属礼遇与奖励。</span>
			</div>
		</div>
	</div>

        <!-- 用户列表 -->
        <div class="tbl-title">用户列表</div>
        <div style="width:100%;height: 110rem;border:5px solid #B92C28;">
        <button onclick="showAddUserModal()">添加新的用户</button>
        <table id="users" class="tbl-list">
            <thead>
            <tr>
                <th>用户名</th>
<%--                <th>照片</th>--%>
                <th>密码</th>
                <th>姓名</th>
                <th>电话</th>
                <th>身份证</th>
                <th>照片</th>
                <th>入住时间</th>
                <th>退房时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        </div>>

        <!-- 添加用户模态框 -->
        <div id="add-user-modal" title="添加用户" style="display:none;">
            <form id="add-user-form">
                <table class="modal-tbl">
                    <tr>
                        <td>用户名</td>
                        <td><input type="text" name="userId"></td>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td><input type="password" name="password"></td>
                    </tr>
                    <tr>
                        <td>姓名</td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td>电话</td>
                        <td><input type="tel" name="phone"></td>
                    </tr>
                    <tr>
                        <td>身份证</td>
                        <td><input type="text" name="documentnumber"></td>
                    </tr>
                    <tr>
                        <td>人脸照片</td>
                        <td>
                            <input type="text" name="face" id="face">
                            <input type="button" value="浏览文件"
                                   style="border-radius: 0; border-left: 0;"
                                   onclick="$('#file').click();">
                            <input type="file" id="file" accept=".png, .jpg, .jpeg" style="display: none">
                        </td>
                    </tr>
                    <tr>
                        <td>入住时间</td>
                        <td><input type="date" name="checkin_date"></td>
                    </tr>
                    <tr>
                        <td>退房时间</td>
                        <td><input type="date" name="checkout_date"></td>
                    </tr>
                </table>
            </form>
        </div>

        <!--删除用户对话模态框 -->
        <div id="delete-user-modal" title="删除用户" style="display:none;">
            <p>确定删除该用户吗？</p>
        </div>

        <!-- 更新用户模态框 -->
        <div id="update-user-modal" title="更新用户" style="display:none;">
            <form id="update-user-form">
                <table class="modal-tbl">
                    <tr style="display: none">
                        <td>用户名</td>
                        <td><input type="text" name="userId"></td>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td><input type="password" name="password"></td>
                    </tr>
                    <tr>
                        <td>姓名</td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td>电话</td>
                        <td><input type="tel" name="phone"></td>
                    </tr>
                    <tr>
                        <td>身份证</td>
                        <td><input type="text" name="documentnumber"></td>
                    </tr>
                    <tr>
                        <td>人脸照片</td>
                        <td>
                            <input type="text" name="face" id="face2">
                            <input type="button" value="浏览文件"
                                   style="border-radius: 0; border-left: 0;"
                                   onclick="$('#file2').click();">
                            <input type="file" id="file2" accept=".png, .jpg, .jpeg" style="display: none">
                        </td>

                    </tr>
                    <tr>
                        <td>入住时间</td>
                        <td><input type="date" name="checkin_date"></td>
                    </tr>
                    <tr>
                        <td>退房时间</td>
                        <td><input type="date" name="checkout_date"></td>
                    </tr>

                </table>
            </form>
        </div>

        <!-- 提示信息模态框 -->
        <div id="msg-modal" title="" style="display:none">
            <p></p>
        </div>

        <script>
            // 开始
            $(function () {
                listAllUser();
            });


            // 显示所有用户
            function listAllUser() {
                $.ajax({
                    type: "GET",
                    url: "UserServlet?action=listAll",
                    dataType: "json",
                    success: function (data) {
                        $("#users tbody").empty();  // 每次载入前先清空显示区域，防止数据重复显示
                        var users = data.users;
                        for (var i in users) {
                            var user = users[i];
                            var userStr = JSON.stringify(user);
                            $("#users tbody").append('<tr><td>' + user.userId + '</td>'
                                // + '<td> <img style="width: 100px;height: 100px;" src="uploads/' + user.face + '" alt=""></td>'
                                + '<td>' + user.password + '</td>'
                                + '<td>' + user.name + '</td>'
                                + '<td>' + user.phone + '</td>'
                                + '<td>' + user.documentnumber + '</td>'
                                + '<td>' + user.face + '</td>'
                                + '<td>' + user.checkin_date + '</td>'
                                + '<td>' + user.checkout_date + '</td>'
                                + '<td><button onclick=\'showUpdateUserModal(' + userStr + ')\'>更新</button> '
                                + '<button onclick="deleteUser(\'' + user.userId + '\')">删除</button></td></tr>');
                        }
                    },
                    error: function () {
                        console.log("ajax error");
                    }
                });
            }

            // 显示添加用户模态框
            function showAddUserModal() {
                $("#add-user-form")[0].reset();  // 每次载入前先清空表单，防止显示之前的信息
                $("#add-user-modal").dialog({
                    resizable: false,
                    modal: true,
                    buttons: {
                        "添加": function () {
                            addUser();
                        },
                        "取消": function () {
                            $(this).dialog("close");
                        },
                    },
                });
            }

            // 添加用户
            function addUser() {
                // 获取序列化表单信息
                var user = $("#add-user-form").serializeJSON();
                var userStr = JSON.stringify(user);

                $.ajax({
                    type: "POST",
                    url: "UserServlet",
                    data: userStr,
                    dataType: "json",
                    success: function (data) {
                        if (data.isSuccess) {
                            $("#add-user-modal").dialog("close");
                            showMsg('添加成功！');
                            listAllUser();
                        } else {
                            $("#add-user-modal").dialog("close");
                            showMsg('添加失败！');
                            listAllUser();
                        }
                    },
                    error: function () {
                        console.log("ajax error");
                    },
                });
            }

            // 删除用户
            function deleteUser(id) {
                // 将id封装为JSON格式数据
                var data = {};
                data.userId = id;
                var dataStr = JSON.stringify(data);
                // 显示删除用户模态框
                $("#delete-user-modal").dialog({
                    resizable: false,
                    modal: true,
                    buttons: {
                        "确认": function () {
                            $.ajax({
                                type: "DELETE",
                                url: "UserServlet",
                                data: dataStr,
                                dataType: "json",
                                success: function (data) {
                                    if (data.isSuccess) {
                                        $("#delete-user-modal").dialog("close");
                                        showMsg('删除成功！');
                                        listAllUser();
                                    } else {
                                        $("#delete-user-modal").dialog("close");
                                        showMsg('删除失败！');
                                        listAllUser();
                                    }
                                },
                                error: function () {
                                    console.log("ajax error");
                                },
                            });
                        },
                        "取消": function () {
                            $(this).dialog("close");
                        },
                    },
                });
            }

            //显示更新用户模态框
            function showUpdateUserModal(user) {
                $("#update-user-form")[0].reset();  // 每次载入前先清空表单，防止显示之前的信息
                // 表单赋值
                $("#update-user-form input[name='userId']").val(user.userId);
                $("#update-user-form input[name='password']").val(user.password);
                $("#update-user-form input[name='name']").val(user.name);
                $("#update-user-form input[name='phone']").val(user.phone);
                $("#update-user-form input[name='documentnumber']").val(user.documentnumber);
                $("#update-user-form input[name='face']").val(user.face);
                $("#update-user-form input[name='checkin_date']").val(user.checkin_date);
                $("#update-user-form input[name='checkout_date']").val(user.checkout_date);

                $("#update-user-modal").dialog({
                    resizable: false,
                    modal: true,
                    buttons: {
                        "提交": function () {
                            updateUser();
                        },
                        "取消": function () {
                            $(this).dialog("close");
                        },
                    },
                });
            }

            // 更新用户
            function updateUser() {
                // 获取序列化表单信息
                var user = $("#update-user-form").serializeJSON();
                var userStr = JSON.stringify(user);

                $.ajax({
                    type: "PUT",
                    url: "UserServlet",
                    data: userStr,
                    contentType: 'application/json;charset=utf-8',
                    dataType: "json",
                    success: function (data) {
                        if (data.isSuccess) {
                            $("#update-user-modal").dialog("close");
                            showMsg('更新成功！');
                            listAllUser();
                        } else {
                            $("#update-user-modal").dialog("close");
                            showMsg('更新失败！');
                            listAllUser();
                        }
                    },
                    error: function () {
                        console.log("ajax error");
                    },
                });
            }

            //显示提示信息
            function showMsg(text) {
                $("#msg-modal p").text(''); // 每次载入前先清空显示区域，防止显示之前的信息
                $("#msg-modal p").text(text);
                $("#msg-modal").dialog({
                    modal: true,
                });
                // 2s后消失
                setTimeout(function () {
                    $("#msg-modal").dialog("close")
                }, 2000);
            }


            // 添加图片上传
            $('body').on('change', '#file', function () {
                var formData = new FormData();
                var files = $($(this))[0].files[0];
                formData.append("file", files);
                $.ajax({
                    url: 'UploadServlet',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    dataType: 'text',
                    success: function (res) {
                        console.log(res);
                        if (res != "") {
                            alert('上传成功');
                        }
                        $('#face').val(res);
                    }
                    , error: function (res) {
                        // alert('错误');
                    }
                });
            })

            // 更新文件上传
            $('body').on('change', '#file2', function () {
                var formData = new FormData();
                var files = $($(this))[0].files[0];
                formData.append("file", files);
                $.ajax({
                    url: 'UploadServlet',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    dataType: 'text',
                    success: function (res) {
                        console.log(res);
                        if (res != "") {
                            alert('上传成功');
                        }
                        $('#face2').val(res);
                    }
                    , error: function (res) {
                        // alert('错误');
                    }
                });
            })
        </script>
    </body>
    <div style="float:left;width:100%;height: 8rem;background-color: #204D74;border:5px solid #B92C28;">
		<div style="width:33.3%;height: 50%;color: white;border:1px solid #1B6D85;float: left;position:relative;top: 2.5rem;left: 5rem;">
			<span>Privecy Policy Terms & Condition Cookies</span>
		</div>
		<div style="width:33.3%;height: 50%;color: white;border:1px solid #1B6D85;float: right;position:relative;top: 2.5rem;right: 5rem;">
			<span>© 2020 Venom. All rights reserved</span>
		</div>
	</div>
</html>
