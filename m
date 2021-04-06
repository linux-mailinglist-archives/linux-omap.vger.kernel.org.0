Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC7E354C7D
	for <lists+linux-omap@lfdr.de>; Tue,  6 Apr 2021 08:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243912AbhDFGCY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Apr 2021 02:02:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:38712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243934AbhDFGCV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 6 Apr 2021 02:02:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C64E3613C8;
        Tue,  6 Apr 2021 06:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617688934;
        bh=vsBChbY5+LVkujpH9gbQlIQG3kRuiu5IdEM2SWqQFPQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MZ1CxFVWIewiqkef0s0fsT8o07mW1EtcauFEY+QOvfQhPQzgmtUSR6G4rgUJsdLJq
         j3mfoRsXvoWUJmjDMVDRQWde4DPbrzO6we3YAxlKwIagW/EeGZt/kiB6x2i7mKEToD
         LWf9Q+B7HJaVRyLgnbb10d5q7Xh7GKPclRiQ3c9tzk/r9DyT9yjjXtvUXKqMhyE1/x
         p4nn10JEHw6ctw8UmjHElg5WyOyZRDn3gEr/7RRbdDw/4XQFhpTbmyqVLjez6t3xjd
         u7Rhuud/4KkIYmPqZms796Db8fmA2GTpc/iZB6g4a4sR4cT6V+TO+s4O1LdyLfGBPJ
         FhkDJwB1Yn6fQ==
Subject: Re: [PATCH 2/2] clk: ti: get register address from device tree
To:     Dario Binacchi <dariobin@libero.it>, linux-kernel@vger.kernel.org
Cc:     Bin Meng <bmeng.cn@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
References: <20210402192054.7934-1-dariobin@libero.it>
 <20210402192054.7934-3-dariobin@libero.it>
From:   Tero Kristo <kristo@kernel.org>
Message-ID: <12964099-7d74-57f3-e517-79c8b14c9b94@kernel.org>
Date:   Tue, 6 Apr 2021 09:02:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210402192054.7934-3-dariobin@libero.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 02/04/2021 22:20, Dario Binacchi wrote:
> Until now, only the register offset was retrieved from the device tree
> to be added, during access, to a common base address for the clocks.
> If possible, we try to retrieve the physical address of the register
> directly from the device tree.

The physical address is derived from the base address of the clock 
provider, it is not derived from the clock node itself.

Doing what this patch does may actually break things, as you end up 
creating an individual ioremap for every single clock register, and they 
are typically a word apart from each other. In the TI clock driver case, 
the ioremap is done only once for the whole clock register space.

-Tero

> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> 
> ---
> 
>   drivers/clk/ti/clk.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
> index 3da33c786d77..938f5a2cb425 100644
> --- a/drivers/clk/ti/clk.c
> +++ b/drivers/clk/ti/clk.c
> @@ -265,9 +265,21 @@ int __init ti_clk_retry_init(struct device_node *node, void *user,
>   int ti_clk_get_reg_addr(struct device_node *node, int index,
>   			struct clk_omap_reg *reg)
>   {
> +	const __be32 *addrp;
> +	u64 size, addr = OF_BAD_ADDR;
> +	unsigned int flags;
>   	u32 val;
>   	int i;
>   
> +	addrp = of_get_address(node, index, &size, &flags);
> +	if (addrp)
> +		addr = of_translate_address(node, addrp);
> +
> +	if (addr != OF_BAD_ADDR) {
> +		reg->ptr = ioremap(addr, sizeof(u32));
> +		return 0;
> +	}
> +
>   	for (i = 0; i < CLK_MAX_MEMMAPS; i++) {
>   		if (clocks_node_ptr[i] == node->parent)
>   			break;
> @@ -287,7 +299,6 @@ int ti_clk_get_reg_addr(struct device_node *node, int index,
>   
>   	reg->offset = val;
>   	reg->ptr = NULL;
> -
>   	return 0;
>   }
>   
> 

