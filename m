Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D96B311CA3F
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 11:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbfLLKIp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 05:08:45 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53628 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728436AbfLLKIp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 05:08:45 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCA8hrm054116;
        Thu, 12 Dec 2019 04:08:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576145323;
        bh=rGdE/96Shpz1invG0JRZ5QLS4A1urS5anpBOPlp2Suk=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=onAc6ci3fX4olrQGJPzWmF/2RhejHD3fE/lwGDwIl30tdBBxZEglSdP7dwOJyHBZt
         cGzLZ4c50ya8CiogBqcKmtOUuL8zsuJJUbIMOiT4TOyLaZln/ZTqH0gadXf8AUxYwM
         WYBwvgjw3S7a6bEEmNfFNS4vSiXZvbSlRzaNmt+Y=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCA8hsL090495
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 04:08:43 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 04:08:42 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 04:08:43 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCA8fZk087253;
        Thu, 12 Dec 2019 04:08:42 -0600
Subject: Re: [PATCH] ARM: dts: omap3: name mdio node properly
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>
References: <20191127153212.22209-1-grygorii.strashko@ti.com>
 <2c2f3c8f-4062-f3ce-e1ce-aa128565b901@ti.com>
Message-ID: <86f18a06-2039-266f-5cff-c6d1c521c0df@ti.com>
Date:   Thu, 12 Dec 2019 12:08:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2c2f3c8f-4062-f3ce-e1ce-aa128565b901@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 27/11/2019 18:26, Grygorii Strashko wrote:
> 
> 
> On 27/11/2019 17:32, Grygorii Strashko wrote:
>> Rename davinci_mdio DT node "ethernet"->"mdio"
>> This fixes the following DT schemas check errors:
>> am3517-craneboard.dt.yaml: ethernet@5c030000: $nodename:0: 'ethernet@5c030000' does not match '^mdio(@.*)?'
>>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> ---
> 
> This can be for next material.
> 
>>   arch/arm/boot/dts/am3517.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
>> index 76f819f4ba48..84e13778a64a 100644
>> --- a/arch/arm/boot/dts/am3517.dtsi
>> +++ b/arch/arm/boot/dts/am3517.dtsi
>> @@ -74,7 +74,7 @@
>>               clock-names = "ick";
>>           };
>> -        davinci_mdio: ethernet@5c030000 {
>> +        davinci_mdio: mdio@5c030000 {
>>               compatible = "ti,davinci_mdio";
>>               ti,hwmods = "davinci_mdio";
>>               status = "disabled";
>>
> 

Any comments here?

-- 
Best regards,
grygorii
