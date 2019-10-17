Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4950ADB17C
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 17:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389216AbfJQPsz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 11:48:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:43218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731907AbfJQPsz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 11:48:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5285220869;
        Thu, 17 Oct 2019 15:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571327334;
        bh=x7ytOe7ngBLCL0IqMlx2YLDHSN6K+mWYaq3Lc/ow294=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=Nr4BhFNoD1XZmbL1oepItE12NliaqynEWLLXlpirP3jvRsafIo0i9jUmR7Bts5Y0G
         XGFL/8h+EQmrZMy1ciFaf08sozYqP2rZisAfq82f1iJBCviEfaRAc8ZZnQ3Dvaj+AZ
         r3q/Mc3oA3o7mGOIroONkF3Br3S+loJlElpMbVy0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190927180559.18162-1-steve@sk2.org>
References: <cec235b3e2e4e3b206fa9444b643fa56@sk2.org> <20190927180559.18162-1-steve@sk2.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Kitt <steve@sk2.org>, Tero Kristo <t-kristo@ti.com>,
        Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH v2] clk/ti/adpll: allocate room for terminating null
User-Agent: alot/0.8.1
Date:   Thu, 17 Oct 2019 08:48:53 -0700
Message-Id: <20191017154854.5285220869@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Stephen Kitt (2019-09-27 11:05:59)
> The buffer allocated in ti_adpll_clk_get_name doesn't account for the
> terminating null. This patch switches to ka_sprintf to avoid
> overflowing.
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---
>  drivers/clk/ti/adpll.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/clk/ti/adpll.c b/drivers/clk/ti/adpll.c
> index fdfb90058504..021cf9e2b4db 100644
> --- a/drivers/clk/ti/adpll.c
> +++ b/drivers/clk/ti/adpll.c
> @@ -195,14 +195,8 @@ static const char *ti_adpll_clk_get_name(struct ti_a=
dpll_data *d,
>                         return NULL;
>         } else {
>                 const char *base_name =3D "adpll";

This is used once.

> -               char *buf;
> -
> -               buf =3D devm_kzalloc(d->dev, 8 + 1 + strlen(base_name) + =
1 +
> -                                   strlen(postfix), GFP_KERNEL);
> -               if (!buf)
> -                       return NULL;
> -               sprintf(buf, "%08lx.%s.%s", d->pa, base_name, postfix);
> -               name =3D buf;
> +               name =3D devm_kasprintf(d->dev, GFP_KERNEL, "%08lx.%s.%s",

So why not make this "%08lx.adpll.%s"?

> +                                     d->pa, base_name, postfix);
>         }
