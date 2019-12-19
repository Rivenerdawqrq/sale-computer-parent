



//悬停0.8秒显示图片
function imageFours(timeout){
    var seed;
    var img = $("#image");
    $(".displayImage").on('mouseenter',function () {
        var x = event.clientX + document.body.scrollLeft + 20;
        var y = event.clientY + document.body.scrollTop - 5;
        var id = $(this).attr('data-cid');
      setTimeout(function () {
          $.ajax({
              method:"GET",
              url:"/admin/image?id="+id
          }).done(function (res) {
              seed = setTimeout(function () {
                  img.css("left",x+"px");
                  img.css("top",y+"px");
                  img.css("display","block");
                  img.html(null);
                  img.append(res);
              },timeout)
          })
      })
    }).on('mouseout',function () {
        clearTimeout(seed)
        $("#image").css("display","none");
    })
}

function this_text() {
    var text = $(".layui-nav-child dd").html();
    $(".layui-this").html(text)
}
//回到首页
function backIndex() {
    $(".layui-logo").click(function () {
        window.location.href = "/admin/home"
    })
}
//按品牌查询
function byBrand(pageNum) {
    $(".layui-nav-child dd").click(function (res) {
        var bid = $(this).attr('data-id');//点击的品牌编号
        var brandName = $(this).attr('data-name')//点击的品牌名字
        $.ajax({
            method: "POST",
            url: "/admin/getComputerByBrand",
            data: {
                pageNum: pageNum,
                pageSize: 2,
                bid: bid
            }
        }).done(function (res) {
            $("#tab_body").html("");
            $("#pageInfo").html("");
            $("#this").html(brandName)
            //往表格添加数据
            res.list.forEach(function (c) {
                var state = c.computerState;
                if (state > 0) {
                    state = "上架"
                } else {
                    state = "下架"
                }
                var tab = "<tr class='displayImage' data-pageNum='"+pageNum+"' data-cid='"+c.computerId+"'><td>" + c.computerId + "</td><td>" + c.computerName + "</td><td>"
                    + c.computerPrice + "</td><td>" + c.computerAmount + "</td><td>" + state + "</td><td id='bid' data-bid="+c.computerBrandId+">"
                    + c.computerBrandId + "</td><td>" + c.cpuType + "</td><td>" + c.gpuType + "</td><td>" + c.ramType + "</td>"
                    + " <td><a  class='layui-btn layui-btn-xs update'  lay-event='edit'>编辑</a>" +
                    "<a class='layui-btn layui-btn-danger layui-btn-xs del' class='del' lay-event='del'>删除</a></td></tr>"
                $("#tab_body").append(tab)
            })
            //分页功能
            var data = "<li class='pages' value='1'><a>首页</a></li>" +
                "<li class='pages' value='" + res.prePage + "'><a>上一页</a></li>";
            res.navigatepageNums.forEach(function (num) {
                data += "<li class='pages' value='" + num + "'><a>" + num + "</a></li>"
            })
            data += "<li class='pages' value='" + res.nextPage + "'><a>下一页</a></li>" +
                "<li class='pages' value='" + res.pages + "'><a>尾页</a></li>";
            $("#pageInfo").append(data)
            ddClickByBrand()
            imageFours(1000)
            byBrand_del()

        })
    })
}

//按牌子分页的方法
function byBrandPage(pageNum){
    var bid = $("#bid").attr("data-bid")
    $.ajax({
        method: "POST",
        url: "/admin/getComputerByBrand",
        data: {
            pageNum: pageNum,
            pageSize: 2,
            bid: bid
        }
    }).done(function (res) {
        $("#tab_body").html("");
        $("#pageInfo").html("");
        //往表格添加数据
        res.list.forEach(function (c) {

            // var states = null;
            var state = c.computerState;
            if (state > 0) {
                state = "上架"
            } else {
                state = "下架"
            }
            var tab = "<tr class='displayImage' data-pageNum='"+pageNum+"' data-cid='"+c.computerId+"'><td>" + c.computerId + "</td><td>" + c.computerName + "</td><td>"
                + c.computerPrice + "</td><td>" + c.computerAmount + "</td><td>" + state + "</td><td id='bid' data-bid="+c.computerBrandId+">"
                + c.computerBrandId + "</td><td>" + c.cpuType + "</td><td>" + c.gpuType + "</td><td>" + c.ramType + "</td>"
                + " <td><a  class='layui-btn layui-btn-xs update' lay-event='edit'>编辑</a>" +
                "<a class='layui-btn layui-btn-danger layui-btn-xs del'  lay-event='del'>删除</a></td></tr>"
            $("#tab_body").append(tab)
        })
        //分页功能
        var data = "<li class='pages' value='1'><a>首页</a></li>" +
            "<li class='pages' value='" + res.prePage + "'><a>上一页</a></li>";
        res.navigatepageNums.forEach(function (num) {
            data += "<li class='pages' value='" + num + "'><a>" + num + "</a></li>"
        })
        data += "<li class='pages' value='" + res.nextPage + "'><a>下一页</a></li>" +
            "<li class='pages' value='" + res.pages + "'><a>尾页</a></li>";
        $("#pageInfo").append(data)
        ddClickByBrand()
       byBrand_del()

    })
}

//按牌子分页点击事件与删除点击事件
function ddClickByBrand() {
    var pageNum;
    $(".pages").click(function () {
        pageNum = $(this).val();
        byBrandPage(pageNum)
    })
    //悬停1秒显示电脑图片
    imageFours(1000)
}
//全部数据页面的删除方法
function all_del() {
    $(".del").click(function () {
        var pageNum = $(this).closest("tr").attr("data-pageNum");//保存该页页码
        if (confirm("确认删除?")) {
            $.ajax({
                method:"GET",
                url:"/admin/del?id="+$(this).closest("tr").attr('data-cid')
            }).done(function () {
                alert("删除成功")
                all(pageNum)//回到该页
            }).fail(function (res) {
                alert("删除失败")
            })
        }
    })
}
//按牌子显示后的删除方法
function byBrand_del() {
    $(".del").click(function () {
        var pageNum = $(this).closest("tr").attr("data-pageNum");//保存该页页码
        if (confirm("确认删除?")){
            $.ajax({
                method:"GET",
                url:"/admin/del?id="+$(this).closest("tr").attr('data-cid')
            }).done(function () {
                alert("删除成功")
                byBrandPage(pageNum)//回到该页
            }).fail(function (res) {
                alert("删除失败")
            })
        }
    })
}

//全部商品的分页点击事件与删除点击事件
function ddClickAll() {
    var  pageNum=null
    $(".num").click(function () {
         pageNum = $(this).val();
        all(pageNum)
    })

}