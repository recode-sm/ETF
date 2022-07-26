<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="utf-8" />
    <title>Kakao JavaScript SDK example</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
//         var CHANNEL_ID = "_GVVslslk"; // 수정 할 것 :  https://center-pf.kakao.com/ 에서 _GVVslslk 형태의 ID 입력
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('dbfa764ca9e9d4296dc9b5d7026121db'); //★ 수정 할 것 : 내 애플리케이션>앱 설정>앱 키 : JAVASCRIPT KEY 입력하세요
        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>

    <script type="text/javascript">
        function loginWithKakao() {
        	Kakao.Auth.loginForm({
                success: function (authObj) {
                    alert("login :" + JSON.stringify(authObj));
                    //★ 추가 할 것 : 로그인 성공 후 처리 
                },
                fail: function (err) {
                    alert(JSON.stringify(err))
                },
            })
        }

        function logoutWithKakao() {
            if (!Kakao.Auth.getAccessToken()) {
                console.log('Not logged in.');
                return;
            }
            console.log(Kakao.Auth.getAccessToken()); //before Logout
            Kakao.Auth.logout(function () {
                alert("logout");
                
                //★ 추가 할 것 : 로그아웃 성공 후 처리 
            });
        }

        function unlinkWithKakao() {
            Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                    alert("unlink :" + JSON.stringify(response));
                },
                fail: function (error) {
                    console.log(error);
                }
            });
        }

        function profileWithKakao() {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {
                    console.log(response);
                    document.getElementById("userid").innerText = response.id;
                    document.getElementById("nickname").innerText = response.kakao_account.profile.nickname;
                    document.getElementById("thumbnail_image").src = response.properties.thumbnail_image;
                },
                fail: function (error) {
                    console.log(error);
                }
            });
        }

        function btn_link_send() {
            Kakao.Link.createDefaultButton({
                container: '#btn-link-send',
                objectType: 'feed',
                content: {
                    title: '디저트 사진',
                    description: '아메리카노, 빵, 케익',
                    imageUrl:
                        'http://mud-kage.kakao.co.kr/dn/NTmhS/btqfEUdFAUf/FjKzkZsnoeE4o19klTOVI1/openlink_640x640s.jpg',
                    link: {
                        mobileWebUrl: 'https://developers.kakao.com',
                        androidExecParams: 'test',
                    },
                },
                social: {
                    likeCount: 10,
                    commentCount: 20,
                    sharedCount: 30,
                },
                buttons: [
                    {
                        title: '웹으로 이동',
                        link: {
                            mobileWebUrl: 'https://developers.kakao.com',
                        },
                    },
                    {
                        title: '앱으로 이동',
                        link: {
                            mobileWebUrl: 'https://developers.kakao.com',
                        },
                    },
                ]
            });
        }

        function btn_link_scrap(requestUrl) {
            Kakao.Link.createScrapButton({
                container: '#btn-link-scrap',
                requestUrl: requestUrl
            });
        }

        function btn_link_template(templateId) {
            Kakao.Link.createCustomButton({
                container: '#btn-link-template',
                templateId: templateId,
                templateArgs: {
                    'title': '제목 영역입니다.',
                    'description': '설명 영역입니다.'
                }
            });
        }

        function btn_story_share(url, text) {
            Kakao.Story.createShareButton({
                container: '#btn-story-share',
                url: url,
                text: text
            });
        }

        function btn_channel_added() {
            Kakao.Channel.createAddChannelButton({
                container: '#btn-channel-added',
                channelPublicId: CHANNEL_ID
            });
        }

        function btn_channel_chat() {
            Kakao.Channel.createChatButton({
                container: '#btn-channel-chat',
                channelPublicId: CHANNEL_ID
            });
        }
    </script>
</head>

<body>
    <table border="1">
        <tr>
            <td>Login (PopUp)</td>
            <td>
                <a id="custom-login-btn" href="javascript:loginWithKakao()">
                    <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
                </a>
            </td>
            <td>
                <pre>
* KOE004 : "내 애플리케이션>카카오 로그인"에서 카카오 로그인 기능을 활성화합니다.
* "내 애플리케이션>제품 설정>카카오 로그인>동의항목"에서 "프로필 정보(닉네임/프로필 사진)"를 필수 동의로 변경합니다.
* 도메인 추가 : 테스트용 웹서버 도메인, 메시지에 사용할 도메인
ex) http://localhost, https://devtalk.kakao.com
                </pre>
            </td>
        </tr>
        <tr>
            <td>Logout</td>
            <td>
                <Button onclick="javascript:logoutWithKakao()">Logout</Button>
            </td>
        </tr>
        <tr>
            <td>Unlink</td>
            <td>
                <Button onclick="javascript:unlinkWithKakao()">Unlink</Button>
            </td>
        </tr>
        <tr>
            <td>Profile</td>
            <td>
                <Button onclick="javascript:profileWithKakao()">Profile</Button>
                <p id="userid"></p>
                <p id="nickname"></p>
                <img id="thumbnail_image" />
            </td>
        </tr>
        <tr>
            <td>Kakao Link</td>
            <td>
                <p id="btn-link-send"><button class="btn btn-primary">기본 메세지 보내기</button></p>
                <script>btn_link_send();</script>

                <p id="btn-link-scrap"><button class="btn btn-primary">스크랩 메세지 보내기</button></p>
                <script>btn_link_scrap('https://devtalk.kakao.com');</script>

                <p id="btn-link-template"><button class="btn btn-primary">템플릿 메세지 보내기</button></p>
                <script>btn_link_template(41666);</script>
            </td>
            <td>
                <pre>
* 템플릿 메세지 보내기는 https://developers.kakao.com/tool/template-builder/app 에서 메시지 템플릿 등록
                </pre>
            </td>
        </tr>
        <tr>
            <td>Kakao Story</td>
            <td>
                <p id="btn-story-share"></p>
                <script>btn_story_share('https://devtalk.kakao.com', '카카오 데브톡');</script>
            </td>
        </tr>
        <tr>
            <td>KakaoTalk Channel</td>
            <td>
                <p id="btn-channel-added"></p>
                <script>btn_channel_added();</script>
                <p id="btn-channel-chat"></p>
                <script>btn_channel_chat();</script>
            </td>
            <td>
                <pre>
* https://business.kakao.com/info/kakaotalkchannel 에서 채널 생성하고 CHANNEL_ID 설정
                </pre>
            </td>            
        </tr>

    </table>


</body>

</html>
