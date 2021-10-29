Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B705B43F6B2
	for <lists+linux-omap@lfdr.de>; Fri, 29 Oct 2021 07:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbhJ2Fgz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Oct 2021 01:36:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:40674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231821AbhJ2Fgw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 29 Oct 2021 01:36:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5B6860E8B;
        Fri, 29 Oct 2021 05:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635485664;
        bh=I7zsy8bo3/7MzJ1xjPr4sYavPis38VXgPQ3McipCgkA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PsnHJ+B1IqB9NKEwuJZuULr7x+8zMv2KHv3cbqp75D2gbOG4eetvzwygiMq8uYXuf
         1JAkHFziFPE7meAD9NPkawRNQveVCUP0hvM8p0dW914+/Cl6jMhv/1XLNDgTKs9YaP
         AKHiAOWHvzC9ifFnJXnngdzi+HecIM+E2/9kBkq99JvqHu5WbA6KLlPfrJ1/Q02b/9
         mObHLDWMZkNJaeEk6ShnhzrIhxpcbAe8InO7RvQNKyIQZJw3Lj2NdTgFkEbG/B5zQ0
         pYRDBTGc37qtpngwMbreQhfwfWVIGzMxEosyRFl62+Fxw6/HXiQ6TN4MAGCCSeJU1Y
         1G00Kj330ifag==
Subject: Re: DRA7 clock question
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>
References: <CAMuHMdUjdQrwV-dP=8n1NQ_AZU7-oAjhmVv2hZBEJHQF5zynCQ@mail.gmail.com>
 <d0c128b2-8de1-85b6-52d0-21f7346a98bd@ti.com>
From:   Tero Kristo <kristo@kernel.org>
Message-ID: <bb6a0a28-8419-f131-caf6-aed1b5261c6b@kernel.org>
Date:   Fri, 29 Oct 2021 08:34:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d0c128b2-8de1-85b6-52d0-21f7346a98bd@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 28/10/2021 19:13, Grygorii Strashko wrote:
> 
> 
> On 28/10/2021 18:16, Geert Uytterhoeven wrote:
>> Hi Tero, Tony,
>>
>> I accidentally stumbled across the following code in 
>> drivers/clk/ti/apll.c:
>>
>>      static int dra7_apll_enable(struct clk_hw *hw)
>>      {
>>              struct clk_hw_omap *clk = to_clk_hw_omap(hw);
>>              int r = 0, i = 0;
>>              struct dpll_data *ad;
>>              const char *clk_name;
>>              u8 state = 1;
>>              u32 v;
>>
>>              ad = clk->dpll_data;
>>              if (!ad)
>>                      return -EINVAL;
>>
>>              clk_name = clk_hw_get_name(&clk->hw);
>>
>>              state <<= __ffs(ad->idlest_mask);
>>
>> state is shifted to its bit position...
>>
>>              /* Check is already locked */
>>              v = ti_clk_ll_ops->clk_readl(&ad->idlest_reg);
>>
>>              if ((v & ad->idlest_mask) == state)
>>
>> ... and checked.
>>
>>                      return r;
>>
>>              v = ti_clk_ll_ops->clk_readl(&ad->control_reg);
>>              v &= ~ad->enable_mask;
>>              v |= APLL_FORCE_LOCK << __ffs(ad->enable_mask);
>>              ti_clk_ll_ops->clk_writel(v, &ad->control_reg);
>>
>>              state <<= __ffs(ad->idlest_mask);
>>
>> state is shifted again? ...
> 
> this is probably copy-paste err

Yeah, this looks like something for someone to fix. The bug has been 
masked by the fact that the autoidle_mask for dra7 is always 0x1, 
meaning the shift value becomes zero.

> 
>>
>>              while (1) {
>>                      v = ti_clk_ll_ops->clk_readl(&ad->idlest_reg);
>>                      if ((v & ad->idlest_mask) == state)
>>
>> ... and checked again?
> 
> this is correct wait for locking
> 
>>
>>                              break;
>>                      if (i > MAX_APLL_WAIT_TRIES)
>>                              break;
>>                      i++;
>>                      udelay(1);
>>              }
>>
>>              if (i == MAX_APLL_WAIT_TRIES) {
>>                      pr_warn("clock: %s failed transition to '%s'\n",
>>                              clk_name, (state) ? "locked" : "bypassed");
>>                      r = -EBUSY;
>>              } else
>>                      pr_debug("clock: %s transition to '%s' in %d 
>> loops\n",
>>                               clk_name, (state) ? "locked" : 
>> "bypassed", i);
>>
>>              return r;
>>      }
>>
>>      static void dra7_apll_disable(struct clk_hw *hw)
>>      {
>>              struct clk_hw_omap *clk = to_clk_hw_omap(hw);
>>              struct dpll_data *ad;
>>              u8 state = 1;
>>              u32 v;
>>
>>              ad = clk->dpll_data;
>>
>>              state <<= __ffs(ad->idlest_mask);
>>
>> state is shifted to its bit position, but it is never used below?
>> Perhaps one of the check blocks above should be moved here?
> 
> this is probably copy-paste issue also

Yes, this can be dropped. When a clock is going to autoidle, we don't 
really care when it does so and thus are not polling the status.

-Tero

> 
>>
>> I checked git history and the original patch submissions, and even
>> the oldest submission I could find had the same logic.
> 
> I think, old logic (basic) can be found at
> 
> arch/arm/mach-omap2/dpll3xxx.c
> 
>>
>>              v = ti_clk_ll_ops->clk_readl(&ad->control_reg);
>>              v &= ~ad->enable_mask;
>>              v |= APLL_AUTO_IDLE << __ffs(ad->enable_mask);
>>              ti_clk_ll_ops->clk_writel(v, &ad->control_reg);
>>      }
>>
>> Thanks!
>>
>> Gr{oetje,eeting}s,
>>
>>                          Geert
>>
> 
> 

