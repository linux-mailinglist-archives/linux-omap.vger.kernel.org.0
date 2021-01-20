Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2331A2FD0A6
	for <lists+linux-omap@lfdr.de>; Wed, 20 Jan 2021 13:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729529AbhATMrO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Jan 2021 07:47:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:33822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389117AbhATL2B (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 20 Jan 2021 06:28:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F68223139;
        Wed, 20 Jan 2021 11:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611142040;
        bh=G76tEIH2ivMQClDbf7FjN9pj8GGj3UtTkAM5KfFYxIc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=McYn1U5MTjyOI/whkPYPUYsWwE2uPxa/hefKZqjO+X96i6ZvaPaaxTRtw+3G6VIp3
         M9qH67PMFXXsYS2m609KYHu+v5EMvT43by0bKZsd7Xu8M4/ddNtlELE7BGo+5GJuwk
         zXYe4aqN4cQOzKcAQJc1FIz9opQFvlz9ol2L2GhpfZ5bRNITZDdZt7RePuL48f/ysX
         fPPBef9h0piBs0JrnoEPdBeJL09xRDJCWcBRkIjbPtZLXlTpm7xaQAwOqQPrncRn6E
         zOL/eS6CgjXuJk06PPtDkr8BZJ4EK+mcpVb0cTEdMrjVOzh6rKY/T++MMS6+uoIHMe
         fht1qU6xDZhrw==
Subject: Re: [PATCH 13/20] clk: ti: clockdomain: Fix description for
 'omap2_init_clk_clkdm's hw param
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20210120093040.1719407-1-lee.jones@linaro.org>
 <20210120093040.1719407-14-lee.jones@linaro.org>
From:   Tero Kristo <kristo@kernel.org>
Message-ID: <a844693d-b2a5-ba17-fff3-541040e0e574@kernel.org>
Date:   Wed, 20 Jan 2021 13:27:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120093040.1719407-14-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20/01/2021 11:30, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/clk/ti/clockdomain.c:107: warning: Function parameter or member 'hw' not described in 'omap2_init_clk_clkdm'
>   drivers/clk/ti/clockdomain.c:107: warning: Excess function parameter 'clk' description in 'omap2_init_clk_clkdm'
> 
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Tero Kristo <kristo@kernel.org>

> ---
>   drivers/clk/ti/clockdomain.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/ti/clockdomain.c b/drivers/clk/ti/clockdomain.c
> index 700b7f44f6716..74831b2752b3b 100644
> --- a/drivers/clk/ti/clockdomain.c
> +++ b/drivers/clk/ti/clockdomain.c
> @@ -97,7 +97,7 @@ void omap2_clkops_disable_clkdm(struct clk_hw *hw)
>   
>   /**
>    * omap2_init_clk_clkdm - look up a clockdomain name, store pointer in clk
> - * @clk: OMAP clock struct ptr to use
> + * @hw: Pointer to clk_hw_omap used to obtain OMAP clock struct ptr to use
>    *
>    * Convert a clockdomain name stored in a struct clk 'clk' into a
>    * clockdomain pointer, and save it into the struct clk.  Intended to be
> 

