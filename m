Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B28D319389
	for <lists+linux-omap@lfdr.de>; Thu, 11 Feb 2021 20:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbhBKTzm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Feb 2021 14:55:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:38146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231335AbhBKTza (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 11 Feb 2021 14:55:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F046C64E4D;
        Thu, 11 Feb 2021 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073289;
        bh=hLAdKsbc3h0NWeFP7mSXmYBPzFNEn8L8z6g+HDNY9PQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=A0ds1ZXfJpTfLO6Ow8QbGl+/dlvPnpHxFcit0f/pznf+boHXeEJi2+JpQ2C8xTHfM
         SHAZHLL1yNCrFNjcPj80j1gcbTUxzfgFHPJmz8EQp+/DjkzJJuXPEyutV2/Wc6ZtbE
         3VGY1pOfZFtoK+u1NoczXpPuOtfi5KaMCF1DTeR67g91JCkWomGoqeB816CAQH4+Ef
         kK5QM09C9yBV9LNYvkYYaPIkpmdztbUfxk3JGbL7ozMI9XmEZNN7bcOsObKxJQyblE
         kqIipzP94vAwqSxZ298OpWPGp2BEuwvUwwlI7vhQ4XZKtM/8XOZB6Yb9JA2pXTchID
         JoV7KmTB7Et2g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126124540.3320214-4-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <20210126124540.3320214-4-lee.jones@linaro.org>
Subject: Re: [PATCH 03/21] clk: ti: dpll3xxx: Fix some kernel-doc headers and promote other worthy ones
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:54:47 -0800
Message-ID: <161307328781.1254594.15794807918079373188@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Lee Jones (2021-01-26 04:45:22)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/ti/dpll3xxx.c:414: warning: Function parameter or member 'hw=
' not described in 'omap3_dpll_recalc'
>  drivers/clk/ti/dpll3xxx.c:414: warning: Function parameter or member 'pa=
rent_rate' not described in 'omap3_dpll_recalc'
>  drivers/clk/ti/dpll3xxx.c:414: warning: Excess function parameter 'clk' =
description in 'omap3_dpll_recalc'
>  drivers/clk/ti/dpll3xxx.c:437: warning: Function parameter or member 'hw=
' not described in 'omap3_noncore_dpll_enable'
>  drivers/clk/ti/dpll3xxx.c:437: warning: Excess function parameter 'clk' =
description in 'omap3_noncore_dpll_enable'
>  drivers/clk/ti/dpll3xxx.c:479: warning: Function parameter or member 'hw=
' not described in 'omap3_noncore_dpll_disable'
>  drivers/clk/ti/dpll3xxx.c:479: warning: Excess function parameter 'clk' =
description in 'omap3_noncore_dpll_disable'
>  drivers/clk/ti/dpll3xxx.c:755: warning: Function parameter or member 'hw=
' not described in 'omap3_clkoutx2_recalc'
>  drivers/clk/ti/dpll3xxx.c:755: warning: Function parameter or member 'pa=
rent_rate' not described in 'omap3_clkoutx2_recalc'
>  drivers/clk/ti/dpll3xxx.c:755: warning: Excess function parameter 'clk' =
description in 'omap3_clkoutx2_recalc'
>=20
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
