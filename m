Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A95AE9204A
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 11:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfHSJ2j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 05:28:39 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50662 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfHSJ2j (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 05:28:39 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7J9ST5v094267;
        Mon, 19 Aug 2019 04:28:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566206909;
        bh=HGtxFvyXr5k21k3Vw4hs+J3eZoXEfv8iPVT8Ir7Om78=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Y+52lKgTCMut3kxNLKxT6noSbLG2YBlV2PI1gz+1x9wffhvj8p8flSv2TSf4KmKI9
         4FInvdAAKRZ/8pbWPhodsjKzXqkLDovwYDg2KrD9rmPmfYA8AS5WJpdSTGYe1iQ60G
         Mo4aSO/v3dJD/0bECQuPqjf0/IFxZx/SIwnBjf/A=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7J9STpQ077641
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Aug 2019 04:28:29 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 04:28:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 04:28:28 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7J9SQGj017750;
        Mon, 19 Aug 2019 04:28:26 -0500
Subject: Re: [PATCH 1/8] dt-bindings: omap: add new binding for PRM instances
To:     Keerthy <j-keerthy@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <1565164139-21886-2-git-send-email-t-kristo@ti.com>
 <6bf4194b-23c0-2de0-3f9c-e99195336dc7@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <aa5538ae-76b4-942b-dc98-6e55628cf36a@ti.com>
Date:   Mon, 19 Aug 2019 12:28:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6bf4194b-23c0-2de0-3f9c-e99195336dc7@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/08/2019 07:35, Keerthy wrote:
> 
> 
> On 07/08/19 1:18 PM, Tero Kristo wrote:
>> Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
>> of these will act as a power domain controller and potentially as a reset
>> provider.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   .../devicetree/bindings/arm/omap/prm-inst.txt      | 24 
>> ++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>   create mode 100644 
>> Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt 
>> b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>> new file mode 100644
>> index 0000000..e0ae87b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
>> @@ -0,0 +1,24 @@
>> +OMAP PRM instance bindings
>> +
>> +Power and Reset Manager is an IP block on OMAP family of devices which
>> +handle the power domains and their current state, and provide reset
>> +handling for the domains and/or separate IP blocks under the power 
>> domain
>> +hierarchy.
>> +
>> +Required properties:
>> +- compatible:    Must be one of:
>> +        "ti,am3-prm-inst"
>> +        "ti,am4-prm-inst"
>> +        "ti,omap4-prm-inst"
>> +        "ti,omap5-prm-inst"
>> +        "ti,dra7-prm-inst"
>> +- reg:        Contains PRM instance register address range
>> +        (base address and length)
> 
> How about reset-cells property, Isn't that a mandatory property?

It is optional, but you are right, should be added to this.

-Tero

> 
>> +
>> +Example:
>> +
>> +prm_dsp2: prm@1b00 {
>> +    compatible = "ti,dra7-prm-inst";
>> +    reg = <0x1b00 0x40>;
>> +    #reset-cells = <1>;
>> +};
>>

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
