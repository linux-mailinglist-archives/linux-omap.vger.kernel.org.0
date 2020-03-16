Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E855518724E
	for <lists+linux-omap@lfdr.de>; Mon, 16 Mar 2020 19:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732361AbgCPS2O (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Mar 2020 14:28:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:57654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732313AbgCPS2O (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Mar 2020 14:28:14 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 726BA20409;
        Mon, 16 Mar 2020 18:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584383293;
        bh=3ny6nLBhWMN7Tnbc3yjHh9vkkA88GrNLNX04LRSKado=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uLett0y7mrWX7f1IWoybiokeUIYQBKweyEDDsE5m1xWD328QgX0wzEK9bjq18vVTV
         P1uzQXLRpz9ZWJ7zIro+ccO+YdKzQmbnLh43iC6/bmSs1eNtq+HDJ1pk7XDXmm8ord
         K+LKAPT7w/nrweTI/VccgeJ4kIiqdeek0hO6ULcA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <831d632e-78da-07c4-f8c7-14d17ba1ef28@ti.com>
References: <20200221171030.39326-1-tony@atomide.com> <158231096467.258574.11716255621346536160@swboyd.mtv.corp.google.com> <831d632e-78da-07c4-f8c7-14d17ba1ef28@ti.com>
Subject: Re: [PATCH] clk: ti: am43xx: Fix clock parent for RTC clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Date:   Mon, 16 Mar 2020 11:28:12 -0700
Message-ID: <158438329273.88485.9465537092249993831@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2020-03-16 07:48:30)
> On 21/02/2020 20:49, Stephen Boyd wrote:
> > Quoting Tony Lindgren (2020-02-21 09:10:30)
> >> Currently enabling clkctrl clock on am4 can fail for RTC as the clock
> >> parent is wrong for RTC.
> >>
> >> Fixes: 76a1049b84dd ("clk: ti: am43xx: add new clkctrl data for am43xx=
")
> >> Signed-off-by: Tony Lindgren <tony@atomide.com>
> >> ---
> >>
> >> It is unclear if we can end up with RTC hung with the current mainline
> >> kernel in some cases. Probing RTC with device tree data only seems to
> >> trigger this every time.
> >=20
> > It's small enough and if it's annoying enough we can probably put it
> > into clk-fixes to get it fixed for this release instead of waiting. Can
> > Tero ack it?
> >=20
>=20
> Sure,
>=20
> Acked-by: Tero Kristo <t-kristo@ti.com>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/=
Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
