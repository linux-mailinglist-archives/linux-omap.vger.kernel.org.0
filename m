Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 282CDA63A2
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 10:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbfICIOe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 04:14:34 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56006 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728086AbfICIOe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Sep 2019 04:14:34 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x838ENdC065609;
        Tue, 3 Sep 2019 03:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567498463;
        bh=sH7OXIfVbmynYl8JstWq7QvQsliKlzK9lycCODoHIm0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=pleDUQLd+kWHZHKqaX73LsWtA+FGHiuHS6RsyS4WpWG0wch3pp3PwlYYjG9X5k086
         fVyP0MgDet973l3/vz2/KA5tXw/Qb0Aks8OMZqNEaz90+vQkIb+Ljoi39gczF3lUuS
         z2A0LANiH8YhQxtlA31KJXRLe3WGwKcKsBmmAtxo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x838EN7e052004
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Sep 2019 03:14:23 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 3 Sep
 2019 03:14:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 3 Sep 2019 03:14:22 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x838EKuv036647;
        Tue, 3 Sep 2019 03:14:20 -0500
Subject: Re: [PATCHv3 01/10] dt-bindings: omap: add new binding for PRM
 instances
To:     Rob Herring <robh@kernel.org>
CC:     Santosh Shilimkar <ssantosh@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, Suman Anna <s-anna@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
References: <20190830121816.30034-1-t-kristo@ti.com>
 <20190830121816.30034-2-t-kristo@ti.com> <20190902042631.GA22055@bogus>
 <e8d700cd-8f3c-5cea-a022-b20a595fc1e1@ti.com>
 <CAL_Jsq+AJj1bgOQYG=c86A5HC_g2UZph387oVEKZyP4M18kURw@mail.gmail.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <7c2c8a4d-d24e-ceec-afc1-04cdc4d5d952@ti.com>
Date:   Tue, 3 Sep 2019 11:14:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+AJj1bgOQYG=c86A5HC_g2UZph387oVEKZyP4M18kURw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 03/09/2019 11:10, Rob Herring wrote:
> On Tue, Sep 3, 2019 at 8:26 AM Tero Kristo <t-kristo@ti.com> wrote:
>>
>> On 02/09/2019 16:39, Rob Herring wrote:
>>> On Fri, Aug 30, 2019 at 03:18:07PM +0300, Tero Kristo wrote:
>>>> Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
>>>> of these will act as a power domain controller and potentially as a reset
>>>> provider.
>>>>
>>>
>>> Converting this to schema would be nice.
>>
>> Do you have documentation about schema somewhere? Basically what I need
>> to do to fix this.
> 
> Documentation/devicetree/writing-schema.md (.rst in -next)
> Documentation/devicetree/bindings/example-schema.yaml
> 
>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>> ---
>>>>    .../devicetree/bindings/arm/omap/prm-inst.txt | 31 +++++++++++++++++++
>>>
>>> bindings/reset/
>>
>> I did not put this under reset, because this is basically a
>> multi-purpose function. Reset just happens to be the first functionality
>> it is going to provide. It will be followed by power domain support
>> later on.
>>
>> Any thoughts?
> 
> I prefer that bindings be complete as possible even if driver support
> is not there yet. Adding power domain support may only mean adding
> '#power-domain-cells'.
> 
> The location is fine then.

Yeah, I assume just adding power-domain-cells should be enough. I am not 
too sure before I start trying this out though so did not want to add it 
yet.

> 
>>>>    1 file changed, 31 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>>>> new file mode 100644
>>>> index 000000000000..7c7527c37734
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>>>> @@ -0,0 +1,31 @@
>>>> +OMAP PRM instance bindings
>>>> +
>>>> +Power and Reset Manager is an IP block on OMAP family of devices which
>>>> +handle the power domains and their current state, and provide reset
>>>> +handling for the domains and/or separate IP blocks under the power domain
>>>> +hierarchy.
>>>> +
>>>> +Required properties:
>>>> +- compatible:       Must be one of:
>>>> +            "ti,am3-prm-inst"
>>>> +            "ti,am4-prm-inst"
>>>> +            "ti,omap4-prm-inst"
>>>> +            "ti,omap5-prm-inst"
>>>> +            "ti,dra7-prm-inst"
>>>
>>> '-inst' seems a bit redundant.
>>
>> ti,xyz-prm is already reserved by the parent node of all these.
>>
>> The hierarchy is basically like this (omap4 as example):
>>
>> prm: prm@4a306000 {
>>     compatible = "ti,omap4-prm";
>>     ...
>>
>>     prm_dsp: prm@400 {
>>       compatible = "ti,omap4-prm-inst";
>>       ...
>>     };
>>
>>     prm_device: prm@1b00 {
>>       compatible = "ti,omap4-prm-inst";
>>       ...
>>     };
>>
>>     ...
>> };
> 
> Okay. Then you need to state this binding must be a child of PRM. The
> schema would need to take this into account too, so probably best to
> not convert this yet.
> 

Ok thanks, I'll make the necessary updates and post v4.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
