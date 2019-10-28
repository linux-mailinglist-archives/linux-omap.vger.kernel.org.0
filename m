Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB07BE73D9
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2019 15:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390250AbfJ1OlB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Oct 2019 10:41:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:39236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390235AbfJ1OlB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 28 Oct 2019 10:41:01 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 16AB321783;
        Mon, 28 Oct 2019 14:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572273660;
        bh=axoSaH+/ag7KHoYEGacTwTyxDf1dMkOkdtPW/9pcPzE=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=tHm10/pItpS9JLcwM2Gidig8ScpFMHVidlghWROUuf3GEnkPCoG0uVlPL9r908Ywx
         QubfCZpmP+wJC/nGkzjPl6Zi+bSW6Nfi0RWIfaGeVp7E28Lgan3QW4dtLaY8VzLQ1E
         wfBVTOZSwfZN7ZW2BioTEn/UdFQFv4tw55PAlFQo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190912132613.28093-4-t-kristo@ti.com>
References: <20190912132613.28093-1-t-kristo@ti.com> <20190912132613.28093-4-t-kristo@ti.com>
Cc:     tony@atomide.com, s-anna@ti.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCHv3 03/10] clk: ti: clkctrl: add new exported API for checking standby info
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, mturquette@baylibre.com
User-Agent: alot/0.8.1
Date:   Mon, 28 Oct 2019 07:40:59 -0700
Message-Id: <20191028144100.16AB321783@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2019-09-12 06:26:06)
> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> index d904a9a7626a..e3e0a66a6ce2 100644
> --- a/drivers/clk/ti/clkctrl.c
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -647,3 +650,33 @@ static void __init _ti_omap4_clkctrl_setup(struct de=
vice_node *node)
>  }
>  CLK_OF_DECLARE(ti_omap4_clkctrl_clock, "ti,clkctrl",
>                _ti_omap4_clkctrl_setup);
> +
> +/**
> + * ti_clk_is_in_standby - Check if clkctrl clock is in standby or not
> + * @clk: clock to check standby status for
> + *
> + * Finds whether the provided clock is in standby mode or not. Returns
> + * true if the provided clock is a clkctrl type clock and it is in stand=
by,
> + * false otherwise.
> + */
> +u32 ti_clk_is_in_standby(struct clk *clk)
> +{
> +       struct clk_hw *hw;
> +       struct clk_hw_omap *hwclk;
> +       u32 val;
> +
> +       hw =3D __clk_get_hw(clk);
> +
> +       if (!omap2_clk_is_hw_omap(hw))
> +               return false;
> +
> +       hwclk =3D to_clk_hw_omap(hw);
> +
> +       val =3D ti_clk_ll_ops->clk_readl(&hwclk->enable_reg);
> +
> +       if (val & OMAP4_STBYST_MASK)
> +               return true;
> +
> +       return false;

This is returning true and false for a function that is returning u32...
Why? Maybe just

	return val & OMAP4_STBYST_MASK;

and then it will be a u32 for the bit if it's set or 0 if it's not set?
Otherwise, change the return type to bool instead of u32?

> +}
> +EXPORT_SYMBOL_GPL(ti_clk_is_in_standby);
