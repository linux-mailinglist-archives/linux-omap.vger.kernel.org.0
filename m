Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 370FC8563B
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 00:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729938AbfHGW5D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 18:57:03 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36146 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729934AbfHGW5D (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 18:57:03 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77MuxQT071522;
        Wed, 7 Aug 2019 17:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565218619;
        bh=vBqecGmGLXrk1xJPdBNtDgOsDujQPp1amdCZD9wkXp0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=QPdOL3THUYlGpN/WjkjqRyKy2pNUESv3GUgWevWxV5u87FMIHnVbGD5CMOyyA/scY
         +NL5gqBY4lW8kYpBdwYKZknE9iF8JVNlFGPY19gjDo8Bv+i1mgy+3jBUVNYRXsdKBn
         noWnHdRVcFyBAFi01vaVhrCZe/ooFowYalqiN5+M=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77MuxZv112414
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 17:56:59 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 17:56:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 17:56:59 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77Muxfp119836;
        Wed, 7 Aug 2019 17:56:59 -0500
Subject: Re: [PATCH 3/3] clk: ti: dra7xx: add timer_sys_ck clock alias
To:     Tero Kristo <t-kristo@ti.com>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
 <1565183079-27798-4-git-send-email-t-kristo@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <9d0edab4-cae2-50d5-2df9-42c879f2623f@ti.com>
Date:   Wed, 7 Aug 2019 17:56:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1565183079-27798-4-git-send-email-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tero,

On 8/7/19 8:04 AM, Tero Kristo wrote:
> This is needed by the TI DM timer driver.

Again can do with some better patch descriptions. Similar to the
previous patch, missing the equivalent patches for OMAP4 and OMAP5.
You can use my downstream patches for these - [1][2][3] that has all the
needed Fixes by details. Only difference is that you used a single line
change on DRA7, and this should suffice since all the sources are same,
but OMAP4 and OMAP5 needed different ones.

[1] OMAP4:
http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=9d45dc42fbed8395d733366dbf6c0fd5ec171e2f
[2] OMAP5:
http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=34f4682a91173386307b310d7f4955d46dcaaea2
[3] DRA7:
http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=2a662694437ae7192b5ef759ec40abe796d2a058

Technically, this data need to be added back for all OMAP2+ SoCs which
support dmtimer with any other drivers wanting to use the timers.

regards
Suman

> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/clk/ti/clk-7xx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
> index 5208eb8..64507b8 100644
> --- a/drivers/clk/ti/clk-7xx.c
> +++ b/drivers/clk/ti/clk-7xx.c
> @@ -792,6 +792,7 @@
>  static struct ti_dt_clk dra7xx_clks[] = {
>  	DT_CLK(NULL, "timer_32k_ck", "sys_32k_ck"),
>  	DT_CLK(NULL, "sys_clkin_ck", "timer_sys_clk_div"),
> +	DT_CLK(NULL, "timer_sys_ck", "timer_sys_clk_div"),
>  	DT_CLK(NULL, "sys_clkin", "sys_clkin1"),
>  	DT_CLK(NULL, "atl_dpll_clk_mux", "atl-clkctrl:0000:24"),
>  	DT_CLK(NULL, "atl_gfclk_mux", "atl-clkctrl:0000:26"),
> 

