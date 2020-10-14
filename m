Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEEF828E53B
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 19:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728475AbgJNRTR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 13:19:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:50436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726942AbgJNRTQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Oct 2020 13:19:16 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AE9322227;
        Wed, 14 Oct 2020 17:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602695956;
        bh=6xDpg+nTdGn65/kpiroNepw4O/rdqN2/qIYYdLLfPZU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UD6d2j2jcWpv1JLrbqtvXTMvKBwcbfW/dva7TbdK0Led/jJNxS0NaIx7+6ZEZhWyu
         OUionDa3/+7AMnHBAZiyzyQcPk6Kt+RT/IgM/GUsIt7H5XWEvA/88WOg+H9pqsW3Rt
         V3Qi1Z/6bIsRwp7EWBa//TzR88kLL0pZmW1BLCIA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200728061846.68281-1-jingxiangfeng@huawei.com>
References: <20200728061846.68281-1-jingxiangfeng@huawei.com>
Subject: Re: [PATCH v2] clk: ti: clkctrl: fix the missed kfree() for _ti_omap4_clkctrl_setup()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, jingxiangfeng@huawei.com
To:     Jing Xiangfeng <jingxiangfeng@huawei.com>, mturquette@baylibre.com,
        robh@kernel.org, t-kristo@ti.com, tony@atomide.com
Date:   Wed, 14 Oct 2020 10:19:14 -0700
Message-ID: <160269595458.884498.14663108408006981397@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Jing Xiangfeng (2020-07-27 23:18:46)
> _ti_omap4_clkctrl_setup() misses to call kfree() in an error path. Jump
> to cleanup to fix it.
>=20
> Fixes: 6c3090520554 ("clk: ti: clkctrl: Fix hidden dependency to node nam=
e")
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> ---
>  drivers/clk/ti/clkctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> index 864c484bde1b..a562261eb061 100644
> --- a/drivers/clk/ti/clkctrl.c
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -656,7 +656,7 @@ static void __init _ti_omap4_clkctrl_setup(struct dev=
ice_node *node)
> =20
>                 hw =3D kzalloc(sizeof(*hw), GFP_KERNEL);
>                 if (!hw)
> -                       return;
> +                       goto cleanup;

Nobody reviewed this so I didn't apply it. I looked closer and it seems
that this may fix one leak but this is inside a while loop so presumably
we need to goto cleanup and unwind the loop of allocations? Put another
way, there is more work to do here.
