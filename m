Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D50343E5E3
	for <lists+linux-omap@lfdr.de>; Thu, 28 Oct 2021 18:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhJ1QQP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Oct 2021 12:16:15 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49774 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhJ1QQP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Oct 2021 12:16:15 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19SGDeS2030834;
        Thu, 28 Oct 2021 11:13:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1635437620;
        bh=pI0yHc6XTcgYHPhLtXb2y50dHeqyz7E4utF5ILrdwL8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ieWKMO4TWyDWAYbzPaNpsTK+FMQ69WNt4n7tcwyjvG73qYhKmqYX2S2x2UBPv2rea
         3Y0ZJf0Jd77BiGEQMcDoGneUMNbD0k8SgWTyeXz2squudPOHY1ZR/Q/JqBBVb3yx9j
         Y1XEaD9KLvww18WwCHJsMxwuc1FjJWoUcmnaQCMo=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19SGDex5078133
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 28 Oct 2021 11:13:40 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Oct 2021 11:13:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Oct 2021 11:13:40 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19SGDc50007286;
        Thu, 28 Oct 2021 11:13:39 -0500
Subject: Re: DRA7 clock question
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tero Kristo <kristo@kernel.org>,
        Tony Lindgren <tony@atomide.com>
CC:     linux-clk <linux-clk@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>
References: <CAMuHMdUjdQrwV-dP=8n1NQ_AZU7-oAjhmVv2hZBEJHQF5zynCQ@mail.gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <d0c128b2-8de1-85b6-52d0-21f7346a98bd@ti.com>
Date:   Thu, 28 Oct 2021 19:13:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUjdQrwV-dP=8n1NQ_AZU7-oAjhmVv2hZBEJHQF5zynCQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 28/10/2021 18:16, Geert Uytterhoeven wrote:
> Hi Tero, Tony,
> 
> I accidentally stumbled across the following code in drivers/clk/ti/apll.c:
> 
>      static int dra7_apll_enable(struct clk_hw *hw)
>      {
>              struct clk_hw_omap *clk = to_clk_hw_omap(hw);
>              int r = 0, i = 0;
>              struct dpll_data *ad;
>              const char *clk_name;
>              u8 state = 1;
>              u32 v;
> 
>              ad = clk->dpll_data;
>              if (!ad)
>                      return -EINVAL;
> 
>              clk_name = clk_hw_get_name(&clk->hw);
> 
>              state <<= __ffs(ad->idlest_mask);
> 
> state is shifted to its bit position...
> 
>              /* Check is already locked */
>              v = ti_clk_ll_ops->clk_readl(&ad->idlest_reg);
> 
>              if ((v & ad->idlest_mask) == state)
> 
> ... and checked.
> 
>                      return r;
> 
>              v = ti_clk_ll_ops->clk_readl(&ad->control_reg);
>              v &= ~ad->enable_mask;
>              v |= APLL_FORCE_LOCK << __ffs(ad->enable_mask);
>              ti_clk_ll_ops->clk_writel(v, &ad->control_reg);
> 
>              state <<= __ffs(ad->idlest_mask);
> 
> state is shifted again? ...

this is probably copy-paste err

> 
>              while (1) {
>                      v = ti_clk_ll_ops->clk_readl(&ad->idlest_reg);
>                      if ((v & ad->idlest_mask) == state)
> 
> ... and checked again?

this is correct wait for locking

> 
>                              break;
>                      if (i > MAX_APLL_WAIT_TRIES)
>                              break;
>                      i++;
>                      udelay(1);
>              }
> 
>              if (i == MAX_APLL_WAIT_TRIES) {
>                      pr_warn("clock: %s failed transition to '%s'\n",
>                              clk_name, (state) ? "locked" : "bypassed");
>                      r = -EBUSY;
>              } else
>                      pr_debug("clock: %s transition to '%s' in %d loops\n",
>                               clk_name, (state) ? "locked" : "bypassed", i);
> 
>              return r;
>      }
> 
>      static void dra7_apll_disable(struct clk_hw *hw)
>      {
>              struct clk_hw_omap *clk = to_clk_hw_omap(hw);
>              struct dpll_data *ad;
>              u8 state = 1;
>              u32 v;
> 
>              ad = clk->dpll_data;
> 
>              state <<= __ffs(ad->idlest_mask);
> 
> state is shifted to its bit position, but it is never used below?
> Perhaps one of the check blocks above should be moved here?

this is probably copy-paste issue also

> 
> I checked git history and the original patch submissions, and even
> the oldest submission I could find had the same logic.

I think, old logic (basic) can be found at

arch/arm/mach-omap2/dpll3xxx.c

> 
>              v = ti_clk_ll_ops->clk_readl(&ad->control_reg);
>              v &= ~ad->enable_mask;
>              v |= APLL_AUTO_IDLE << __ffs(ad->enable_mask);
>              ti_clk_ll_ops->clk_writel(v, &ad->control_reg);
>      }
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


-- 
Best regards,
grygorii
