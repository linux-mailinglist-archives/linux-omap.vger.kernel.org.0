Return-Path: <linux-omap+bounces-1784-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD0F93BD35
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jul 2024 09:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2B50B212AF
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jul 2024 07:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C929216F908;
	Thu, 25 Jul 2024 07:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWooGVUF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036916D4EB;
	Thu, 25 Jul 2024 07:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721893125; cv=none; b=UyYXvK/sRk20UyxiMuk0Q8zkQrA5AG9Blfn71mAiV9+x2pidH4+qs1mWBiORJyEiXQhAnyXXEoaZt0eWyfC5Xk/fmOX/2G/lrQWM4DaJlP+3+I7kCpIvKRh6JnHzjb+s6wmzQ49hULD8dBnceIijOXpoOxiSH3Qbm62VaJMtP78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721893125; c=relaxed/simple;
	bh=HMZ59d0QQcFxIU/3yuJzYmOoxTfYErWIJCpFef5W/1o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HqxjNhL3CD4gRVRt+ufLaj1CouDEwbhr+h0ysSImQXlzXlYiqtvM2fNEao3yO9BB+48b1qdAQVMVMl5QrEtPNsc2OmF36vPKR7/FpYQzFyXwshK7qyAfNHu+y/ZXvcdwoI7GKkMy8SMFgvOkayku52f6keRJfMsjkW1HBXZOGIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWooGVUF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D35C116B1;
	Thu, 25 Jul 2024 07:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721893124;
	bh=HMZ59d0QQcFxIU/3yuJzYmOoxTfYErWIJCpFef5W/1o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iWooGVUF8ucSxkV6Xf5ZZIXDbPnYWxO63OAYbvQwY2wIuxRxUmGIyVJovZxxURnRg
	 O6NOSa84jx0tDbi7gTNHHszT3dBZtOESJDj77EVDPr3lLulogEauVu7Czecq+JmWQE
	 EpZCecEKsZrGVEWm1wQlpPAuAfRX9DyOt/jWD7R66lbZXdpe6GhdiaJ4vAktca6iQd
	 s16xH1MAa73XCbuSmYyDE5Ro29ZEaxRRpZIhAC66vuGGXgCVk0jdwSvz32+M4agvWq
	 EEDU032FsHx/d7hNyiam/Uh5CEtojryquR/iLdaNN2uW3I7nYBMerkOeohpG5561zg
	 dh7y6s0xepAyw==
From: Lee Jones <lee@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
Subject: Re: [PATCH v2 00/24] mfd: Constify read-only regmap structs
Message-Id: <172189312066.829443.1132991130296167068.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 08:38:40 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 04 Jul 2024 19:23:10 +0200, Javier Carrasco wrote:
> This series adds the const modifier to the remaining regmap_bus,
> regmap_config, regmap_irq and regmap_irq_chip structs within mfd
> that are effectively used as const (i.e., only read after their
> declaration), but kept as writtable data.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> 
> [...]

Applied, thanks!

[01/24] mfd: da9062-core: Constify read-only regmap structs
        commit: 7115800617cd41295bb617e865997f227acd480b
[02/24] mfd: fsl-imx25-tsadc: Constify struct regmap_config
        commit: d932e461919cfa45185a0a22fb1a8427154b62cb
[03/24] mfd: hi655x-pmic: Constify struct regmap_config
        commit: d63abd1ced3613df64ed3e1d2e9f96895082f4bc
[04/24] mfd: wcd934x: Constify struct regmap_config
        commit: 3a782d2bf136c965f906f46d6cd35d4a0dabb5c7
[05/24] mfd: tps6105x: Constify struct regmap_config
        commit: 717df26d77b2ccd8d4f0caf3c2eb618dde2ebc81
[06/24] mfd: rohm-bd9576: Constify read-only regmap structs
        commit: 8235b063a2f8dcf2134fe6473da9cf35992ac305
[07/24] mfd: intel-m10-bmc: Constify struct regmap_config
        commit: 00bec2661357619d6eab7ea1cf5c6e8f5c1e1126
[08/24] mfd: 88pm80x: Constify read-only regmap structs
        commit: d038949e314c44db404ca49a4e997541c820e375
[09/24] mfd: bd9571mwv: Constify struct regmap_irq_chip
        commit: cb3394781af9e0047eb8e8c011cff0ad896d01cb
[10/24] mfd: intel_soc_pmic_bxtwc: Constify struct regmap_irq_chip
        commit: b830d915328f3077b3348a755e4178ddde588ce8
[11/24] mfd: retu: Constify read-only regmap structs
        commit: 9b0addc34a642670e73c551fe3625b137ddbae1c
[12/24] mfd: rk8xx-core: Constify struct regmap_irq_chip
        commit: 5ca2a7c1b45ba098e6795a3c93381192f8e430bb
[13/24] mfd: rohm-bd71828: Constify read-only regmap structs
        commit: 2d008372467f94872a47fbc51da4bee5a1fadbd7
[14/24] mfd: rohm-bd718x7: Constify struct regmap_irq_chip
        commit: 0bc081166936b66a600b0d898515032fd8cc0399
[15/24] mfd: tps65086: Constify struct regmap_irq_chip
        commit: 013e84b4d3f99c6e193123a4cf5c0c522361eb71
[16/24] mfd: tps65090: Constify struct regmap_irq_chip
        commit: 75a23bda7f86ebd6142dce395da6a1e30ecd1c58
[17/24] mfd: tps65218: Constify struct regmap_irq_chip
        commit: 9ae187b9b12674742c44a3ce0bb2249f3896b41e
[18/24] mfd: tps65219: Constify read-only regmap structs
        commit: 40ec8b0e239907768d9e3ab07184fde43ffaff9b
[19/24] mfd: tps65910: Constify struct regmap_irq_chip
        commit: 4a8ff7bf4d296e41bb334261be609c8c8bfbda49
[20/24] mfd: tps65912: Constify struct regmap_irq_chip
        commit: 9e94b883c645f7d0579d39b4b72490664bc743f0
[21/24] mfd: twl6040: Constify struct regmap_irq_chip
        commit: 430a8ffb83bf078ad7c63ba4c9eb0c3273302ef7
[22/24] mfd: gateworks-gsc: Constify struct regmap_bus
        commit: 07d43b15688c17a2dc93c9b1ac415c85e81d6bcc
[23/24] mfd: mc13xxx-spi: Constify struct regmap_bus
        commit: e23fd4be80dd6b9b6f55c1968a2b89725e9755b7
[24/24] mfd: sprd-sc27xx-spi: Constify struct regmap_bus
        commit: 8b5a164a9f8396aab242b14d00ad58b8ed7ef7d8

--
Lee Jones [李琼斯]


