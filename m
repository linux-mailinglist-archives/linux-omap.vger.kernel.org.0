Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A822E0994
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731936AbfJVQru (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:47:50 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37768 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732047AbfJVQrt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Oct 2019 12:47:49 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9MGlhff069514;
        Tue, 22 Oct 2019 11:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571762863;
        bh=ce8FOh3cwlWZFfoSK6GpsH7q/F5l+sajBNC3YoD6EF0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=UzHWIWAJiHFTn9e8kB8JI1DOPDWPGdrJ/LSUaNd75bmO4iw7wJw2CWvp7aJFICIdj
         iD/h0xUS5yfaUS3wio5zR2BRpsf0c5CObYxwU/DwkF25uW4Cu2LlUqN5GBrULrQY3K
         KVxiWE+qEZM44GZx+mXM58yFxswmoa/5ZHBD7008=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9MGlhxU062175
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Oct 2019 11:47:43 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 22
 Oct 2019 11:47:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 22 Oct 2019 11:47:32 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9MGleRO075348;
        Tue, 22 Oct 2019 11:47:40 -0500
Subject: Re: [Patch 1/3] ARM: dts: am43xx: add support for clkout1 clock
To:     Benoit Parrot <bparrot@ti.com>, Tony Lindgren <tony@atomide.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191016184954.14048-1-bparrot@ti.com>
 <20191016184954.14048-2-bparrot@ti.com> <20191022154816.GO5610@atomide.com>
 <20191022162134.fpawonjdjvd5kxza@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <586dcabb-0400-50d6-5488-16bddc059286@ti.com>
Date:   Tue, 22 Oct 2019 19:47:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191022162134.fpawonjdjvd5kxza@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 22/10/2019 19:21, Benoit Parrot wrote:
> Tony Lindgren <tony@atomide.com> wrote on Tue [2019-Oct-22 08:48:16 -0700]:
>> * Benoit Parrot <bparrot@ti.com> [191016 18:47]:
>>> --- a/arch/arm/boot/dts/am43xx-clocks.dtsi
>>> +++ b/arch/arm/boot/dts/am43xx-clocks.dtsi
>>> @@ -704,6 +704,60 @@
>>>   		ti,bit-shift = <8>;
>>>   		reg = <0x2a48>;
>>>   	};
>>> +
>>> +	clkout1_osc_div_ck: clkout1_osc_div_ck {
>>> +		#clock-cells = <0>;
>>> +		compatible = "ti,divider-clock";
>>> +		clocks = <&sys_clkin_ck>;
>>> +		ti,bit-shift = <20>;
>>> +		ti,max-div = <4>;
>>> +		reg = <0x4100>;
>>> +	};
>>
>> Here too please describe why the clock names are not generic.
> 
> Tero originally had this patch in the kernel so this is somewhat of a
> revert. Since these "clock" were removed. If the name syntax is no longer
> valid for some reason, then I will need a little more informations to
> proceed.
> 
> Tero, can you assist here?

This one is just following the naming convention of the rest of the 
clocks atm.

If we need to fix all the underscore name clocks, that requires pretty 
much complete revamp of both the dts data + clock data under the clock 
driver, and it is not backwards compatible either. How should we tackle 
that one?

We could maybe add support code in kernel to do s/-/_/g for the "new" 
clocks so that their parent-child relationships would be retained, and 
then convert the clocks in phases.

-Tero

> 
> Benoit
> 
>>
>> Regards,
>>
>> Tony

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
