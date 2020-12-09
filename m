Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA282D38AE
	for <lists+linux-omap@lfdr.de>; Wed,  9 Dec 2020 03:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgLICTo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 21:19:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:59336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgLICTo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Dec 2020 21:19:44 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607480344;
        bh=y9ZazdkCdGlz2kKUfYjRjFZpqp75/gPjEp449mXIDuk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XuDEDSrYR/itsBQwY16ikv0Qmk5Kt4F6LYUmdZRPTCkJocYvQcGCErjwF/ajIiWrO
         TJp1u+8ge9j1yH8KBzNa1gkyoh6xkJsC6R2x3Av1VOuIeTVfikDDWgaH4eS81muRdv
         /p1BO/rSJ9cYZOdO9FE/pChylFGbxAcDKFhEdFLjgiiUQ8KRgeKbod7fmNTTs2/qSf
         8wc3tMosixZUc8OzfGrPlIOe+Iz662mAgrTkBOjQCbZl2H3XUAGbdncGv26PNCf3nK
         xls6b0/CsZ0D6a/WfFLmPjW2Mqcm2gba+/gV16FKBmiQbV3W4wPUqq7ITLH7yvIzRd
         wxg5Cs8xnG6oA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201119131259.63829-2-tony@atomide.com>
References: <20201119131259.63829-1-tony@atomide.com> <20201119131259.63829-2-tony@atomide.com>
Subject: Re: [PATCH 1/8] clk: ti: dra7: Drop idlest polling from IVA clkctrl clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Roger Quadros <rogerq@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Date:   Tue, 08 Dec 2020 18:19:02 -0800
Message-ID: <160748034292.1580929.10834411382893969622@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2020-11-19 05:12:52)
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
