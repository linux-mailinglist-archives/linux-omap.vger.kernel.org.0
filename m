Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC0094FDF
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 23:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbfHSV2Y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 17:28:24 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53728 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728360AbfHSV2Y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 17:28:24 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JLSHOH059039;
        Mon, 19 Aug 2019 16:28:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566250097;
        bh=R3CvKhP4vQcqtfj3+dD7nsaUpdCV96/Wikeo+l/e9ws=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=uFH95b4N2VRdDSL7vwHs1MePP6TEAL4awQvQmeXeicuTPRHcqvC0ppxDQmNshXQil
         JFpa/rB9GoELhr+u7P0YEDgKbf95UodNIgb8sc0UyzD/7lAFdOLOlQfRoIie5FCxe7
         f7oOLEXWXvcmO9IcCdn+Kh4TWdcqiPCeccTS/VjM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JLSGjC052868
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Aug 2019 16:28:17 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 16:28:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 16:28:16 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JLSGgL033121;
        Mon, 19 Aug 2019 16:28:16 -0500
Subject: Re: [PATCH 1/8] dt-bindings: omap: add new binding for PRM instances
To:     Tero Kristo <t-kristo@ti.com>, Keerthy <j-keerthy@ti.com>,
        <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <1565164139-21886-2-git-send-email-t-kristo@ti.com>
 <6bf4194b-23c0-2de0-3f9c-e99195336dc7@ti.com>
 <aa5538ae-76b4-942b-dc98-6e55628cf36a@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <b6506850-f4fc-43be-b5b7-b83cd77b5d66@ti.com>
Date:   Mon, 19 Aug 2019 16:28:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <aa5538ae-76b4-942b-dc98-6e55628cf36a@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tero,

On 8/19/19 4:28 AM, Tero Kristo wrote:
> On 08/08/2019 07:35, Keerthy wrote:
>>
>>
>> On 07/08/19 1:18 PM, Tero Kristo wrote:
>>> Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
>>> of these will act as a power domain controller and potentially as a
>>> reset
>>> provider.
>>>
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>> ---
>>>   .../devicetree/bindings/arm/omap/prm-inst.txt      | 24
>>> ++++++++++++++++++++++
>>>   1 file changed, 24 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>>> b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>>> new file mode 100644
>>> index 0000000..e0ae87b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>>> @@ -0,0 +1,24 @@
>>> +OMAP PRM instance bindings
>>> +
>>> +Power and Reset Manager is an IP block on OMAP family of devices which
>>> +handle the power domains and their current state, and provide reset
>>> +handling for the domains and/or separate IP blocks under the power
>>> domain
>>> +hierarchy.

So, I see that you are adding these as flat nodes directly under the prm
nodes where we have the clocks and clock_domains. Are you anticipating a
single DT node and/or driver managing both power-domains and resets?

>>> +
>>> +Required properties:
>>> +- compatible:    Must be one of:
>>> +        "ti,am3-prm-inst"
>>> +        "ti,am4-prm-inst"
>>> +        "ti,omap4-prm-inst"
>>> +        "ti,omap5-prm-inst"
>>> +        "ti,dra7-prm-inst"

What about OMAP2, OMAP3, DM814x, DM816x?

regards
Suman

>>> +- reg:        Contains PRM instance register address range
>>> +        (base address and length)
>>
>> How about reset-cells property, Isn't that a mandatory property?
> 
> It is optional, but you are right, should be added to this.
> 
> -Tero
> 
>>
>>> +
>>> +Example:
>>> +
>>> +prm_dsp2: prm@1b00 {
>>> +    compatible = "ti,dra7-prm-inst";
>>> +    reg = <0x1b00 0x40>;
>>> +    #reset-cells = <1>;
>>> +};
>>>
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

