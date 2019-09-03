Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08F50A6266
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 09:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfICH0T (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 03:26:19 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49750 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfICH0S (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Sep 2019 03:26:18 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x837Pus7129827;
        Tue, 3 Sep 2019 02:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567495556;
        bh=DTmLVy2ziaAjBJ4cNhFcYLIyv/5BpnQYc8ZCnq8IR9Y=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SrANXdEFr3BINBZfGGN/JCp6nYyD/6bmihj8iUe3D4ISiL5Xv9FF3xmQUg2GyEeEQ
         kVwPsixx/oquGIU0eTuvlE7yr22TQbOEYFfi5VhBqIQ5Bmh3vS6d3VcPISZLgqyL20
         Y6aE2Qr4ttVQgfLJwYegcNktpGiNdI19RaoAZqzk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x837Putu117512
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Sep 2019 02:25:56 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 3 Sep
 2019 02:25:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 3 Sep 2019 02:25:55 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x837Prlb110987;
        Tue, 3 Sep 2019 02:25:53 -0500
Subject: Re: [PATCHv3 01/10] dt-bindings: omap: add new binding for PRM
 instances
To:     Rob Herring <robh@kernel.org>
CC:     <ssantosh@kernel.org>, <linux-omap@vger.kernel.org>,
        <tony@atomide.com>, <s-anna@ti.com>, <p.zabel@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
References: <20190830121816.30034-1-t-kristo@ti.com>
 <20190830121816.30034-2-t-kristo@ti.com> <20190902042631.GA22055@bogus>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <e8d700cd-8f3c-5cea-a022-b20a595fc1e1@ti.com>
Date:   Tue, 3 Sep 2019 10:25:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902042631.GA22055@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 02/09/2019 16:39, Rob Herring wrote:
> On Fri, Aug 30, 2019 at 03:18:07PM +0300, Tero Kristo wrote:
>> Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
>> of these will act as a power domain controller and potentially as a reset
>> provider.
>>
> 
> Converting this to schema would be nice.

Do you have documentation about schema somewhere? Basically what I need 
to do to fix this.

> 
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   .../devicetree/bindings/arm/omap/prm-inst.txt | 31 +++++++++++++++++++
> 
> bindings/reset/

I did not put this under reset, because this is basically a 
multi-purpose function. Reset just happens to be the first functionality 
it is going to provide. It will be followed by power domain support 
later on.

Any thoughts?

> 
>>   1 file changed, 31 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>> new file mode 100644
>> index 000000000000..7c7527c37734
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>> @@ -0,0 +1,31 @@
>> +OMAP PRM instance bindings
>> +
>> +Power and Reset Manager is an IP block on OMAP family of devices which
>> +handle the power domains and their current state, and provide reset
>> +handling for the domains and/or separate IP blocks under the power domain
>> +hierarchy.
>> +
>> +Required properties:
>> +- compatible:	Must be one of:
>> +		"ti,am3-prm-inst"
>> +		"ti,am4-prm-inst"
>> +		"ti,omap4-prm-inst"
>> +		"ti,omap5-prm-inst"
>> +		"ti,dra7-prm-inst"
> 
> '-inst' seems a bit redundant.

ti,xyz-prm is already reserved by the parent node of all these.

The hierarchy is basically like this (omap4 as example):

prm: prm@4a306000 {
   compatible = "ti,omap4-prm";
   ...

   prm_dsp: prm@400 {
     compatible = "ti,omap4-prm-inst";
     ...
   };

   prm_device: prm@1b00 {
     compatible = "ti,omap4-prm-inst";
     ...
   };

   ...
};



> 
>> +- reg:		Contains PRM instance register address range
>> +		(base address and length)
>> +
>> +Optional properties:
>> +- #reset-cells:	Should be 1 if the PRM instance in question supports resets.
>> +- clocks:	Associated clocks for the reset signals if any. Certain reset
>> +		signals can't be toggled properly without functional clock
>> +		being active for them.
>> +
>> +Example:
>> +
>> +prm_dsp2: prm@1b00 {
> 
> reset-controller@...

Well, as said, the same node is going to be also power domain provider 
later on...

> 
>> +	compatible = "ti,dra7-prm-inst";
>> +	reg = <0x1b00 0x40>;
>> +	#reset-cells = <1>;
>> +	clocks = <&dsp2_clkctrl DRA7_DSP2_MMU0_DSP2_CLKCTRL 0>;
>> +};
>> -- 
>> 2.17.1
>>
>> --
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
