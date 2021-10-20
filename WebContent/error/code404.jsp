<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 404</title>
    <meta name="viewport" content="height=device-height,width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <style>
        html,body{
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: '맑음고딕','나눔고딕',sans-serif;
            font-size: 13px;
        }
        a {color:#72e9ff;text-decoration:none}
        a:active, a:hover {text-decoration:none;}
        a:active {background-color:transparent}
        #BigWrap{
            width: 100%;
            height: 100%;
            background-color: #eee;
            position: relative;
        }
        #BigWrap section{
            position: absolute;
            left: 50%;
            top: 50%;
            width: 100%;
/*            height: 100%;*/
            max-width: 400px;
/*            max-height: 336px;*/
            margin-left: -200px;
            margin-top: -188px;
            z-index: 2;
            background-color: #000;
            opacity: 0.8;
            padding: 20px;
            color: #fff;
            line-height: 1.8;
        }
        #BigWrap section h1{
            margin: 0 auto 10px;
            font-size: 20px;
            font-weight: normal;
            color: #d2ff00;
        }
               
        #BigWrap #videoEle{
            position: absolute;
            overflow: hidden;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
        }
        #copy{
            position: relative;
            text-align: right;
            border-top: 1px solid #333;
        }   
        .vjs-control-bar{
            display: none;
        }
    </style>
</head>

<body>
   <article id="BigWrap">       
        <section>
           	<h1> 페이지를 찾을 수 없습니다. </h1>
			<h2> 관리자에게 문의 해주세요. </h2>
			<h2> tel)010-1234-1234 </h2>
        </section>
        <div id="videoEle"></div>
    </article>
     <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    
    <script src="./js/video.js"></script>
    
    <script src="./js/bigvideo.js"></script>
    
    <script src="./js/imagesloaded.pkgd.min.js"></script>    
    <script>
        window.mobilecheck = function() {
          var check = false;
          (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
          return check;
        };
        
        var BV = new $.BigVideo({useFlashForFirefox:false, container:$('#videoEle')});
            BV.init();
            if (mobilecheck()) {
                BV.show('./assets/images/dansing.jpg');
            } else {
                BV.show(
                    { type: "video/mp4",  src: "./assets/images/Dance1.mp4", doLoop:true },
                    { type: "video/webm", src: "./assets/images/Dance1.webm", doLoop:true },
                    { type: "video/ogg",  src: "./assets/images/Dance1.ogv", doLoop:true }
                );
                BV.getPlayer().volume(0);
            }
    </script>
</body>
</html>