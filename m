Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F33AE2BA6
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2019 10:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408844AbfJXIAx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Oct 2019 04:00:53 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39148 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732359AbfJXIAx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Oct 2019 04:00:53 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9O80luO014296;
        Thu, 24 Oct 2019 03:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571904047;
        bh=bGS0uz90T2nQETvPEtdlDAoR1cWSOEVj0vqWi7GguUs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=V3ELD5s1Pm+PGLcaSBfLL5Od242jYr4nDNiHiC68fZFi8xxYNlmk+Vht/gzPJrdx4
         wmhu3Lq2J+o8Jn5eFKLuPeyJmzw80/22lBSCw7COpgXTdInMeg2WL4dBtLd/DU44TH
         +Mp4bStR0+ScKudJANHn3/wlyqxHDzOVqviz+IW4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9O80lTe004080
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 24 Oct 2019 03:00:47 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 24
 Oct 2019 03:00:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 24 Oct 2019 03:00:36 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9O80i7O070607;
        Thu, 24 Oct 2019 03:00:44 -0500
Subject: Re: [PATCH] clk: ti: clkctrl: Fix failed to enable error with double
 udelay timeout
To:     Tony Lindgren <tony@atomide.com>, Keerthy <j-keerthy@ti.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
References: <20190930154001.46581-1-tony@atomide.com>
 <93a6448d-cece-a903-5c7e-ade793d62063@ti.com>
 <20191010140519.GV5610@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <4bd4fa4f-a7a0-1a01-a1c2-31d681d6ee5d@ti.com>
Date:   Thu, 24 Oct 2019 11:00:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010140519.GV5610@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/10/2019 17:05, Tony Lindgren wrote:
> * Keerthy <j-keerthy@ti.com> [191007 00:57]:
>>
>>
>> On 30/09/19 9:10 PM, Tony Lindgren wrote:
>>> Commit 3d8598fb9c5a ("clk: ti: clkctrl: use fallback udelay approach if
>>> timekeeping is suspended") added handling for cases when timekeeping is
>>> suspended. But looks like we can still get occasional "failed to enable"
>>> errors on the PM runtime resume path with udelay() returning faster than
>>> expected.
>>>
>>> With ti-sysc interconnect target module driver this leads into device
>>> failure with PM runtime failing with "failed to enable" clkctrl error.
>>>
>>> Let's fix the issue with a delay of two times the desired delay as in
>>> often done for udelay() to account for the inaccuracy.
>>
>> Tested for DS0 and rtc+ddr modes on am43 and ds0 on am33.
>>
>> Tested-by: Keerthy <j-keerthy@ti.com>
> 
> Thanks for testing. This one should be applied into v5.4-rc series
> please if no more comments.

Queued up for 5.4 fixes, thanks.

-Tero

> 
> Regards,
> 
> Tony
> 
>>> Fixes: 3d8598fb9c5a ("clk: ti: clkctrl: use fallback udelay approach if timekeeping is suspended")
>>> Cc: Keerthy <j-keerthy@ti.com>
>>> Cc: Tero Kristo <t-kristo@ti.com>
>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>>> ---
>>>    drivers/clk/ti/clkctrl.c | 5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
>>> --- a/drivers/clk/ti/clkctrl.c
>>> +++ b/drivers/clk/ti/clkctrl.c
>>> @@ -100,11 +100,12 @@ static bool _omap4_is_timeout(union omap4_timeout *time, u32 timeout)
>>>    	 * can be from a timer that requires pm_runtime access, which
>>>    	 * will eventually bring us here with timekeeping_suspended,
>>>    	 * during both suspend entry and resume paths. This happens
>>> -	 * at least on am43xx platform.
>>> +	 * at least on am43xx platform. Account for flakeyness
>>> +	 * with udelay() by multiplying the timeout value by 2.
>>>    	 */
>>>    	if (unlikely(_early_timeout || timekeeping_suspended)) {
>>>    		if (time->cycles++ < timeout) {
>>> -			udelay(1);
>>> +			udelay(1 * 2);
>>>    			return false;
>>>    		}
>>>    	} else {
>>>

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
