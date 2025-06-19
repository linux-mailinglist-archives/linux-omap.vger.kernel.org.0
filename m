Return-Path: <linux-omap+bounces-3921-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBCFAE0BF0
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 19:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88D111BC60D7
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 17:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCC928CF64;
	Thu, 19 Jun 2025 17:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="k1WBoqjM"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E720728BAA6;
	Thu, 19 Jun 2025 17:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354255; cv=none; b=O+EIpUpPth4oWmd78YdYbuvqABAKfpItv8KiGYf5aTkDVKm06DVbVATZzjgt6aqpUa7XWrG1kOEdEaYfdHbxBXdqLCDmTI9W3w29hjB44GsV0iDF18xzuHOh3IvqOAe8r4IJ2dgFZrdya6GbJk/wXrAjt+O/1qi1TnQZ1DRAHI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354255; c=relaxed/simple;
	bh=seMA55tG12GKC9us6NQyBus+oYguF2OpmkJaoUsW4tk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZLI3bhZ+Zc3MxgtLIlJ9JB+C30os/Fn55vNAtF+GSSC6LsSulL3PCFL9cznAlRFVDGt0PXk/GkBnpffAOm5jd4gqBk/2pgXmc4UxpPfHTjPoc2lEtgOgwPvSLl8/7g09oJlEB9dRc+4fegLzCq9JwzQvUwXz9Nnfj4ki4A7IgNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=k1WBoqjM; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5nmRo8IHl/nP2HAcCKt4Ggd76EUOVWZiwyXUyi2m+1w=; b=k1WBoqjMVS2fHPA9zSLSHsD62E
	ipWOMQZT0EPT2OTukVzD3PGwqlrGs8Ai4zAHRdcrdvhSbm4DLDVR2x8rQUq3w4hJntQkB/3dRVYEU
	+ifcNQDNSLnGzxz0tDHjPKp2bOEgipczMjJv+rNDmyy2slQy0K7e9TwmPMaSOO0bJCAaptjPDHnK4
	ftQkaG9cvk9dkddM9zVmUo3s/0APGVmXpb6b+X4NTbHzJHgbPrQRYsmgRjeaEUnsLP1bxzGb50ubS
	dgPVlcGXQVuvLKHDLADAZd11j4ur91Noy4PrlMW5Hg0jOMxBDvZLBwhOHa1vngN/xoD6jo1eHm0b3
	CDwVCIYw==;
Date: Thu, 19 Jun 2025 19:30:38 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Dhruva Gole <d-gole@ti.com>
Cc: <s-ramamoorthy@ti.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <aaro.koskinen@iki.fi>, <khilman@baylibre.com>, <rogerq@kernel.org>,
 <tony@atomide.com>, <linux-omap@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <m-leonard@ti.com>, <praneeth@ti.com>,
 Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH] Revert "regulator: tps65219: Add TI TPS65214 Regulator
 Support"
Message-ID: <20250619193038.4e1f42c8@akair>
In-Reply-To: <20250619153526.297398-1-d-gole@ti.com>
References: <20250619153526.297398-1-d-gole@ti.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu, 19 Jun 2025 21:05:26 +0530
schrieb Dhruva Gole <d-gole@ti.com>:

> This reverts commit f1471bc435afa31c8c0c58551922830dc8f4b06b.
> 
> This was causing boot regressions [1] on many BeagleBoard platforms
> like the AM62x based BeaglePlay and PocketBeagle-2.
> 
> [1] https://gist.github.com/DhruvaG2000/75b7d5ced6c09d508ee0ad5ab1f19707
> 
> Signed-off-by: Dhruva Gole <d-gole@ti.com>https://gist.github.com/DhruvaG2000/75b7d5ced6c09d508ee0ad5ab1f19707
> ---
hmm, do you need to really revert everything? Apparently some code
slipped through affecting the tps65219.

[..]
>  static const struct regulator_desc tps65219_regs[] = {
> -	TPS65219_REGULATOR("LDO1", "ldo1", TPS65219_LDO_1,
> -			   REGULATOR_VOLTAGE, ldos_1_2_ops, 64,
> -			   TPS65219_REG_LDO1_VOUT,
> -			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
> -			   TPS65219_REG_ENABLE_CTRL,
> -			   TPS65219_ENABLE_LDO1_EN_MASK, 0, 0, ldo_1_range,
> -			   2, 0, 0, NULL, 0, TPS65219_LDOS_BYP_CONFIG_MASK),
>  	TPS65219_REGULATOR("LDO2", "ldo2", TPS65219_LDO_2,
>  			   REGULATOR_VOLTAGE, ldos_1_2_ops, 64,
>  			   TPS65219_REG_LDO2_VOUT,
> @@ -366,23 +326,13 @@ struct tps65219_chip_data {
>  };

e.g. this.

I think it should be relatively easy to only revert that part without
needing to revert it fully.

Regards,
Andreas

