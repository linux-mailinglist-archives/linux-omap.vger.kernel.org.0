Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE34958C0
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2019 09:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbfHTHqK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Aug 2019 03:46:10 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:59930 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfHTHqJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Aug 2019 03:46:09 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7K7k3bv098380;
        Tue, 20 Aug 2019 02:46:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566287163;
        bh=1WWOCuKvAKIkqQJVS+YQn04mQIvtXgGAzqkiaS8xpqg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=X2vjbuJTyQJSiUu0gSrdIXJvktO6ZWz6YymAaIi3tcVpAGJGgWHupBNAq7+wCEC3q
         aGBUD38CAg4EKe28eJ4LL/uGbLZJLMacr7yx2egs52EUBuHIxQcjruskGasWEcqo03
         b9m6pq53aB5YMwzP/VjGryMrlkp5eKOBS125zpig=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7K7k3Km062802
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 02:46:03 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 02:46:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 02:46:01 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7K7jx5x103222;
        Tue, 20 Aug 2019 02:45:59 -0500
Subject: Re: [PATCH 1/8] dt-bindings: omap: add new binding for PRM instances
To:     Suman Anna <s-anna@ti.com>, Keerthy <j-keerthy@ti.com>,
        <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <1565164139-21886-2-git-send-email-t-kristo@ti.com>
 <6bf4194b-23c0-2de0-3f9c-e99195336dc7@ti.com>
 <aa5538ae-76b4-942b-dc98-6e55628cf36a@ti.com>
 <b6506850-f4fc-43be-b5b7-b83cd77b5d66@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <c485156c-735f-40d3-d6a9-1b277e9c3d1d@ti.com>
Date:   Tue, 20 Aug 2019 10:45:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b6506850-f4fc-43be-b5b7-b83cd77b5d66@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20.8.2019 0.28, Suman Anna wrote:
> Hi Tero,
> 
> On 8/19/19 4:28 AM, Tero Kristo wrote:
>> On 08/08/2019 07:35, Keerthy wrote:
>>>
>>>
>>> On 07/08/19 1:18 PM, Tero Kristo wrote:
>>>> Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
>>>> of these will act as a power domain controller and potentially as a
>>>> reset
>>>> provider.
>>>>
>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>> ---
>>>>    .../devicetree/bindings/arm/omap/prm-inst.txt      | 24
>>>> ++++++++++++++++++++++
>>>>    1 file changed, 24 insertions(+)
>>>>    create mode 100644
>>>> Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>>>> b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>>>> new file mode 100644
>>>> index 0000000..e0ae87b
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>>>> @@ -0,0 +1,24 @@
>>>> +OMAP PRM instance bindings
>>>> +
>>>> +Power and Reset Manager is an IP block on OMAP family of devices which
>>>> +handle the power domains and their current state, and provide reset
>>>> +handling for the domains and/or separate IP blocks under the power
>>>> domain
>>>> +hierarchy.
> 
> So, I see that you are adding these as flat nodes directly under the prm
> nodes where we have the clocks and clock_domains. Are you anticipating a
> single DT node and/or driver managing both power-domains and resets?

Single DT node + driver for both power-domains / resets. You can 
probably see from the driver code that the reset probing is called 
separately from the main probe function; power domain support should be 
added in similar manner under it.

> 
>>>> +
>>>> +Required properties:
>>>> +- compatible:    Must be one of:
>>>> +        "ti,am3-prm-inst"
>>>> +        "ti,am4-prm-inst"
>>>> +        "ti,omap4-prm-inst"
>>>> +        "ti,omap5-prm-inst"
>>>> +        "ti,dra7-prm-inst"
> 
> What about OMAP2, OMAP3, DM814x, DM816x?

OMAP2/3 architectures are slightly different beast to tackle, so 
planning to work on those later on.

-Tero

> 
> regards
> Suman
> 
>>>> +- reg:        Contains PRM instance register address range
>>>> +        (base address and length)
>>>
>>> How about reset-cells property, Isn't that a mandatory property?
>>
>> It is optional, but you are right, should be added to this.
>>
>> -Tero
>>
>>>
>>>> +
>>>> +Example:
>>>> +
>>>> +prm_dsp2: prm@1b00 {
>>>> +    compatible = "ti,dra7-prm-inst";
>>>> +    reg = <0x1b00 0x40>;
>>>> +    #reset-cells = <1>;
>>>> +};
>>>>
>>
>> -- 
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
