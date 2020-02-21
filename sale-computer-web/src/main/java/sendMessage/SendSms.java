package sendMessage;
import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;

import java.util.Random;

/*
pom.xml
<dependency>
  <groupId>com.aliyun</groupId>
  <artifactId>aliyun-java-sdk-core</artifactId>
  <version>4.0.3</version>
</dependency>
*/
public class SendSms {
    public static void main(String[] args) {
        String randomForSix = getRandomForSix();
        String send = new SendSms().send("17666012478", getRandomForSix());
        System.out.println(send);
    }

    public static String getRandomForSix() {
        Random random = new Random();
        String result = "";
        for (int i = 0; i < 6; i++) {
            //随机生成 0～9 的随机数
            int i1 = random.nextInt(10);
            result += i1;
        }
        return result;
    }
    public String send(String phone,String code){
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAI4FfofEgAgU8FEUUPdh62", "rOUpbF79MEUxJDI2TaneFXZyqMywpi");
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        request.setMethod(MethodType.POST);
        request.setDomain("dysmsapi.aliyuncs.com");
        request.setVersion("2017-05-25");
        request.setAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", phone);
        request.putQueryParameter("SignName", "优脑网项目");
        request.putQueryParameter("TemplateCode", "SMS_180755519");
        request.putQueryParameter("TemplateParam", "{\"code\":\""+code+"\"}");
        try {
            CommonResponse response = client.getCommonResponse(request);
            String data = response.getData();
            System.out.println(data);
            String message = data.substring(data.indexOf("Message") + 10, data.indexOf(",") - 1);
            System.out.println(message);
            return message;
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
        return "fail";
    }
}