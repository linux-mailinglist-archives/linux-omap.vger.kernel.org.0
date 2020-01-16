Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 735AF13D560
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 08:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgAPHv0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 02:51:26 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52126 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgAPHv0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jan 2020 02:51:26 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00G7pNCX119651;
        Thu, 16 Jan 2020 01:51:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579161083;
        bh=w7vzdMvfFmc+atK4e4y3iJy2N7LLIkGApbrMpU6UVFE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Lxq5C+DdEA/XuOwf4RaExziSKgDJfXAENoWcLnK7o/ah6Xpw/kK3jWnYjEu5GYa3B
         FA29RAFWQZh3vAsMRahdLXkJ8RnsaTT/CkJ8WB/lj5bNJGpiGrwB+apotDmtKHdD+g
         7OrUmbp8q1eDnDd39B/toxJ+joMr9oh+khQcTpP0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00G7pNhd077404;
        Thu, 16 Jan 2020 01:51:23 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Jan 2020 01:51:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Jan 2020 01:51:21 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00G7pJhg111677;
        Thu, 16 Jan 2020 01:51:19 -0600
Subject: Re: [RESEND PATCHv4 01/14] dt-bindings: remoteproc: Add OMAP
 remoteproc bindings
To:     Suman Anna <s-anna@ti.com>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        <devicetree@vger.kernel.org>
References: <20200102131845.12992-2-t-kristo@ti.com>
 <20200102132512.13248-1-t-kristo@ti.com>
 <f4ac066a-e5ee-f888-42bb-3f6d444747ee@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <1d4597f7-9e28-8b16-7679-c8abd291346d@ti.com>
Date:   Thu, 16 Jan 2020 09:51:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f4ac066a-e5ee-f888-42bb-3f6d444747ee@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/01/2020 18:49, Suman Anna wrote:
> Hi Tero,
> 
> On 1/2/20 7:25 AM, Tero Kristo wrote:
>> From: Suman Anna <s-anna@ti.com>
>>
>> Add the device tree bindings document for the IPU and DSP
>> remote processor devices on OMAP4+ SoCs.
>>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> [t-kristo@ti.com: converted to schema]
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>> v4: added ti,bootreg-shift and ti,autosuspend-delay properties
> 
> You missed out on my v3 comment on the firmware-name on Example 2. Can
> you please address it when you post the next version?

I don't think I missed it, but you never told what is the actual name to 
use there. Firmware name generally does not matter, as user can provide 
whatever he wants via DT now.

-Tero

> 
>>
>>   .../remoteproc/ti,omap-remoteproc.yaml        | 329 ++++++++++++++++++
>>   1 file changed, 329 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
>> new file mode 100644
>> index 000000000000..f53d58efaae3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
> 
> [snip]
> 
>> +  - |+
>> +
>> +    //Example 2: OMAP5 IPU
>> +
>> +    /* IPU Reserved Memory node */
>> +    #include <dt-bindings/clock/omap5.h>
>> +    reserved-memory {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        ipu_memory_region: ipu-memory@95800000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0 0x95800000 0 0x3800000>;
>> +            reusable;
>> +        };
>> +    };
>> +
>> +    /* IPU node */
>> +    ocp {
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        ipu: ipu@55020000 {
>> +            compatible = "ti,omap5-ipu";
>> +            reg = <0x55020000 0x10000>;
>> +            reg-names = "l2ram";
>> +            iommus = <&mmu_ipu>;
>> +            mboxes = <&mailbox &mbox_ipu>;
>> +            memory-region = <&ipu_memory_region>;
>> +            ti,timers = <&timer3>, <&timer4>;
>> +            ti,watchdog-timers = <&timer9>, <&timer11>;
>> +            clocks = <&ipu_clkctrl OMAP5_MMU_IPU_CLKCTRL 0>;
>> +            resets = <&prm_core 2>;
>> +            firmware-name = "omap5-ipu-fw.xem";
>> +        };
>> +    };
> 
> regards
> Suman
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
