Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA7DCDA03
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 02:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfJGA5I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Oct 2019 20:57:08 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52726 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbfJGA5I (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 6 Oct 2019 20:57:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x970v1Th104895;
        Sun, 6 Oct 2019 19:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570409821;
        bh=y1PP9ltrxnowjAkMcLF1tzTezdMwJrZBzBpXFZIAsDU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=s1j6LSdxWXh1k2aIaVOCPbuvP0zSKvG35A7Gk8QtC90iWgvTx7iCE3RpIuK8jSIsL
         S0oQf6WlAEPrxzGDUKfQKbMCYpK4CTiQ0HT6bkT5YdDXtSswOOWXjVrMq3QhSVICFs
         xKyVHhgdg9K8KkxGR5ixDPNrsi01n5UGFTRFOYTQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x970v1Ij088111
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 6 Oct 2019 19:57:01 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 6 Oct
 2019 19:56:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 6 Oct 2019 19:56:59 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x970uwtd085060;
        Sun, 6 Oct 2019 19:56:59 -0500
Subject: Re: [PATCH] clk: ti: clkctrl: Fix failed to enable error with double
 udelay timeout
To:     Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
References: <20190930154001.46581-1-tony@atomide.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <93a6448d-cece-a903-5c7e-ade793d62063@ti.com>
Date:   Mon, 7 Oct 2019 06:27:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930154001.46581-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 30/09/19 9:10 PM, Tony Lindgren wrote:
> Commit 3d8598fb9c5a ("clk: ti: clkctrl: use fallback udelay approach if
> timekeeping is suspended") added handling for cases when timekeeping is
> suspended. But looks like we can still get occasional "failed to enable"
> errors on the PM runtime resume path with udelay() returning faster than
> expected.
> 
> With ti-sysc interconnect target module driver this leads into device
> failure with PM runtime failing with "failed to enable" clkctrl error.
> 
> Let's fix the issue with a delay of two times the desired delay as in
> often done for udelay() to account for the inaccuracy.

Tested for DS0 and rtc+ddr modes on am43 and ds0 on am33.

Tested-by: Keerthy <j-keerthy@ti.com>

> 
> Fixes: 3d8598fb9c5a ("clk: ti: clkctrl: use fallback udelay approach if timekeeping is suspended")
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/clk/ti/clkctrl.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> --- a/drivers/clk/ti/clkctrl.c
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -100,11 +100,12 @@ static bool _omap4_is_timeout(union omap4_timeout *time, u32 timeout)
>   	 * can be from a timer that requires pm_runtime access, which
>   	 * will eventually bring us here with timekeeping_suspended,
>   	 * during both suspend entry and resume paths. This happens
> -	 * at least on am43xx platform.
> +	 * at least on am43xx platform. Account for flakeyness
> +	 * with udelay() by multiplying the timeout value by 2.
>   	 */
>   	if (unlikely(_early_timeout || timekeeping_suspended)) {
>   		if (time->cycles++ < timeout) {
> -			udelay(1);
> +			udelay(1 * 2);
>   			return false;
>   		}
>   	} else {
> 
