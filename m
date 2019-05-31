Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F03530DC2
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2019 14:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfEaMEi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 31 May 2019 08:04:38 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:34080 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfEaMEi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 31 May 2019 08:04:38 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4VC4TTI117248;
        Fri, 31 May 2019 07:04:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559304269;
        bh=rlE7J+DFRfJnFGPTUHYB3E0MgfOvRLqRsYOcEw4ujHQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JOUgheJZGvEQh3lnmfyZz/pOqYDaXbsjGQvIYXBmzcdG6518NDhX7CoxaL5CP7tmR
         fl7DL6LMhpgSohnbFbTySDCIakoIkGEShgS+/NTvoatMOUf+U+nM+iOc1ICo6vkfuO
         ehOberKU8A9HDJiJymJcH1Fq3QSP0k4qXCeutLy0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4VC4Tob064540
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 31 May 2019 07:04:29 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 31
 May 2019 07:04:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 31 May 2019 07:04:28 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4VC4Rbr009149;
        Fri, 31 May 2019 07:04:27 -0500
Subject: Re: [PATCH] clk: ti: clkctrl: Fix returning uninitialized data
To:     Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20190530065557.42741-1-tony@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <47c47d4f-54fe-956d-7936-eb4bc651c464@ti.com>
Date:   Fri, 31 May 2019 15:04:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530065557.42741-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/05/2019 09:55, Tony Lindgren wrote:
> If we do a clk_get() for a clock that does not exists, we have
> _ti_omap4_clkctrl_xlate() return uninitialized data if no match
> is found. This can be seen in some cases with SLAB_DEBUG enabled:
> 
> Unable to handle kernel paging request at virtual address 5a5a5a5a
> ...
> clk_hw_create_clk.part.33
> sysc_notifier_call
> notifier_call_chain
> blocking_notifier_call_chain
> device_add
> 
> Let's fix this by setting a found flag only when we find a match.
> 
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Fixes: 88a172526c32 ("clk: ti: add support for clkctrl clocks")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/clk/ti/clkctrl.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

I can boot again with this fix, thanks!

Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
