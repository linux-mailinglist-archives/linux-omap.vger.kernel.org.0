Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0F53A08B9
	for <lists+linux-omap@lfdr.de>; Wed,  9 Jun 2021 02:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234983AbhFIAyU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Jun 2021 20:54:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:55070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234669AbhFIAyU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Jun 2021 20:54:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E030613AD;
        Wed,  9 Jun 2021 00:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623199946;
        bh=/+PTDMu+iFmSleeZlQhnZXvECjHkPxSa/6CQfomy5pE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=k39MPlfR/D8aHmh3iJ/qROq+ofDBNOQde8NHzS9bICB6otleejsW0ffWgZI54jxAX
         tYd5nXgrwkFe0c4Ch2wn42atLypcYb77cFjK+XupNg7ZwSh9bshyQD5XJQFUX69MnE
         3+7wy6kOly4qaxK191ysAJkOvmzRYn8oR+TjVLkre55k3R0aMw8MJhMt1X+NO2EDlJ
         HDe9OPtKFeRiJu4d4M7i3qy7r6duLLNDsBnN1syfpwpRLQgRZSXfloZTLsyDgLIgLD
         lNyoIhd1J53z4i70ebWF93EsYdG3F+RqA7KwLCka0BZu0I0ZeKD9eQn7yNwu4aGaoT
         /G7kHCAHYWC3w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210606202253.31649-5-dariobin@libero.it>
References: <20210606202253.31649-1-dariobin@libero.it> <20210606202253.31649-5-dariobin@libero.it>
Subject: Re: [RESEND PATCH v7 4/5] ARM: dts: am43xx-clocks: add spread spectrum support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dario Binacchi <dariobin@libero.it>,
        linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Dario Binacchi <dariobin@libero.it>, linux-clk@vger.kernel.org
Date:   Tue, 08 Jun 2021 17:52:24 -0700
Message-ID: <162319994454.1835121.11015557847016760060@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Dario Binacchi (2021-06-06 13:22:52)
> Registers for adjusting the spread spectrum clocking (SSC) have been
> added. As reported by the TI spruhl7x RM, SSC is supported only for LCD
> and MPU PLLs, but the PRCM_CM_SSC_DELTAMSTEP_DPLL_XXX and
> PRCM_CM_SSC_MODFREQDIV_DPLL_XXX registers, as well as the enable field
> in the PRCM_CM_CLKMODE_DPLL_XXX registers are mapped for all PLLs (CORE,
> MPU, DDR, PER, DISP, EXTDEV).
>=20
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> Acked-by: Tony Lindgren <tony@atomide.com>
>=20
> ---

Applied to clk-next
