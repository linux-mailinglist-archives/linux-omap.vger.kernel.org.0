Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADCA42D38AD
	for <lists+linux-omap@lfdr.de>; Wed,  9 Dec 2020 03:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgLICUD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 21:20:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:59410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgLICUD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Dec 2020 21:20:03 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607480362;
        bh=aL9H+Z7UKxxIUEeWw2VltDYscU1CE3qJnMGNtgDRcc4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RiiPoXiZbsjGPTvHkOD5z5sSb4/Y+zB88u6BXq/yF5aY8yu0z7CpB1sqzS06Nddwl
         yWX79e+uJrqz+Jy2HTvt/YWUJe96gj2ibVM9dAFJuOCECKnrS3cieAN8n76QoaGcBI
         8tSgPWkoFrswrDn/RXLyyPdsUgEmGn2ZFCbEFbVcbiKKDwSuT9kKhyT8rvFxpPjTKa
         NyzZLB+QcqLzMNgCKHiv8sSByxJf1rNvga/5ul0siINR4ABZtlcso0JvknXI3g0rTC
         FYhMGXV0yTne9Q07zi8HolwrJ2XPZFWQr298X7ILm+mKl+1uLi3nyFHX2orgBUmZ/+
         DxQ0UVOqnZmqA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201116111939.21405-2-tony@atomide.com>
References: <20201116111939.21405-1-tony@atomide.com> <20201116111939.21405-2-tony@atomide.com>
Subject: Re: [PATCH 01/17] clk: ti: am437x: Keep am4 l3 main clock always on for genpd
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Date:   Tue, 08 Dec 2020 18:19:21 -0800
Message-ID: <160748036142.1580929.8513981952048306209@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2020-11-16 03:19:23)
> In order for suspend and resume to work with genpd on am4, we must keep
> l3 main clock always on. Otherwise prm_omap driver will shut down the l3
> main clock on suspend when simple-pm-bus and GENPD_FLAG_PM_CLK are used.
> Note that we already keep the l3 main clock always on with the legacy
> platform code.
>=20
> Later on we may want to start managing the l3 main clock with a dedicated
> interconnect driver instead of using simple-pm-bus and GENPD_FLAG_PM_CLK.
>=20
> Cc: linux-clk@vger.kernel.org
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
