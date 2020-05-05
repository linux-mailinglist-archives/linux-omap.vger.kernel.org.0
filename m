Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF33D1C5CF4
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 18:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729195AbgEEQGk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 May 2020 12:06:40 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43396 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729171AbgEEQGk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 May 2020 12:06:40 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 045G6aDF018831;
        Tue, 5 May 2020 11:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588694796;
        bh=QbZDJH8ksQWHexlXjssoaBsD7lkC7FYNaOKBEg46oeY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MQRREdc+hX+hXg9t+zuz31Isgup1G2IRCeNGNQbJ6pGkUMNzQa1WAUtAEVjwhyGYp
         sZmbEno9W8qULojUWwZVR7ywQQK++BTT8VSqAFOQ3BTvOo65LkDoc1vBUtzdFsGiJo
         D69frxO6R+XQO6mcta/lPnO4ZemPdMPVmVPKURuE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 045G6aO6005367
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 May 2020 11:06:36 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 5 May
 2020 11:06:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 5 May 2020 11:06:36 -0500
Received: from [10.250.70.56] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 045G6amN033733;
        Tue, 5 May 2020 11:06:36 -0500
Subject: Re: [PATCH] arm: dts: Add 32KHz clock as default clock source
To:     Tony Lindgren <tony@atomide.com>, Lokesh Vutla <lokeshvutla@ti.com>
CC:     Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>
References: <20200427172604.16351-1-lokeshvutla@ti.com>
 <20200428181919.GS37466@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <e49e047d-6883-6bee-7dac-a544a27f6293@ti.com>
Date:   Tue, 5 May 2020 11:06:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428181919.GS37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 4/28/20 1:19 PM, Tony Lindgren wrote:
> * Lokesh Vutla <lokeshvutla@ti.com> [200427 17:27]:
>> Clocksource to timer configured in pwm mode can be selected using the DT
>> property ti,clock-source. There are few pwm timers which are not
>> selecting the clock source and relying on default value in hardware or
>> selected by driver. Instead of relying on default value, always select
>> the clock source from DT.
>>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks Lokesh, with this patch, we should be able to pickup the dmtimer 
driver patch to finally allow dmtimer clients to use 
assigned-clock-parents.

Once both of these are merged, we can deprecate the ti,clock-source from 
the omap-pwm-dmtimer driver.

Reviewed-by: Suman Anna <s-anna@ti.com>

regards
Suman

>> ---
>> Tony,
>> 	This is in preparation with removal of selecting clock source in
>> 	prepare() api. Let me know if you prefer separate patches for
>> 	each dts.
> 
> Looks just fine to me.
> 
> Tony
> 
>>   arch/arm/boot/dts/am335x-guardian.dts            | 1 +
>>   arch/arm/boot/dts/am3517-evm.dts                 | 1 +
>>   arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi | 1 +
>>   arch/arm/boot/dts/omap3-gta04.dtsi               | 1 +
>>   4 files changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/am335x-guardian.dts b/arch/arm/boot/dts/am335x-guardian.dts
>> index 81e0f63e94d3..0ebe9e2c150e 100644
>> --- a/arch/arm/boot/dts/am335x-guardian.dts
>> +++ b/arch/arm/boot/dts/am335x-guardian.dts
>> @@ -105,6 +105,7 @@
>>   		ti,timers = <&timer7>;
>>   		pinctrl-names = "default";
>>   		pinctrl-0 = <&dmtimer7_pins>;
>> +		ti,clock-source = <0x01>;
>>   	};
>>   
>>   	vmmcsd_fixed: regulator-3v3 {
>> diff --git a/arch/arm/boot/dts/am3517-evm.dts b/arch/arm/boot/dts/am3517-evm.dts
>> index a1fd3e63e86e..92466b9eb6ba 100644
>> --- a/arch/arm/boot/dts/am3517-evm.dts
>> +++ b/arch/arm/boot/dts/am3517-evm.dts
>> @@ -156,6 +156,7 @@
>>   		pinctrl-0 = <&pwm_pins>;
>>   		ti,timers = <&timer11>;
>>   		#pwm-cells = <3>;
>> +		ti,clock-source = <0x01>;
>>   	};
>>   
>>   	/* HS USB Host PHY on PORT 1 */
>> diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
>> index f7b82ced4080..381f0e82bb70 100644
>> --- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
>> +++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
>> @@ -65,6 +65,7 @@
>>   		pinctrl-0 = <&pwm_pins>;
>>   		ti,timers = <&timer10>;
>>   		#pwm-cells = <3>;
>> +		ti,clock-source = <0x01>;
>>   	};
>>   
>>   };
>> diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
>> index 409a758c99f1..ecc45862b4f3 100644
>> --- a/arch/arm/boot/dts/omap3-gta04.dtsi
>> +++ b/arch/arm/boot/dts/omap3-gta04.dtsi
>> @@ -150,6 +150,7 @@
>>   		compatible = "ti,omap-dmtimer-pwm";
>>   		ti,timers = <&timer11>;
>>   		#pwm-cells = <3>;
>> +		ti,clock-source = <0x01>;
>>   	};
>>   
>>   	hsusb2_phy: hsusb2_phy {
>> -- 
>> 2.23.0
>>

