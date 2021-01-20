Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2572FD177
	for <lists+linux-omap@lfdr.de>; Wed, 20 Jan 2021 14:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730491AbhATMrn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Jan 2021 07:47:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:33884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389462AbhATL2e (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 20 Jan 2021 06:28:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2E4123159;
        Wed, 20 Jan 2021 11:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611142074;
        bh=gRVlJuKGNVGwryzz6e+/lprrfLI0JufanSSAdcMTT4g=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FLz4/7g6+jsmGNgL41UVzMA8rygmoQKfxlKDzgG2pDqIpOensyygPRymiY0Z5pAdp
         HHiWfFa6pAwogPLandlu+LwYfphVCDxWl+NRU2pJ4jx5aqZjjM2ppNyOgOcWPnpHY0
         DVlCJ+TCzhTCkFShmg6Uumv35mV0miLUdccos4o66qJquKITwNICB6rxHeBk9chbxI
         k7ncz+bjhqAhzTZwAHYZHAsBmCCRDDn83ECiB/QEmxGDOXI3PXwDBji9ensAfOiKaS
         cIBhPhPmDZHiTCJqucbjqBhu1wKhMFDUuEBQAfqKST23eZ6M7b3WgWDNoHHl4IYRIe
         Cq0gjbWdOPccg==
Subject: Re: [PATCH 15/20] clk: ti: dpll: Fix misnaming of '_register_dpll()'s
 'user' parameter
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20210120093040.1719407-1-lee.jones@linaro.org>
 <20210120093040.1719407-16-lee.jones@linaro.org>
From:   Tero Kristo <kristo@kernel.org>
Message-ID: <0cdddb5c-dcbd-3d69-a3d0-3e9a843e667f@kernel.org>
Date:   Wed, 20 Jan 2021 13:27:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120093040.1719407-16-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20/01/2021 11:30, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/clk/ti/dpll.c:163: warning: Function parameter or member 'user' not described in '_register_dpll'
>   drivers/clk/ti/dpll.c:163: warning: Excess function parameter 'hw' description in '_register_dpll'
> 
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Tero Kristo <kristo@kernel.org>

> ---
>   drivers/clk/ti/dpll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
> index 247510e306e2a..d6f1ac5b53e14 100644
> --- a/drivers/clk/ti/dpll.c
> +++ b/drivers/clk/ti/dpll.c
> @@ -151,7 +151,7 @@ static const struct clk_ops dpll_x2_ck_ops = {
>   
>   /**
>    * _register_dpll - low level registration of a DPLL clock
> - * @hw: hardware clock definition for the clock
> + * @user: pointer to the hardware clock definition for the clock
>    * @node: device node for the clock
>    *
>    * Finalizes DPLL registration process. In case a failure (clk-ref or
> 

