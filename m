Return-Path: <linux-omap+bounces-3972-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF18AE7EEE
	for <lists+linux-omap@lfdr.de>; Wed, 25 Jun 2025 12:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 072DD1895B4E
	for <lists+linux-omap@lfdr.de>; Wed, 25 Jun 2025 10:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80172289347;
	Wed, 25 Jun 2025 10:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rwKkzqYP"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C95027A108;
	Wed, 25 Jun 2025 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846736; cv=none; b=kylbdjHqzdBC38LYYWyeJZXzYear3xg+0DVWs46cCjgmqrQOFbJjuzaZZzrZ1AZgGtqROD1c67oHwY4yQZ4Tjp3fNVFa54wmFmq5FoEefQxtOVUO/+bC3EQAW8x1Oq7UDOaWpG7A+miit0nn11n+QNcekoxsp3Pa5x7WSo20Q78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846736; c=relaxed/simple;
	bh=707+4ZehC62SGJVf5mEnDaCsrnbGkejpVys6WVXWV0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r1Fx9MVlI/LJEttma4ILlqUtAWtdxLIaIwbxOOAq8GmHinnxgm00W3U6yn8CmFepdp7yzNx8G1lM2vNc6XwNki/OubYoLXUQc2h+4BRGMa0E+XwXTJRief3ZV5Wz7bGaWNpKWF2mw2QyXMunxhQ5Cw4DS0XQsAHYgiRwvk/KyUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rwKkzqYP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D03C4CEF1;
	Wed, 25 Jun 2025 10:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750846735;
	bh=707+4ZehC62SGJVf5mEnDaCsrnbGkejpVys6WVXWV0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rwKkzqYP9dVm1LCqMG+/ya/eq8v00v1kHUtYlJoMuAjHlPEMZmV3rqkthkSqncZ/3
	 JVilpPNU5Afxk6tXdwBJ/LkcvUXClthbpVDbbsMJNezWMLgmTMPUSKlUnO2AT+Zme+
	 S+QI41O1Ud6hzgR49Pbm8a2KjaD8LCW3SbV79Wvk1+qhhZ7KdUE7mR+CtF90CkefLo
	 HLEbhCW/o14qxjmaWcYsg2MSdpPRptJaCZsQK21ib2npFfNWt8PYCir3XkgExK8gHn
	 UhzDXoJKHxt+1NH0sm325I5EHmUbPpQ3HP7E9aNScU4VIeZdsyw+DpBDETsHnwhBK9
	 tUlfhRhhF3VZQ==
From: Lee Jones <lee@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Lee Jones <lee@kernel.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <117946696551de41b706ea9b973a7ccaacea5178.1750530460.git.christophe.jaillet@wanadoo.fr>
References: <117946696551de41b706ea9b973a7ccaacea5178.1750530460.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2 1/3] mfd: tps65219: Constify struct
 regmap_irq_sub_irq_map and tps65219_chip_data
Message-Id: <175084673360.4146676.5481876655573525593.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 11:18:53 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Sat, 21 Jun 2025 20:28:20 +0200, Christophe JAILLET wrote:
> 'struct regmap_irq_sub_irq_map' and 'struct tps65219_chip_data' are not
> modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   27804	  10016	    256	  38076	   94bc	drivers/mfd/tps65219.o
> 
> [...]

Applied, thanks!

[1/3] mfd: tps65219: Constify struct regmap_irq_sub_irq_map and tps65219_chip_data
      commit: 33b7335e37896ffbc8cc5dcd46f82d5a0e654bf8
[2/3] mfd: tps65219: Remove an unused field from 'struct tps65219'
      commit: 0bbdb525bfa39980bb2f4bdaddd73591eedb6346
[3/3] mfd: tps65219: Remove another unused field from 'struct tps65219'
      commit: ea003d0598460c84effb55a13c362c9c1c6e1cd7

--
Lee Jones [李琼斯]


