Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36D4E392A33
	for <lists+linux-omap@lfdr.de>; Thu, 27 May 2021 11:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235392AbhE0JFH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 May 2021 05:05:07 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33394 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235658AbhE0JFF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 May 2021 05:05:05 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14R93REt099921;
        Thu, 27 May 2021 04:03:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622106207;
        bh=PyUiBrI4wVr8wHXwd8i4QB6Nj7N8Tcm9ilMjq3+0nzs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=mI+gdUqICterh3QCDXFnCSCyrzhRkSfJxdfhUGfVQMfB11oPPknz5qOgKhryi31ON
         CzPJBK8TnWY1WNZQZp/LYMCUvRRJ+B+QUZYX5q+bHVUxhlIBHbeG+l7nv6EdyDLv38
         dbEkJv4y8+dK8BOJIF0k1aRPwkYkTbD5FYKprBIo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14R93RNa059974
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 May 2021 04:03:27 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 04:03:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 04:03:27 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14R93NtQ075516;
        Thu, 27 May 2021 04:03:25 -0500
Subject: Re: [PATCH v3] ARM: dts: dra7: Fix duplicate USB4 target module node
To:     Tony Lindgren <tony@atomide.com>,
        Gowtham Tammana <g-tammana@ti.com>
CC:     Suman Anna <s-anna@ti.com>, <bcousson@baylibre.com>,
        <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Nisanth Menon <nm@ti.com>
References: <20210526213035.15448-1-g-tammana@ti.com>
 <YK8ykeNA9AsjB89I@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <bd903d6a-2894-fc39-e431-5dfed04a3604@ti.com>
Date:   Thu, 27 May 2021 12:03:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YK8ykeNA9AsjB89I@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 27/05/2021 08:48, Tony Lindgren wrote:
> Hi,
> 
> * Gowtham Tammana <g-tammana@ti.com> [210526 21:30]:
>> diff --git a/arch/arm/boot/dts/am5718.dtsi b/arch/arm/boot/dts/am5718.dtsi
>> index ebf4d3cc1cfb..6d7530a48c73 100644
>> --- a/arch/arm/boot/dts/am5718.dtsi
>> +++ b/arch/arm/boot/dts/am5718.dtsi
>> @@ -17,17 +17,13 @@ / {
>>    * VCP1, VCP2
>>    * MLB
>>    * ISS
>> - * USB3, USB4
>> + * USB3
>>    */
>>   
>>   &usb3_tm {
>>   	status = "disabled";
>>   };
>>   
>> -&usb4_tm {
>> -	status = "disabled";
>> -};
>> -
>>   &atl_tm {
>>   	status = "disabled";
>>   };
> 
> The above makes sense as usb4 is only on dra74x and should not be even
> available otherwise.
> 
>> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
>> index 149144cdff35..648d23f7f748 100644
>> --- a/arch/arm/boot/dts/dra7-l4.dtsi
>> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
>> @@ -4129,28 +4129,6 @@ usb3: usb@10000 {
>>   			};
>>   		};
>>   
>> -		usb4_tm: target-module@140000 {		/* 0x48940000, ap 75 3c.0 */
>> -			compatible = "ti,sysc-omap4", "ti,sysc";
>> -			reg = <0x140000 0x4>,
>> -			      <0x140010 0x4>;
>> -			reg-names = "rev", "sysc";
>> -			ti,sysc-mask = <SYSC_OMAP4_DMADISABLE>;
>> -			ti,sysc-midle = <SYSC_IDLE_FORCE>,
>> -					<SYSC_IDLE_NO>,
>> -					<SYSC_IDLE_SMART>,
>> -					<SYSC_IDLE_SMART_WKUP>;
>> -			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
>> -					<SYSC_IDLE_NO>,
>> -					<SYSC_IDLE_SMART>,
>> -					<SYSC_IDLE_SMART_WKUP>;
>> -			/* Domains (P, C): l3init_pwrdm, l3init_clkdm */
>> -			clocks = <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS4_CLKCTRL 0>;
>> -			clock-names = "fck";
>> -			#address-cells = <1>;
>> -			#size-cells = <1>;
>> -			ranges = <0x0 0x140000 0x20000>;
>> -		};
>> -
> 
> But let's keep the target-module@140000 here as it puts it in the right
> location rather than directly on the ocp. Let's mark it with
> status = "disabled" in dra7-l4.dtsi, and add a comment noting it's only
> available on dra74x. So similar to what you had in your v1 patch, except
> disabled.

My preference would be not to mix SoC variant specific modules in common module,
and fix dra74x instead by placing usb4 node in proper place:

&l4_per3 {						/* 0x48800000 */
	segment@0 {	
-->

> 
>> diff --git a/arch/arm/boot/dts/dra71x.dtsi b/arch/arm/boot/dts/dra71x.dtsi
>> index cad0e4a2bd8d..9c270d8f75d5 100644
>> --- a/arch/arm/boot/dts/dra71x.dtsi
>> +++ b/arch/arm/boot/dts/dra71x.dtsi
>> @@ -11,7 +11,3 @@
>>   &rtctarget {
>>   	status = "disabled";
>>   };
>> -
>> -&usb4_tm {
>> -	status = "disabled";
>> -};
>> diff --git a/arch/arm/boot/dts/dra72x.dtsi b/arch/arm/boot/dts/dra72x.dtsi
>> index d403acc754b6..f3e934ef7d3e 100644
>> --- a/arch/arm/boot/dts/dra72x.dtsi
>> +++ b/arch/arm/boot/dts/dra72x.dtsi
>> @@ -108,7 +108,3 @@ &pcie1_ep {
>>   &pcie2_rc {
>>   	compatible = "ti,dra726-pcie-rc", "ti,dra7-pcie";
>>   };
>> -
>> -&usb4_tm {
>> -	status = "disabled";
>> -};
> 
> Then the above change can be kept.
> 
>> diff --git a/arch/arm/boot/dts/dra74x.dtsi b/arch/arm/boot/dts/dra74x.dtsi
>> index e1850d6c841a..60f2ab8d34d5 100644
>> --- a/arch/arm/boot/dts/dra74x.dtsi
>> +++ b/arch/arm/boot/dts/dra74x.dtsi
>> @@ -49,7 +49,7 @@ dsp2_system: dsp_system@41500000 {
>>   			reg = <0x41500000 0x100>;
>>   		};
>>   
>> -		target-module@48940000 {
>> +		usb4_tm: target-module@48940000 {
>>   			compatible = "ti,sysc-omap4", "ti,sysc";
>>   			reg = <0x48940000 0x4>,
>>   			      <0x48940010 0x4>;
> 
> And in dra74x.dtsi just set it enabled then :)


-- 
Best regards,
grygorii
