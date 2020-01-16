Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC7D613DCCE
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 15:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbgAPOAP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 09:00:15 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36926 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728931AbgAPOAP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jan 2020 09:00:15 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GE0Dsg107367;
        Thu, 16 Jan 2020 08:00:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579183213;
        bh=NTqfS5sg3qR7NGf7hi8wt6YM0bTdrvxo4J0eeuaTUDY=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=SvPv2bfAXk5qNECkzp6FgJVXH85hJ75RGdiqgfQWV0z26MDcuL0N7K4e3oU9okd5a
         nQk2wRI3w9vwOZuPFYEWJzF34BeVm5k0pcBCTMZgVA9J8xVotEtuf476MQQelMmA93
         f6cbwIbg0hl78JS+Vub975zBsBZMTDk71sfK+SOQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00GE0Dqq030954
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jan 2020 08:00:13 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Jan 2020 08:00:12 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Jan 2020 08:00:12 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GE0AtA029619;
        Thu, 16 Jan 2020 08:00:10 -0600
Subject: Re: [RESEND PATCHv4 01/14] dt-bindings: remoteproc: Add OMAP
 remoteproc bindings
From:   Tero Kristo <t-kristo@ti.com>
To:     Suman Anna <s-anna@ti.com>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        <devicetree@vger.kernel.org>
References: <20200102131845.12992-2-t-kristo@ti.com>
 <20200102132512.13248-1-t-kristo@ti.com>
 <f4ac066a-e5ee-f888-42bb-3f6d444747ee@ti.com>
 <1d4597f7-9e28-8b16-7679-c8abd291346d@ti.com>
Message-ID: <47ece31c-53d5-2ec8-8047-86f6ad532c37@ti.com>
Date:   Thu, 16 Jan 2020 16:00:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1d4597f7-9e28-8b16-7679-c8abd291346d@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 16/01/2020 09:51, Tero Kristo wrote:
> On 08/01/2020 18:49, Suman Anna wrote:
>> Hi Tero,
>>
>> On 1/2/20 7:25 AM, Tero Kristo wrote:
>>> From: Suman Anna <s-anna@ti.com>
>>>
>>> Add the device tree bindings document for the IPU and DSP
>>> remote processor devices on OMAP4+ SoCs.
>>>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>> [t-kristo@ti.com: converted to schema]
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>> ---
>>> v4: added ti,bootreg-shift and ti,autosuspend-delay properties
>>
>> You missed out on my v3 comment on the firmware-name on Example 2. Can
>> you please address it when you post the next version?
> 
> I don't think I missed it, but you never told what is the actual name to 
> use there. Firmware name generally does not matter, as user can provide 
> whatever he wants via DT now.

Just to close on this, so the issue was file extension for the firmware 
name being .xem when it should have been .xem4. Fixed in v5 now.

-Tero

> 
>>
>>>
>>>   .../remoteproc/ti,omap-remoteproc.yaml        | 329 ++++++++++++++++++
>>>   1 file changed, 329 insertions(+)
>>>   create mode 100644 
>>> Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml 
>>>
>>> new file mode 100644
>>> index 000000000000..f53d58efaae3
>>> --- /dev/null
>>> +++ 
>>> b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
>>
>> [snip]
>>
>>> +  - |+
>>> +
>>> +    //Example 2: OMAP5 IPU
>>> +
>>> +    /* IPU Reserved Memory node */
>>> +    #include <dt-bindings/clock/omap5.h>
>>> +    reserved-memory {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        ipu_memory_region: ipu-memory@95800000 {
>>> +            compatible = "shared-dma-pool";
>>> +            reg = <0 0x95800000 0 0x3800000>;
>>> +            reusable;
>>> +        };
>>> +    };
>>> +
>>> +    /* IPU node */
>>> +    ocp {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +
>>> +        ipu: ipu@55020000 {
>>> +            compatible = "ti,omap5-ipu";
>>> +            reg = <0x55020000 0x10000>;
>>> +            reg-names = "l2ram";
>>> +            iommus = <&mmu_ipu>;
>>> +            mboxes = <&mailbox &mbox_ipu>;
>>> +            memory-region = <&ipu_memory_region>;
>>> +            ti,timers = <&timer3>, <&timer4>;
>>> +            ti,watchdog-timers = <&timer9>, <&timer11>;
>>> +            clocks = <&ipu_clkctrl OMAP5_MMU_IPU_CLKCTRL 0>;
>>> +            resets = <&prm_core 2>;
>>> +            firmware-name = "omap5-ipu-fw.xem";
>>> +        };
>>> +    };
>>
>> regards
>> Suman
>>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
