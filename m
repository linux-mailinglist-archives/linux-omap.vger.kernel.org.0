Return-Path: <linux-omap+bounces-5-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E04F37F6133
	for <lists+linux-omap@lfdr.de>; Thu, 23 Nov 2023 15:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AEDD281ECB
	for <lists+linux-omap@lfdr.de>; Thu, 23 Nov 2023 14:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E296A22071;
	Thu, 23 Nov 2023 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyD0Tn94"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D8B25555;
	Thu, 23 Nov 2023 14:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D3AC433CA;
	Thu, 23 Nov 2023 14:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700748828;
	bh=AGcHXRfH/rMMp6hJ33VbDXNVCM278y+An/5lGPmz0s0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZyD0Tn94bo2vGeCq3N2ptlQvcAkslri04FYrRMwqbePwZ+mrHfj44rJe0x8L7Fwce
	 nM70shIvtFAyssZZAbSm2yjkuolfpX77ONc+iFzORXqg6uf2+diIauo4Dp2dpWdFxM
	 ZsFDThS7tkHIQHJaEDHKac4rgQkJbk8zm2KknhNQIMt0dk7iTD4FpPyFr4fcGnvYoq
	 X10nmPcEwialBwZ3BDmP2Rt3cXsLBgf17igT9eEH9QEmw2wx4BRe5epvm4wuSoUyQu
	 MxupRq4LoE4MP56WgzXG1SgKmztvRgpQgIi2+nTIqHFDsXcGurZph1gmaFL2siUG7X
	 0R8Dzf1MUawjA==
From: Lee Jones <lee@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 chrome-platform@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
References: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/18] mfd: Convert to platform remove callback
 returning void
Message-Id: <170074882434.1350828.3000645128153974049.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 14:13:44 +0000
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Mon, 06 Nov 2023 18:17:09 +0100, Uwe Kleine-König wrote:
> this series converts all platform drivers below drivers/mfd to use
> .remove_new(). Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver
> core doesn't (and cannot) cope for errors during remove. The only effect
> of a non-zero return value in .remove() is that the driver core emits a
> warning. The device is removed anyhow and an early return from .remove()
> usually yields resource leaks and/or use-after-free bugs.
> 
> [...]

Applied, thanks!

[01/18] mfd: ab8500-sysctrl: Convert to platform remove callback returning void
        commit: 35cf346f9fa92ceb19c5d2edc4409a7d384da8ee
[02/18] mfd: cros_ec_dev: Convert to platform remove callback returning void
        commit: 981c92a1d65a7ccce2d814c66ff2deecca304672
[03/18] mfd: exynos-lpass: Convert to platform remove callback returning void
        commit: 2d859aa8e081884c0c02d738925cba23a8cfb1b8
[04/18] mfd: fsl-imx25-tsadc: Convert to platform remove callback returning void
        commit: f215b75acc85254a29404b32c871b7ff2ea8da2a
[09/18] mfd: mxs-lradc: Convert to platform remove callback returning void
        commit: beb1f9e6382f59339e118594c94ee6b5ac96f3ec
[10/18] mfd: omap-usb-host: Convert to platform remove callback returning void
        commit: 231927898ae91049aa35d237c556cc216d80e8f7
[11/18] mfd: omap-usb-tll: Convert to platform remove callback returning void
        commit: 83d4e355240147db7597ea1ce64624fcdaaee6ae
[13/18] mfd: qcom-pm8xxx: Convert to platform remove callback returning void
        commit: ae3bcd5b09e35f363aa1744d38f90fda2b40e9ca
[15/18] mfd: stm32-timers: Convert to platform remove callback returning void
        commit: aeebc47f8d479c363e24fba0201ef8dca417fe6e
[18/18] mfd: twl4030-audio: Convert to platform remove callback returning void
        commit: 3716978b584a8baaba16d64c93eb0fed0edcbc3b

--
Lee Jones [李琼斯]


