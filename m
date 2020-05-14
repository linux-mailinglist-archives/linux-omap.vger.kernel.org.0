Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD0F1D3E3E
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 21:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbgENT6i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 15:58:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:49360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728000AbgENT6i (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 15:58:38 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E71F52065C;
        Thu, 14 May 2020 19:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589486318;
        bh=MqSN7QHFyQEafBDnt8AwfxRV+94S5EpjM/lhqzR0XM0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QsZINdZ5MhLPeWd+wF0h7gyWq4H237d+G5WbO3wZ2wAMT/UGQjhzhvD6KJj8M9Lr4
         sJb0X5xtv7ZaJoLRdpGDMYAtV5XfJAtBZI7TS6q88bXNMGkgzhFoUrMR4Ck5CtY4v+
         QrudU9IfTko9AyQPIGcCemZo+NKw2sCnjXiyvhCc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200417153342.GP37466@atomide.com>
References: <20200417073523.42520-1-yanaijie@huawei.com> <20200417153342.GP37466@atomide.com>
Subject: Re: [PATCH] clk: ti: dra7: remove two unused symbols
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jason Yan <yanaijie@huawei.com>, mturquette@baylibre.com,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
To:     Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Date:   Thu, 14 May 2020 12:58:37 -0700
Message-ID: <158948631725.215346.11486245758636089798@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2020-04-17 08:33:42)
> Tero,
>=20
> * Jason Yan <yanaijie@huawei.com> [200417 07:09]:
> > Fix the following gcc warning:
> >=20
> > drivers/clk/ti/clk-7xx.c:320:43: warning: \u2018dra7_gpu_sys_clk_data\u=
2019
> > defined but not used [-Wunused-const-variable=3D]
> >  static const struct omap_clkctrl_div_data dra7_gpu_sys_clk_data
> > __initconst =3D {
> >                                            ^~~~~~~~~~~~~~~~~~~~~
> > drivers/clk/ti/clk-7xx.c:315:27: warning: \u2018dra7_gpu_sys_clk_parent=
s\u2019
> > defined but not used [-Wunused-const-variable=3D]
> >  static const char * const dra7_gpu_sys_clk_parents[] __initconst =3D {
> >                            ^~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Looks like this started happening with commit 957ad44ff5f2
> ("clk: ti: add clkctrl data dra7 sgx") as I did it based on
> omap5. But the clocks seem slightly different, care to check
> sgx clocking against the TRM in case I also messed up something
> else?

Is that an ack?
