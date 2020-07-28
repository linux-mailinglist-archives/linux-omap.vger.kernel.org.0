Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FC122FEE0
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jul 2020 03:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgG1BYU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jul 2020 21:24:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:34074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbgG1BYU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 Jul 2020 21:24:20 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 83E6A20809;
        Tue, 28 Jul 2020 01:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595899459;
        bh=ys14D/WWbTgAMo9tUTXuTr8A1pgEYRarJTsZ+VOuolM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AbkXQEtFmkuwJD7v357nl2piay6c727fizXm2rsKN1n7BUqoNIOPPpncYBpCmZLSp
         4KLKOMO3AR6xo1DFMF3Q5QZ4LJE806WPR8eKdOcWgNcxP49ei20OwPaO6rzRLpnc+i
         MtVrHLWyC7MnapG+sYdZn7ihwr/ECboL1VxHTN4g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200720122343.178203-1-jingxiangfeng@huawei.com>
References: <20200720122343.178203-1-jingxiangfeng@huawei.com>
Subject: Re: [PATCH] clk: ti: clkctrl: add the missed kfree() for _ti_omap4_clkctrl_setup()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, jingxiangfeng@huawei.com
To:     Jing Xiangfeng <jingxiangfeng@huawei.com>, mturquette@baylibre.com,
        robh@kernel.org, t-kristo@ti.com, tony@atomide.com
Date:   Mon, 27 Jul 2020 18:24:18 -0700
Message-ID: <159589945839.1360974.1977401781355555451@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Jing Xiangfeng (2020-07-20 05:23:43)
> _ti_omap4_clkctrl_setup() misses to call kfree() in an error path. Add
> the missed function call to fix it.
>=20
> Fixes: 6c3090520554 ("clk: ti: clkctrl: Fix hidden dependency to node nam=
e")
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> ---
>  drivers/clk/ti/clkctrl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> index 864c484bde1b..868e50132c21 100644
> --- a/drivers/clk/ti/clkctrl.c
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -655,8 +655,10 @@ static void __init _ti_omap4_clkctrl_setup(struct de=
vice_node *node)
>                 }
> =20
>                 hw =3D kzalloc(sizeof(*hw), GFP_KERNEL);
> -               if (!hw)
> +               if (!hw) {
> +                       kfree(clkctrl_name);
>                         return;
> +               }

Why not goto cleanup?

> =20
>                 hw->enable_reg.ptr =3D provider->base + reg_data->offset;
> =20
> --=20
> 2.17.1
>
