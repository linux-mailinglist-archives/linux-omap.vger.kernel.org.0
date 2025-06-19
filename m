Return-Path: <linux-omap+bounces-3911-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F508AE03EF
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 13:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E501179399
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 11:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42A7242D63;
	Thu, 19 Jun 2025 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzMkdkAA"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A8623B627;
	Thu, 19 Jun 2025 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332903; cv=none; b=aOW8/y2QKdkXg1mdf6oQuiUQOvj2h3OuxWRgjvdjUHjm+6T0T+PcTb/PPU6t/+ebYdSqjhV1PnciCYOiC2u8GTEWUhU2eIde8ci8+PgBYGbVGRK+v0c3X+CisBALAuJ5/XC1k4Yd+5Mw2OoLS8NGhFjW43u43MgYqAD7aTcYu9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332903; c=relaxed/simple;
	bh=OSekkCHN37/wFSljw2iH1JTgpKEfUG9ZYdnTvES6x0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HDnrF+ToXk7itoqT0tgTYV00B3yZWWJ54LKvMbeCvIWhuNu8MU3G9KO/cO9afpy2/hYVqMYEbm9gGhsIfn+FES7P48royhpwBtLBv7zExrGZcV4Nn1w6GXW2jhfAmwe+vTxlEN26Lee7Zs/nHC6rxSYOlbxFkyAWzdwTlPPjyaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzMkdkAA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB84EC4CEEA;
	Thu, 19 Jun 2025 11:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750332903;
	bh=OSekkCHN37/wFSljw2iH1JTgpKEfUG9ZYdnTvES6x0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YzMkdkAAn+eR8VtWUKEsYGskQ9UTPoAxVdqpd9edRCZG1AhpNzbhDK1TiH9VBAb9s
	 wzigTGDSKEmFxLKeFeF9uWACGnCWOfc0Tgs1QOqELnnEPCDutD0g0io+rhbjvWRzDD
	 UcFQeM0fNTxdluWbrZuMNtwcJxw/FSBCgBWPrQuoxlUqPEpiSzHg4WWE3hSF+BjVYo
	 8OChQvHya7k+wmcvM0GiJ3PLZ3T4S8tyguiPxebueO0+Hcxh+ra6igU8CHh3WyJ0sf
	 aj8Q9l5kKKWpDy5bAjYDyV7V5WgDTiMymp1FknPJ85lRa+90Xk+fsyPH4VlH0vdcSk
	 fQEU6cg8izszw==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, 
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, Lee Jones <lee@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250611104348.192092-13-jirislaby@kernel.org>
References: <20250611104348.192092-13-jirislaby@kernel.org>
Subject: Re: (subset) [PATCH] mfd: Use dev_fwnode()
Message-Id: <175033289843.706988.8724251028976565230.b4-ty@kernel.org>
Date: Thu, 19 Jun 2025 12:34:58 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Wed, 11 Jun 2025 12:43:41 +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> 
> [...]

Applied, thanks!

[1/1] mfd: Use dev_fwnode()
      commit: 0cfe69476ebf3a27b074848f2a147ae22c2d84fc

--
Lee Jones [李琼斯]


