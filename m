Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E5C2D38B9
	for <lists+linux-omap@lfdr.de>; Wed,  9 Dec 2020 03:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgLICVu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 21:21:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:59890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgLICVu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Dec 2020 21:21:50 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607480470;
        bh=WT8uMkIgKNBN83uC2I/u3BLNaEQfVrbj73eqAJizD0s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LbgLHWcXRhEhXAFLR0hAcCso7IVVPje1UJAhAQ+5bbgdw9AjSgM8AOqn0lHOVr7Bt
         apkawj38xBBoH2fUXAB6I86Mg9johh8e8MV1a4o3Kt1CgRxPLHBn+Fx9BExmEa/1WT
         KRG5V+o+Eg2huML/xRZvKn9xqPT3EnN9IZoqNiV144xNmp/6KzyJEoXcT4OkCfhSfp
         XOduhPHE39QD8sJMEVKRe80bvW+be+d5bheq7acHeoVcfgIdrEJ5tdnh3hV9/xBuO3
         U1yNJYSh9v45TgilzY/BAXbEWXU/RAynaz0uUIrxF+fIYB5ohc9amxLd0BtALYaPLv
         sTfMTR2zHlnOg==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201119130720.63140-2-tony@atomide.com>
References: <20201119130720.63140-1-tony@atomide.com> <20201119130720.63140-2-tony@atomide.com>
Subject: Re: [PATCH 1/7] clk: ti: omap4: Drop idlest polling from IVA clkctrl clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Roger Quadros <rogerq@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Date:   Tue, 08 Dec 2020 18:21:08 -0800
Message-ID: <160748046888.1580929.12704153857017758692@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2020-11-19 05:07:14)
> Similar to what we've done for IPU and DSP let's ignore the status bit
> for the IVA clkctrl register.
>=20
> The clkctrl status won't change unless the related rstctrl is deasserted,
> and the rstctrl status won't change unless the clkctrl is enabled.
>=20
> Cc: linux-clk@vger.kernel.org
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Suman Anna <s-anna@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
