Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68C41A6A65
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 15:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729362AbfICNuo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 09:50:44 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53990 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729169AbfICNuo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Sep 2019 09:50:44 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x83DoVk7067535;
        Tue, 3 Sep 2019 08:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567518631;
        bh=glybkcFaeSv13hn8kobaPpNcJ7k9Wi7ag5McnzpQOME=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=B3jZFJE4E8JRUxvvH1s3f/SkeqFFGL955p8bAzXw4uJbyy6VtjnVVMdcAyUjw6rrC
         pcLiLFWGOPl+fJLFQjltEuQqGA4i9A9T8Ze3oAwq13lrbMRkK2LyA52JFQAmR+Y+ua
         yFUmqbzSoH3U7IphPqy7VPyBYyvqWq9jcfiCIajI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x83DoVkC079801
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Sep 2019 08:50:31 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 3 Sep
 2019 08:50:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 3 Sep 2019 08:50:30 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x83DoRIU003031;
        Tue, 3 Sep 2019 08:50:28 -0500
Subject: Re: [PATCHv3 01/10] dt-bindings: omap: add new binding for PRM
 instances
To:     Adam Ford <aford173@gmail.com>
CC:     Rob Herring <robh@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, Suman Anna <s-anna@ti.com>,
        <p.zabel@pengutronix.de>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>
References: <20190830121816.30034-1-t-kristo@ti.com>
 <20190830121816.30034-2-t-kristo@ti.com> <20190902042631.GA22055@bogus>
 <e8d700cd-8f3c-5cea-a022-b20a595fc1e1@ti.com>
 <CAHCN7xKNSj_DW+Gcbpy4ehphBYCbJw9mSATOcWzT7ZcZR81r6g@mail.gmail.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <e6fd5cd6-8176-55f9-5285-d52b84435649@ti.com>
Date:   Tue, 3 Sep 2019 16:50:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xKNSj_DW+Gcbpy4ehphBYCbJw9mSATOcWzT7ZcZR81r6g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 03/09/2019 16:19, Adam Ford wrote:
> On Tue, Sep 3, 2019 at 2:26 AM Tero Kristo <t-kristo@ti.com> wrote:
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
>>
>>>
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
>>
>>>
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
> 
> Would it make sense to call it am33 instead of am3?  The AM35xx is
> different than AM33.

Well, am35xx is effectively just a variant of omap3, they just named it 
funnily. Same for dra7 vs. am57xx. Also, bindings of type "ti,am3-*" 
exist for other am33xx functionality already.

-Tero

> 
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
>>
>>
>>
>>>
>>>> +- reg:              Contains PRM instance register address range
>>>> +            (base address and length)
>>>> +
>>>> +Optional properties:
>>>> +- #reset-cells:     Should be 1 if the PRM instance in question supports resets.
>>>> +- clocks:   Associated clocks for the reset signals if any. Certain reset
>>>> +            signals can't be toggled properly without functional clock
>>>> +            being active for them.
>>>> +
>>>> +Example:
>>>> +
>>>> +prm_dsp2: prm@1b00 {
>>>
>>> reset-controller@...
>>
>> Well, as said, the same node is going to be also power domain provider
>> later on...
>>
>>>
>>>> +    compatible = "ti,dra7-prm-inst";
>>>> +    reg = <0x1b00 0x40>;
>>>> +    #reset-cells = <1>;
>>>> +    clocks = <&dsp2_clkctrl DRA7_DSP2_MMU0_DSP2_CLKCTRL 0>;
>>>> +};
>>>> --
>>>> 2.17.1
>>>>
>>>> --
>>>
>>
> 
> adam
>> --

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
