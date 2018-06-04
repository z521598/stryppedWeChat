<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="/resources/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.get("/article/all.json", function (articles) {
                var opts = "";
                for (var index in articles) {
                    opts += "<option value='" + articles[index].id + "'>" + articles[index].name + "</option>"
                }
                var selects = $("select");
                console.log(selects.length);
                for (var index in selects) {
                    var select = selects[index];
                    select.innerHTML = opts;
                }

            });
        });

        function submit() {
            var category = [];
            for (var i = 1; i <= 5; i++) {
                var checkbox = $("#pc" + i + "checkbox");
                if (!checkbox.is(':checked')) {
                    continue;
                }
                category[i] = {};
                category[i].ordernumber = i;
                category[i].name = $("#pc" + i + "name").val();
                category[i].articleid = $("#pc" + i + "articleid option:selected").val();
                category[i].childCategory = [];
                for (var j = 1; j <= 5; j++) {
                    var checkbox = $("#pc" + i + "c" + j + "checkbox");
                    if (!checkbox.is(':checked')) {
                        continue;
                    }
                    category[i].childCategory[j] = {};
                    category[i].childCategory[j].ordernumber = j;
                    category[i].childCategory[j].name = $("#pc" + i + "c" + j + "name").val();
                    category[i].childCategory[j].articleid = $("#pc" + i + "c" + j + "articleid option:selected").val();
                }
            }
            console.log(category);
            $.ajax({
                url: "/category/update",
                type: "Post",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(category),
                complete: function (data) {
                    alert(data);
                }
            });
        }
    </script>
</head>
<body>
<table border="true" style="text-align: center">
    <tr>
        <th>显示顺序</th>
        <th>一级菜单名称</th>
        <th>对应文章</th>
        <th>是否启用</th>
        <th>二级菜单操作</th>
    <tr/>
    <tr id="c1">
        <td>1</td>
        <td><input type="text" id="pc1name"/></td>
        <td>
            <select id="pc1articleid">
                <option value="1">文章1</option>
                <option value="2">文章2</option>
                <option value="3">文章3</option>
                <option value="4">文章4</option>
                <option value="5">文章5</option>
            </select>
        </td>
        <td>
            <center><input type="checkbox" id="pc1checkbox"/></center>
        </td>
        <td>
            <table border="true" style="text-align: center">
                <tr>
                    <th>显示顺序</th>
                    <th>菜单名称</th>
                    <th>对应文章</th>
                    <th>是否启用</th>
                <tr/>
                <!--1-->
                <tr>
                    <td>1</td>
                    <td><input type="text" id="pc1c1name"/></td>
                    <td>
                        <select id="pc1c1articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc1c1checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><input type="text" id="pc1c2name"/></td>
                    <td>
                        <select id="pc1c2articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc1c2checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td><input type="text" id="pc1c3name"/></td>
                    <td>
                        <select id="pc1c3articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    <td>
                        <center><input type="checkbox" id="pc1c3checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td><input type="text" id="pc1c4name"/></td>
                    <td>
                        <select id="pc1c4articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc1c4checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>5</td>
                    <td><input type="text" id="pc1c5name"/></td>
                    <td>
                        <select id="pc1c5articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc1c5checkbox"/></center>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <!--2-->
    <tr id="c2">
        <td>2</td>
        <td><input type="text" id="pc2name"/></td>
        <td>
            <select id="pc2articleid">
                <option value="1">文章1</option>
                <option value="2">文章2</option>
                <option value="3">文章3</option>
                <option value="4">文章4</option>
                <option value="5">文章5</option>
            </select>
        </td>
        <td>
            <center><input type="checkbox" id="pc2checkbox"/></center>
        </td>
        <td>
            <table border="true" style="text-align: center">
                <tr>
                    <th>显示顺序</th>
                    <th>菜单名称</th>
                    <th>对应文章</th>
                    <th>是否启用</th>
                <tr/>
                <tr>
                    <td>1</td>
                    <td><input type="text" id="pc2c1name"/></td>
                    <td>
                        <select id="pc2c1articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc2c1checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><input type="text" id="pc2c2name"/></td>
                    <td>
                        <select id="pc2c2articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc2c2checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td><input type="text" id="pc2c3name"/></td>
                    <td>
                        <select id="pc2c3articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    <td>
                        <center><input type="checkbox" id="pc2c3checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td><input type="text" id="pc2c4name"/></td>
                    <td>
                        <select id="pc2c4articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc2c4checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>5</td>
                    <td><input type="text" id="pc2c5name"/></td>
                    <td>
                        <select id="pc2c5articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc2c5checkbox"/></center>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <!--3-->
    <tr id="c3">
        <td>3</td>
        <td><input type="text" id="pc3name"/></td>
        <td>
            <select id="pc3articleid">
                <option value="1">文章1</option>
                <option value="2">文章2</option>
                <option value="3">文章3</option>
                <option value="4">文章4</option>
                <option value="5">文章5</option>
            </select>
        </td>
        <td>
            <center><input type="checkbox" id="pc3checkbox"/></center>
        </td>
        <td>
            <table border="true" style="text-align: center">
                <tr>
                    <th>显示顺序</th>
                    <th>菜单名称</th>
                    <th>对应文章</th>
                    <th>是否启用</th>
                <tr/>
                <tr>
                    <td>1</td>
                    <td><input type="text" id="pc3c1name"/></td>
                    <td>
                        <select id="pc3c1articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc3c1checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><input type="text" id="pc3c2name"/></td>
                    <td>
                        <select id="pc3c2articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc3c2checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td><input type="text" id="pc3c3name"/></td>
                    <td>
                        <select id="pc3c3articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    <td>
                        <center><input type="checkbox" id="pc3c3checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td><input type="text" id="pc3c4name"/></td>
                    <td>
                        <select id="pc3c4articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc3c4checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>5</td>
                    <td><input type="text" id="pc3c5name"/></td>
                    <td>
                        <select id="pc3c5articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc3c5checkbox"/></center>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <!--4-->
    <tr id="c4">
        <td>4</td>
        <td><input type="text" id="pc4name"/></td>
        <td>
            <select id="pc4articleid">
                <option value="1">文章1</option>
                <option value="2">文章2</option>
                <option value="3">文章3</option>
                <option value="4">文章4</option>
                <option value="5">文章5</option>
            </select>
        </td>
        <td>
            <center><input type="checkbox" id="pc4checkbox"/></center>
        </td>
        <td>
            <table border="true" style="text-align: center">
                <tr>
                    <th>显示顺序</th>
                    <th>菜单名称</th>
                    <th>对应文章</th>
                    <th>是否启用</th>
                <tr/>
                <tr>
                    <td>1</td>
                    <td><input type="text" id="pc4c1name"/></td>
                    <td>
                        <select id="pc4c1articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc4c1checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><input type="text" id="pc4c2name"/></td>
                    <td>
                        <select id="pc4c2articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc4c2checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td><input type="text" id="pc4c3name"/></td>
                    <td>
                        <select id="pc4c3articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    <td>
                        <center><input type="checkbox" id="pc4c3checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td><input type="text" id="pc4c4name"/></td>
                    <td>
                        <select id="pc4c4articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc4c4checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>5</td>
                    <td><input type="text" id="pc4c5name"/></td>
                    <td>
                        <select id="pc4c5articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc4c5checkbox"/></center>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <!--5-->
    <tr id="c5">
        <td>5</td>
        <td><input type="text" id="pc5name"/></td>
        <td>
            <select id="pc5articleid">
                <option value="1">文章1</option>
                <option value="2">文章2</option>
                <option value="3">文章3</option>
                <option value="4">文章4</option>
                <option value="5">文章5</option>
            </select>
        </td>
        <td>
            <center><input type="checkbox" id="pc5checkbox"/></center>
        </td>
        <td>
            <table border="true" style="text-align: center">
                <tr>
                    <th>显示顺序</th>
                    <th>菜单名称</th>
                    <th>对应文章</th>
                    <th>是否启用</th>
                <tr/>
                <tr>
                    <td>1</td>
                    <td><input type="text" id="pc5c1name"/></td>
                    <td>
                        <select id="pc5c1articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc5c1checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><input type="text" id="pc5c2name"/></td>
                    <td>
                        <select id="pc5c2articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc5c2checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td><input type="text" id="pc5c3name"/></td>
                    <td>
                        <select id="pc5c3articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    <td>
                        <center><input type="checkbox" id="pc5c3checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td><input type="text" id="pc5c4name"/></td>
                    <td>
                        <select id="pc5c4articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc5c4checkbox"/></center>
                    </td>
                </tr>
                <tr>
                    <td>5</td>
                    <td><input type="text" id="pc5c5name"/></td>
                    <td>
                        <select id="pc5c5articleid">
                            <option>文章1</option>
                            <option>文章2</option>
                            <option>文章3</option>
                            <option>文章4</option>
                            <option>文章5</option>
                        </select>
                    </td>
                    <td>
                        <center><input type="checkbox" id="pc5c5checkbox"/></center>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<input type="button" onClick="submit()" value="提交"/>
</body>
</html>
