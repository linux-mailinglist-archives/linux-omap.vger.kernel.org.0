Return-Path: <linux-omap+bounces-14-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8127F6501
	for <lists+linux-omap@lfdr.de>; Thu, 23 Nov 2023 18:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C561A281B94
	for <lists+linux-omap@lfdr.de>; Thu, 23 Nov 2023 17:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3D13FE42;
	Thu, 23 Nov 2023 17:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOdAwhwf"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB493FE34;
	Thu, 23 Nov 2023 17:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B13C433CC;
	Thu, 23 Nov 2023 17:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700759669;
	bh=trQue5vt4vNug0lKdIifZG1U/sc0mMPLn521Cnxbi8A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NOdAwhwfhaybbj5HEJr6Qhi+fejV93baYjH8jDhcjY3Nh2+cG5MNdp+wOq8pG0A5k
	 ZwOATpEZ3Wy4bBea/ZwdMcxFWdtfm3LRS923s+zCT8yQtAJyYDBc+hBuUhwv3H2P8e
	 H9UBVlNTtcfEWppuxCz1hHHrZbY350a2m94KnF/QzWsNnQdvtcoueMnqd5a3nOebPc
	 91RDbDBj47fJdqzt1CXk3pha1EJmoujk/gcj8buNYkCmtGGiAPe+8u2NnqwHoyn+0A
	 fsb0dLmm42ew0AnhAvgXCvL3Ir82fNE/RItduAYxSOLm3jwSTy2XC4/H2ZvnyRXlAT
	 8RkgBnCtoX2mg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 chrome-platform@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <20231123165627.492259-1-u.kleine-koenig@pengutronix.de>
References: <20231123165627.492259-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 00/18] mfd: Convert to platform remove callback
 returning void
Message-Id: <170075966425.1458093.5482638425880756985.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 17:14:24 +0000
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Thu, 23 Nov 2023 17:56:28 +0100, Uwe Kleine-König wrote:
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
        commit: 05ce16c1303acaf2094f55ea248fd0d14119ed8f
[02/18] mfd: cros_ec_dev: Convert to platform remove callback returning void
        commit: c86e0818174f506e77dcb7ca0251f18269d79219
[03/18] mfd: exynos-lpass: Convert to platform remove callback returning void
        commit: e3468e03a63e8c24a8b2f9f84ed8443268dcccf4
[04/18] mfd: fsl-imx25-tsadc: Convert to platform remove callback returning void
        commit: 05d78da532ededbc11889ca5a22b302aaa8b9e1e
[05/18] mfd: hi655x-pmic: Convert to platform remove callback returning void
        commit: 30441c456171723d4d40ea86fdc7675a630cb5f8
[06/18] mfd: intel-lpss-acpi: Convert to platform remove callback returning void
        commit: 8b7ffe18eb0bf86b21d558c739279a9cb349b78d
[07/18] mfd: kempld-core: Convert to platform remove callback returning void
        commit: 5c9d52223920a70becbbdf67cce192917f997319
[08/18] mfd: mcp-sa11x0: Convert to platform remove callback returning void
        commit: 0082e145163801002a257c2cbaf2982192ab761e
[09/18] mfd: mxs-lradc: Convert to platform remove callback returning void
        commit: f9714ad21b8c01e6964e0638858d37f941dc19ba
[10/18] mfd: omap-usb-host: Convert to platform remove callback returning void
        commit: 7e5e828e1fef60673c20b47573054eaa036d1980
[11/18] mfd: omap-usb-tll: Convert to platform remove callback returning void
        commit: 6ee0e1844c917fb4e5f314aec2b780f1641375f0
[12/18] mfd: pcf50633-adc: Convert to platform remove callback returning void
        commit: 3e6eccaca6923e8d1ac4a0913b3367b5ab94f95c
[13/18] mfd: qcom-pm8xxx: Convert to platform remove callback returning void
        commit: 31b895f2528bda4db526dee1942f915f8f34091b
[14/18] mfd: sm501: Convert to platform remove callback returning void
        commit: 69fbad222c5caad34f777da33271ccdad3d9504c
[15/18] mfd: stm32-timers: Convert to platform remove callback returning void
        commit: 59569bc36fcec1cd62bd2f639784126c87c6fd1e
[16/18] mfd: ti_am335x_tscadc: Convert to platform remove callback returning void
        commit: 1dbe13baca338502bf741bbe3b199c07c7d1c5bc
[17/18] mfd: tps65911-comparator: Convert to platform remove callback returning void
        commit: 4aa72c8515734c2edf4c6c264aee4925efd97366
[18/18] mfd: twl4030-audio: Convert to platform remove callback returning void
        commit: db1e0b072da189db99f905b758676a81bb796a1a

--
Lee Jones [李琼斯]


