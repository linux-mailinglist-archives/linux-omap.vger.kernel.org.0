Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67D8631937B
	for <lists+linux-omap@lfdr.de>; Thu, 11 Feb 2021 20:55:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhBKTys (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Feb 2021 14:54:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:37448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229821AbhBKTxp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 11 Feb 2021 14:53:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD27264E56;
        Thu, 11 Feb 2021 19:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073185;
        bh=X4nY1C8eolPxfFFXhmBHtBSscsEPQrfmWqrmf8tqOA0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Z42CNJvg9+zgo/a9YzcvcK/Wq3tHoIzoo5LpQ83df1mM4vlEPcxTI4K9ghT9doDDf
         sZlpdZFHCtc5nGnyN5afb0ijQyi6lWXxTyQR06hwindnGM9TBrv/hIyRzGbSwJTJJh
         sOr980XZlOViZWS+ILm+n4t0EiCU/URDr9uVniXsxAJpzXVuu4P0cJKNkDRwJw7qp7
         uo9erRa15F4f8AkEyUjBG8qvWnSL7+ZDZRKPEidBbyz+MX/CwrcRW0aKaEsSnu/rVs
         toaOpVeW9HFjGQBP7cDl9/H9vI8KsEeq76dyvhHejvP+RipFVAHaQumWbxts5qDSIX
         daqbE/QToqCOA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120093040.1719407-17-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org> <20210120093040.1719407-17-lee.jones@linaro.org>
Subject: Re: [PATCH 16/20] clk: ti: gate: Fix possible doc-rot in 'omap36xx_gate_clk_enable_with_hsdiv_restore'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:53:03 -0800
Message-ID: <161307318365.1254594.12506451130252161384@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Lee Jones (2021-01-20 01:30:36)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/ti/gate.c:67: warning: Function parameter or member 'hw' not=
 described in 'omap36xx_gate_clk_enable_with_hsdiv_restore'
>  drivers/clk/ti/gate.c:67: warning: Excess function parameter 'clk' descr=
iption in 'omap36xx_gate_clk_enable_with_hsdiv_restore'
>=20
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
