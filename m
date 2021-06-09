Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269423A08B5
	for <lists+linux-omap@lfdr.de>; Wed,  9 Jun 2021 02:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232892AbhFIAyO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Jun 2021 20:54:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:54966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232066AbhFIAyO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Jun 2021 20:54:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5377613AD;
        Wed,  9 Jun 2021 00:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623199940;
        bh=Hp868gR9XE+xFLkB7gOhe+BARMFoEFUBqxp1VqLL6kQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gOVQ4BM54LztCaTWPG9kaYSN/gnhu3sq6rfWC29IkaCoxz7WAMkJ1b0J0sYAoNZe4
         CufHF83fQJHOnmzEDIKit3gcdrpmGmcpDKaK/wuCOwldCubwlrAc6WugEu9tmgqe1U
         N5UwArmlq7LfNfU2gkgP/4xkyx1Le98BtyZZapba8z++J1p5sOytJFNJgdKMMugWjU
         OG6Id1ZNWhLyBVSe91g/9l9aGA2Nkx7Qwmxk61xqGqp+dugxacZwHgKYNlsJRArNnT
         HLAdvUVuN3jfj56CQDenqL9zVsGaLlNR3Zp0Ev5sQ5VkDnIDHfTL36UnvQkbyoNlGf
         wSSe63qnowx/A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210606202253.31649-4-dariobin@libero.it>
References: <20210606202253.31649-1-dariobin@libero.it> <20210606202253.31649-4-dariobin@libero.it>
Subject: Re: [RESEND PATCH v7 3/5] ARM: dts: am33xx-clocks: add spread spectrum support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dario Binacchi <dariobin@libero.it>,
        linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Dario Binacchi <dariobin@libero.it>, linux-clk@vger.kernel.org
Date:   Tue, 08 Jun 2021 17:52:19 -0700
Message-ID: <162319993969.1835121.16629165963237312828@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Dario Binacchi (2021-06-06 13:22:51)
> Registers for adjusting the spread spectrum clocking (SSC) have been
> added. As reported by the TI spruh73x RM, SSC is supported only for LCD
> and MPU PLLs, but the CM_SSC_DELTAMSTEP_DPLL_XXX and
> CM_SSC_MODFREQDIV_DPLL_XXX registers, as well as the enable field in the
> CM_CLKMODE_DPLL_XXX registers are mapped for all PLLs (CORE, MPU, DDR,
> PER, DISP).
>=20
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> Acked-by: Tony Lindgren <tony@atomide.com>
>=20
> ---

Applied to clk-next
