Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63BDFB482D
	for <lists+linux-omap@lfdr.de>; Tue, 17 Sep 2019 09:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731852AbfIQHVi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Sep 2019 03:21:38 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40816 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727635AbfIQHVi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Sep 2019 03:21:38 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8H7LUSd076245;
        Tue, 17 Sep 2019 02:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568704890;
        bh=RAkpzZsEDglibwdEPo3aXr82N6h6m4WxV5LdwMT3tDg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vSF/uH2HJmxWPAdhsiTMNCbwSA02mNRXIKlej8yUg+9MlQP3rjzZehkOjmBXCOMnc
         sfZYAiNtuK/svlYTf2jH+jtZhjzN4/IbNVRzPWAG9ko4Gvdu1x2R+eDKjlsK69tT7Q
         WtXpkhbGqcpQ6TDcRoSBWmtr1ArkzSNF3itNIQi4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8H7LUAH093699
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Sep 2019 02:21:30 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 17
 Sep 2019 02:21:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 17 Sep 2019 02:21:27 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8H7LQZi109183;
        Tue, 17 Sep 2019 02:21:26 -0500
Subject: Re: [PATCH 5/8] ARM: dts: Drop bogus ahclkr clocks for dra7 mcasp 3
 to 8
To:     Tony Lindgren <tony@atomide.com>, Suman Anna <s-anna@ti.com>
CC:     <linux-omap@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190723112811.44381-1-tony@atomide.com>
 <20190723112811.44381-6-tony@atomide.com>
 <2c750847-700e-c835-ee53-a656b363c36c@ti.com>
 <20190724064758.GU5447@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <931eb0e1-8024-3003-1fb3-6f6ad8b74bf9@ti.com>
Date:   Tue, 17 Sep 2019 10:21:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724064758.GU5447@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 24/07/2019 09:47, Tony Lindgren wrote:
> * Suman Anna <s-anna@ti.com> [190723 21:02]:
>> Hi Tony,
>>
>> On 7/23/19 6:28 AM, Tony Lindgren wrote:
>>> The ahclkr clkctrl clock bit 28 only exists for mcasp 1 and 2 on dra7.
>>> Otherwise we get the following warning on beagle-x15:
> ...
>>> @@ -2962,9 +2958,8 @@
>>>   					<SYSC_IDLE_SMART>;
>>>   			/* Domains (P, C): l4per_pwrdm, l4per2_clkdm */
>>>   			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 0>,
>>> -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 24>,
>>> -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 28>;
>>> -			clock-names = "fck", "ahclkx", "ahclkr";
>>> +				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 24>;
>>> +			clock-names = "fck", "ahclkx";
>>
>> The equivalent change to MCASP8 is missing.
> 
> Thanks for spotting it, probably should be set up the same way as
> MCASP4 too looking at the TRM.
> 
> Tero, care to check the dra7 mcasp clocks we have defined?

Sorry, missed this earlier.

> 
> $ grep MCASP drivers/clk/ti/clk-7xx.c
>          { DRA7_IPU_MCASP1_CLKCTRL, dra7_mcasp1_bit_data, CLKF_SW_SUP, "ipu-clkctrl:0000:22" },
>          { DRA7_L4PER2_MCASP2_CLKCTRL, dra7_mcasp2_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:0154:22" },
>          { DRA7_L4PER2_MCASP3_CLKCTRL, dra7_mcasp3_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:015c:22" },
>          { DRA7_L4PER2_MCASP5_CLKCTRL, dra7_mcasp5_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:016c:22" },
>          { DRA7_L4PER2_MCASP8_CLKCTRL, dra7_mcasp8_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:0184:24" },
>          { DRA7_L4PER2_MCASP4_CLKCTRL, dra7_mcasp4_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:018c:22" },
>          { DRA7_L4PER2_MCASP6_CLKCTRL, dra7_mcasp6_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:01f8:22" },
>          { DRA7_L4PER2_MCASP7_CLKCTRL, dra7_mcasp7_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:01fc:22" },
> 
> Is bit 24 above correct for MCASP8 or should it too be 22 like
> adjacent MCASP4 in the TRM?

So yeah, mcasp8 is wrong here, should be 22 as rest of them. I did fix 
mcasp8 clocks partially when doing the conversion but missed the 
parenting here; it was completely broken before.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
