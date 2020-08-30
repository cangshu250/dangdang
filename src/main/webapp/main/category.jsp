<%@page contentType="text/html;charset=utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    $(function () {

        $.ajax({
            url: "${pageContext.request.contextPath}/catalog/showCatalogs",
            type: "POST",
            dataType: "JSON",
            success: function (result) {

                $(".bg_old").empty();
                for (var i =  result.length-1; i >=0; i--) {
                    $("#cat_before").after(" <div class=\"bg_old\" onmouseover=\"this.className = 'bg_white';\"\n" +
                        "             onmouseout=\"this.className = 'bg_old';\"id='cat"+i+"'><h3>" +
                        "[<a href='#'>" + result[i].classname + "</a>]" +
                        "\t\t\t\t</h3> <ul class=\"ul_left_list\"> </ul><div class=\"empty_left\">\n" +
                        "            </div>\n" +
                        "        </div>")

                }
                for(var i=result.length-1;i>=0;i--){
                    var sonCatalogs=result[i].sonCatalogs;
                    console.log(sonCatalogs);
                    for(var j=0;j<sonCatalogs.length;j++){
                        //  console.log(sonCatalogs[j].classname);
                        $(".ul_left_list").eq(i).append("<li><a href='#'>"+sonCatalogs[j].classname+"</a></li>");

                    }
                }
            }
        });

    })
</script>
<div class="book_l_border1" id="__FenLeiLiuLan">
    <div class="book_sort_tushu">
        <h2 id="cat_before">
            分类浏览

        </h2>



        <div class="more2" id="xxx">
        </div>
        <!--1级分类结束-->


        <div class="more2">
        </div>
        <!--1级分类结束-->


        <div class="bg_old">
            <h3>
                &nbsp;
            </h3>
        </div>
    </div>
</div>
