Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B521785631
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 00:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729976AbfHGWuU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 18:50:20 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54470 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729753AbfHGWuU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 18:50:20 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77MoGvT030453;
        Wed, 7 Aug 2019 17:50:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565218216;
        bh=8Lqi53jpEJsclSI6SOzf9YuGlblcPNpDC/BJSXqKtXs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=mUhHr1CaASaX8CnMpHFV7tLHDheCIA5gW+u5QBWJMhTlTThJeXZpXRPQF0hbMhK1d
         A91k1zAmZmjioZvtQ1a0JeU/zL4lLoUpDsrjxktEPvPrk8SICbuvT9s+sLZk+xfhkW
         qRYG04OiScdXt0WppPQ5g5ecx2pOMNSoxGXZbfU8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77MoGbE104789
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 17:50:16 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 17:50:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 17:50:15 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77MoFmX111972;
        Wed, 7 Aug 2019 17:50:15 -0500
Subject: Re: [PATCH 2/3] clk: ti: dra7xx: remove idlest polling from disabling
 ipu/dsp clocks
To:     Tero Kristo <t-kristo@ti.com>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
 <1565183079-27798-3-git-send-email-t-kristo@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <932d4ef2-7259-24a9-9a53-c5fcf751ea1b@ti.com>
Date:   Wed, 7 Aug 2019 17:50:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1565183079-27798-3-git-send-email-t-kristo@ti.com>
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
> These cause some unwanted timeouts in the kernel, as they depend on
> reset and the execution state of the remotecore itself. These details
> should be handled by the driver with proper sequencing of events.

This can definitely do with some better patch description. What about
the changes to the OMAP4 and OMAP5 files? Please see my equivalent
downstream patches [1][2][3] for the same though they are using the
CLKF_NO_IDLEST flag.

regards
Suman

[1] OMAP4:
http://git.ti.com/gitweb/?p=rpmsg/iommu.git;a=commit;h=1979318da6f76809a5e6d652f814b2e80836aa21
[2] OMAP5:
http://git.ti.com/gitweb/?p=rpmsg/iommu.git;a=commit;h=69b31b56ceffdec3aed5b0feaa06090f8ee318b6
[3] DRA7:
http://git.ti.com/gitweb/?p=rpmsg/iommu.git;a=commit;h=a26129c10cda1d64bec3cd7a03b9acd447df84ea
(portions of this patch content are already upstream, the delta being
these additional flags).

> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/clk/ti/clk-7xx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
> index b57fe09..5208eb8 100644
> --- a/drivers/clk/ti/clk-7xx.c
> +++ b/drivers/clk/ti/clk-7xx.c
> @@ -25,7 +25,7 @@
>  };
>  
>  static const struct omap_clkctrl_reg_data dra7_dsp1_clkctrl_regs[] __initconst = {
> -	{ DRA7_DSP1_MMU0_DSP1_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_dsp_m2_ck" },
> +	{ DRA7_DSP1_MMU0_DSP1_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLE_POLL, "dpll_dsp_m2_ck" },
>  	{ 0 },
>  };
>  
> @@ -41,7 +41,7 @@
>  };
>  
>  static const struct omap_clkctrl_reg_data dra7_ipu1_clkctrl_regs[] __initconst = {
> -	{ DRA7_IPU1_MMU_IPU1_CLKCTRL, dra7_mmu_ipu1_bit_data, CLKF_HW_SUP, "ipu1-clkctrl:0000:24" },
> +	{ DRA7_IPU1_MMU_IPU1_CLKCTRL, dra7_mmu_ipu1_bit_data, CLKF_HW_SUP | CLKF_NO_IDLE_POLL, "ipu1-clkctrl:0000:24" },
>  	{ 0 },
>  };
>  
> @@ -137,7 +137,7 @@
>  };
>  
>  static const struct omap_clkctrl_reg_data dra7_dsp2_clkctrl_regs[] __initconst = {
> -	{ DRA7_DSP2_MMU0_DSP2_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_dsp_m2_ck" },
> +	{ DRA7_DSP2_MMU0_DSP2_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLE_POLL, "dpll_dsp_m2_ck" },
>  	{ 0 },
>  };
>  
> @@ -164,7 +164,7 @@
>  };
>  
>  static const struct omap_clkctrl_reg_data dra7_ipu2_clkctrl_regs[] __initconst = {
> -	{ DRA7_IPU2_MMU_IPU2_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_core_h22x2_ck" },
> +	{ DRA7_IPU2_MMU_IPU2_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLE_POLL, "dpll_core_h22x2_ck" },
>  	{ 0 },
>  };
>  
> 

