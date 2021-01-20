Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8682FD0A8
	for <lists+linux-omap@lfdr.de>; Wed, 20 Jan 2021 13:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728900AbhATMrs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Jan 2021 07:47:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:33936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389532AbhATL3C (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 20 Jan 2021 06:29:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D02CE2332B;
        Wed, 20 Jan 2021 11:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611142102;
        bh=vqey/zXC7VBG9Aw6UqygcRkWjnyv6PnPEs9hOPYONo4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=bkjiYU1iWpHSP0fADfx/c+iZsnRN/BVc3iL2/ZdEYLpyPE4YgpsdS8M4/CKvkjqio
         RaY6wDyFROX6pnh0idAdnrLtpTzfgf+HrzJRPFIeBDXqPd+MiMH9gWaprB8MrPCZoi
         jPPqBzMupRgoFsttu0rMoschmLO7PYIjUS9f1UqQwoxo3qBCIAep7Kk/IKI0jt4Yyz
         y1AshDbBdFc9Tu/FKyZ9NlcmrLoilEweU3LisYvq8DL2UPtT+D3+svrGmqZHwundme
         nLOyZ50LvNBW9015fVmq7MsjmsDJq+T1fFRI773KrLc5A98eaiOHTsq/pb51REkj/o
         WCmDgZ1sTnZlw==
Subject: Re: [PATCH 16/20] clk: ti: gate: Fix possible doc-rot in
 'omap36xx_gate_clk_enable_with_hsdiv_restore'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20210120093040.1719407-1-lee.jones@linaro.org>
 <20210120093040.1719407-17-lee.jones@linaro.org>
From:   Tero Kristo <kristo@kernel.org>
Message-ID: <ae2c5a21-64c2-aad6-5fa2-0fe024781ce4@kernel.org>
Date:   Wed, 20 Jan 2021 13:28:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120093040.1719407-17-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20/01/2021 11:30, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/clk/ti/gate.c:67: warning: Function parameter or member 'hw' not described in 'omap36xx_gate_clk_enable_with_hsdiv_restore'
>   drivers/clk/ti/gate.c:67: warning: Excess function parameter 'clk' description in 'omap36xx_gate_clk_enable_with_hsdiv_restore'
> 
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Tero Kristo <kristo@kernel.org>

> ---
>   drivers/clk/ti/gate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/ti/gate.c b/drivers/clk/ti/gate.c
> index 42389558418c5..b1d0fdb40a75a 100644
> --- a/drivers/clk/ti/gate.c
> +++ b/drivers/clk/ti/gate.c
> @@ -55,7 +55,7 @@ static const struct clk_ops omap_gate_clk_hsdiv_restore_ops = {
>   /**
>    * omap36xx_gate_clk_enable_with_hsdiv_restore - enable clocks suffering
>    *         from HSDivider PWRDN problem Implements Errata ID: i556.
> - * @clk: DPLL output struct clk
> + * @hw: DPLL output struct clk_hw
>    *
>    * 3630 only: dpll3_m3_ck, dpll4_m2_ck, dpll4_m3_ck, dpll4_m4_ck,
>    * dpll4_m5_ck & dpll4_m6_ck dividers gets loaded with reset
> 

