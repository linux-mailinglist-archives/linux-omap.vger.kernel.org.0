Return-Path: <linux-omap+bounces-2931-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B7C9FF3C0
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jan 2025 11:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B23DC161594
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jan 2025 10:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F0F1C5F38;
	Wed,  1 Jan 2025 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sJogh6b1"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-79.smtpout.orange.fr [80.12.242.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C1C1C5F2A;
	Wed,  1 Jan 2025 10:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735729159; cv=none; b=u7wy2hHZtPve/MQ6nnW7/IRb4lxF7/Alop1r92OwBhQcawJTctisckcrG4ytHf/Wm2wdpwPfX9kWxsipil/qXbVo6bDn+zjwLBtwse7HjmFUKzPtJ6PpVVYRbdd0H7pOI6qMCbsM00zc+qpuAN1UGZwbVwam0XfdEJGD+gUoFbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735729159; c=relaxed/simple;
	bh=BTQ6BmkLMUrSGBB4aCe5RcuM7m4kMCRUMkpG77sOwbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwJO8RS8qHijjeBbBBQNlaQLkljXtV0kEWhlyNGpeHB9nLBf+KynpRBRfShOJ2CdSbhoxf62XrLE5MTF8ldCspcaJ7Kcsi+QzAdJ+D8Hlx0p5IkVPjiXrKCLhcUPsQuuhrBPuN2xoCKYJ+uPs3fXRZqU6oE7qUGq2cpe+R2k+gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=sJogh6b1; arc=none smtp.client-ip=80.12.242.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id SwIRtt4E3C9fHSwIUtDi5U; Wed, 01 Jan 2025 11:49:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735728596;
	bh=LkvC23HeGzWe1812QhFr2g0YNjZP/ZYChJLIBRqWQck=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=sJogh6b1Knzfi3PZdFaSfT/+dFSA7wKfnF6+Lgr/qTPmu/fjcR1eVv3MnGzT7vc1T
	 LFOUMUZu6WCY6amhmtgA4UhnAxIJCw1f9oAiEgO8MTSq/AS1WFAg2ciP7lT1MjYPs6
	 WQNktGEsl2jqzc+Z7CD2/ujudnn9xEN3dlJ+LzBMuDWjkKl/XRQ2c7Yv88yhM9xHO6
	 ZNDg0YYeOHCEvSzchu5vhl4E/H/6zQlVghfZnxgY/qWGWfyB5n6VuVv3w0G9zfOjpa
	 zEtcfsxa/huh0KZ8VMS57VS0RnsddP/QU24VyGYi3gKf+YmhxwGgUo2VyvwigrEVJ3
	 ELjm6+PkLuNnA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 01 Jan 2025 11:49:56 +0100
X-ME-IP: 90.11.132.44
Message-ID: <2096b9c6-7397-43b2-8527-f16bca6d1576@wanadoo.fr>
Date: Wed, 1 Jan 2025 11:49:51 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/7] regulator: tps65215: Update platform_device_id
 table
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
 khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
 jerome.neanne@baylibre.com, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com
Newsgroups: gmane.linux.ports.arm.omap,gmane.linux.kernel,gmane.linux.drivers.devicetree
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-3-s-ramamoorthy@ti.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241226215412.395822-3-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 26/12/2024 à 22:54, Shree Ramamoorthy a écrit :
> Add TI TPS65215 PMIC to the existing platform_device_id struct, so the
> regulator probe() can match which PMIC chip_data information.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
>   drivers/regulator/tps65219-regulator.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
> index aa65077f9d41..b8a178ae6b42 100644
> --- a/drivers/regulator/tps65219-regulator.c
> +++ b/drivers/regulator/tps65219-regulator.c
> @@ -344,7 +344,8 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
>   }
>   
>   static const struct platform_device_id tps65219_regulator_id_table[] = {
> -	{ "tps65219-regulator", },
> +	{ "tps65219-regulator", TPS65219 },
> +	{ "tps65215-regulator", TPS65215 },

Maybe keep alphabetical order? TPS65215, then TPS65219.

CJ

>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(platform, tps65219_regulator_id_table);


