Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEC2A27AC
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2019 22:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfH2UFQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Aug 2019 16:05:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:38538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbfH2UFQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 29 Aug 2019 16:05:16 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AFB0622CEA;
        Thu, 29 Aug 2019 20:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567109115;
        bh=AC4gPJfrVrrii0HywXSnULvkrHqrXMjorH4PY24NIjA=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=SlHe5Oeeh9/O5WzTo7SsVCbNGyQbPalgziUivEKYsktatpgPqDink/dSf8MdRdAE2
         UW5HLJPtG0gyvZJcQiHRiU8Q4IJBrcIHjrb2ugNNurH2Oa5v8vRDWOg+EkcDoX0ERM
         quuNvlOclcFpGw0TVbcgLu7lr/BY9kvFyqyTf69g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190828065929.32150-5-t-kristo@ti.com>
References: <20190828065929.32150-1-t-kristo@ti.com> <20190828065929.32150-5-t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com, s-anna@ti.com
Subject: Re: [PATCHv2 4/6] clk: ti: clkctrl: add API to notify reset status
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 29 Aug 2019 13:05:14 -0700
Message-Id: <20190829200515.AFB0622CEA@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2019-08-27 23:59:27)
> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> index e3e0a66a6ce2..47a0d1398c6f 100644
> --- a/drivers/clk/ti/clkctrl.c
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -680,3 +689,38 @@ u32 ti_clk_is_in_standby(struct clk *clk)
>         return false;
>  }
>  EXPORT_SYMBOL_GPL(ti_clk_is_in_standby);
> +
> +/**
> + * ti_clk_notify_resets - Notify the clock driver associated reset status

This is completely unused in this patch series. What's going on?

> + * @clk: clock to notify reset status for
> + * @asserted: true if all HW reset lines are asserted
> + *
> + * Some clkctrl clocks have associated resets for them which effectively
> + * prevent the clock to transition from/to idle if the reset state is not
> + * in sync. For the clock to transition to idle properly, all associated
> + * resets must be asserted, and to leave idle, vice versa. To provide the
> + * current reset status, the reset driver should issue this callback.
> + */
