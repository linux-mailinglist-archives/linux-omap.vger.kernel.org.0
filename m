Return-Path: <linux-omap+bounces-6-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D617F615B
	for <lists+linux-omap@lfdr.de>; Thu, 23 Nov 2023 15:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47C2E1F20F44
	for <lists+linux-omap@lfdr.de>; Thu, 23 Nov 2023 14:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997DD30CFB;
	Thu, 23 Nov 2023 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfSdJkXJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BDA2FC42;
	Thu, 23 Nov 2023 14:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DD5C433C8;
	Thu, 23 Nov 2023 14:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700749488;
	bh=qOdkWYm5UvV/HgiRSNx6MF2oGmugCohlm/2HC3o1mdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfSdJkXJvS+mtHT+AedviFCC5Fwt7buyviGMcgvclSiCLKck5taZwx6DN7+Vr8MhP
	 bYybYMtsQZTERqVPVgMzznDeOf1dNbqGyLHKosiiJddBeeR+pcMCKhChs5saZodgtZ
	 qyuOks1rpFxXU6apAiooZehcQudKVAwdNiPDZaWfLE22Q80auZXKk+Z5MWpQeEeLVd
	 SVLaM9SA30kKgY3eDmsV2p9GzukXkgY/P/tyu7qwoaae1qytqDsCUX57l6Dwo3pBXd
	 87u7lO+IrutWC/ytZT/CL1hhgVXrrI+WvBUmrLKbuvHvqeL5lShciRRRquuZ8UrG+D
	 SyqprgaqzmibQ==
Date: Thu, 23 Nov 2023 14:24:41 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/18] mfd: Convert to platform remove callback returning
 void
Message-ID: <20231123142441.GA1354538@google.com>
References: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>

On Mon, 06 Nov 2023, Uwe Kleine-König wrote:

> Hello,
> 
> this series converts all platform drivers below drivers/mfd to use
> .remove_new(). Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver
> core doesn't (and cannot) cope for errors during remove. The only effect
> of a non-zero return value in .remove() is that the driver core emits a
> warning. The device is removed anyhow and an early return from .remove()
> usually yields resource leaks and/or use-after-free bugs.
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> All drivers converted here already returned zero unconditionally in
> .remove(), so they are converted here trivially.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (18):
>   mfd: ab8500-sysctrl: Convert to platform remove callback returning
>     void
>   mfd: cros_ec_dev: Convert to platform remove callback returning void
>   mfd: exynos-lpass: Convert to platform remove callback returning void
>   mfd: fsl-imx25-tsadc: Convert to platform remove callback returning
>     void
>   mfd: hi655x-pmic: Convert to platform remove callback returning void
>   mfd: intel-lpss-acpi: Convert to platform remove callback returning
>     void
>   mfd: kempld-core: Convert to platform remove callback returning void
>   mfd: mcp-sa11x0: Convert to platform remove callback returning void
>   mfd: mxs-lradc: Convert to platform remove callback returning void
>   mfd: omap-usb-host: Convert to platform remove callback returning void
>   mfd: omap-usb-tll: Convert to platform remove callback returning void
>   mfd: pcf50633-adc: Convert to platform remove callback returning void
>   mfd: qcom-pm8xxx: Convert to platform remove callback returning void
>   mfd: sm501: Convert to platform remove callback returning void
>   mfd: stm32-timers: Convert to platform remove callback returning void
>   mfd: ti_am335x_tscadc: Convert to platform remove callback returning
>     void
>   mfd: tps65911-comparator: Convert to platform remove callback
>     returning void
>   mfd: twl4030-audio: Convert to platform remove callback returning void

Looks like you missed the mailing list on a bunch of these.

I'm going to remove this set for now.

Could you please resubmit it and Cc: LKML?

>  drivers/mfd/ab8500-sysctrl.c      | 6 ++----
>  drivers/mfd/cros_ec_dev.c         | 5 ++---
>  drivers/mfd/exynos-lpass.c        | 6 ++----
>  drivers/mfd/fsl-imx25-tsadc.c     | 6 ++----
>  drivers/mfd/hi655x-pmic.c         | 5 ++---
>  drivers/mfd/intel-lpss-acpi.c     | 6 ++----
>  drivers/mfd/kempld-core.c         | 6 ++----
>  drivers/mfd/mcp-sa11x0.c          | 6 ++----
>  drivers/mfd/mxs-lradc.c           | 6 ++----
>  drivers/mfd/omap-usb-host.c       | 5 ++---
>  drivers/mfd/omap-usb-tll.c        | 5 ++---
>  drivers/mfd/pcf50633-adc.c        | 6 ++----
>  drivers/mfd/qcom-pm8xxx.c         | 6 ++----
>  drivers/mfd/sm501.c               | 6 ++----
>  drivers/mfd/stm32-timers.c        | 6 ++----
>  drivers/mfd/ti_am335x_tscadc.c    | 6 ++----
>  drivers/mfd/tps65911-comparator.c | 6 ++----
>  drivers/mfd/twl4030-audio.c       | 6 ++----
>  18 files changed, 36 insertions(+), 68 deletions(-)
> 
> base-commit: 3ff7a5781ceee3befb9224d29cef6e6a4766c5fe
> -- 
> 2.42.0
> 

-- 
Lee Jones [李琼斯]

