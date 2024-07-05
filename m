Return-Path: <linux-omap+bounces-1730-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CED92814C
	for <lists+linux-omap@lfdr.de>; Fri,  5 Jul 2024 06:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC3BB1C2255A
	for <lists+linux-omap@lfdr.de>; Fri,  5 Jul 2024 04:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B4765E20;
	Fri,  5 Jul 2024 04:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEQOGGJs"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545812AE6A;
	Fri,  5 Jul 2024 04:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720155251; cv=none; b=nEMuMB55YxulO0RpUofOfKCJsG/NHdPzRl5etXtzfX97Q6HQgwnCLtrjdm1rvxu2qcf+0eE78d2izQPxBCWEaAd/JBnehKhfEf6Yt0Gl4ha4YT9raBbJ9qhUyeuE71wCX6TVC4pjeMeVgQAxr7yd4EfOYpZlDhNYkCkfnC174SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720155251; c=relaxed/simple;
	bh=E2jAy5I7N+o8z5conGKpYZF1bx37yHfwltgnD/ccXOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GKU0vWuaShFBJz6rzJzJ6qRo8HktNlB1CbKggYYj/NyuE5GmXuRvB2b25zSNdDgE/NoxdhivVgKVrSMl3iKWMGVLvFlEMNUZiH/Yd4o0/hNAxvbIyRwHCn8y0YKpIhthDxvnyjHQ/b8UpWLBJNJ8Q/Pd0NoOsxaIJwtzLFV+A44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEQOGGJs; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52e7693c369so1668461e87.3;
        Thu, 04 Jul 2024 21:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720155247; x=1720760047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQ8Be9g2pzsTx6g6CtiD+JiLK1AMOdko7+ZfugSfQzo=;
        b=jEQOGGJsQsLNX9gxZWmNxMG1UaRHO2iPfbQIjkE0ik3UUzgzTtNpPSJBwRTfm6+Fyz
         0aKfNLtdzimcpkcqzSc6wOMU0r/pAqWvRzco4N8alG6BjSzNMSxjZAUkGDFaXmeUdpyg
         x5b7kJzppL72RKhv2aN+8Ic0ZCbgi93bTXfcaeRwClVK5L3qXbIBvTp8cOcmxiY1P+3a
         xRFAHzuZ6935ZwTq1B/8y0HDWQcQeni7o3QaFU2gZ6PZOKhO3DW50KPGiEcPoPPKOArK
         gM/HjmeFU7hThqlL+KUrMZVVogy4AbyhwKnjeO6rJ9qssNC1iJgz6mxl03scBvJfBZG7
         WTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720155247; x=1720760047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQ8Be9g2pzsTx6g6CtiD+JiLK1AMOdko7+ZfugSfQzo=;
        b=mdpUgP4ucgylVo4LuPGInB3uYDtcbqGjN/u7w39SzDoxV7jG2G4hCjZIMGYfAz5FGN
         R6AdL/MP7EC0Xq1k02ad4T71rDOCdGlqD1NZ/EQkFwvjul/tHZ+bwZs1yNd595WCZor/
         Cf0DmigvVHoztKfnZkrkYiYlxM0531sCqIlBU4507KuLe8qktbsjSpPfKUHnjLqXpOUu
         h4D5+eB0jk752aA1rxya5ileDlMPUhgdz4GoKBI4HFl7JiHBBw0MZQuYnJi6ctyHOxPu
         bvRopsCXR2Xbf5tvh9QD4e+1uzXvZbDKu1vReHWN+LbSR/cx+SlBJBfZtqkTHce/Qsr6
         AM4w==
X-Forwarded-Encrypted: i=1; AJvYcCXop3oKdwiQH0c6ESuIe+RjEWhQU3LiDDeIh8urE/VKsQz2xZxvv13PGX2+oGJCN0N+08T6kspQ4Vhq6xg5e7XOgDBtEECCd5iQCRFc1Rm3bt6Ng9XFM6IVuTX5cq63vc1vMOCfikKfQO2hGYoW
X-Gm-Message-State: AOJu0YzBEULIGmQpNx0MzC6OmvS2A+KtNMic8B5+bcrpARRePF1DkUEK
	eQ4/GkAkkULShvUe2V47xS9uIerFj+GDk8v8mI8XYddds4VEZ8gW
X-Google-Smtp-Source: AGHT+IGj44uGCh9JIY4RYcfQemCEKLBK5WUZyizfBrWxRR2/ZppG5Hpmnmc4T+lCs23rpz8eZdLjpg==
X-Received: by 2002:ac2:5a5c:0:b0:52e:a008:8f39 with SMTP id 2adb3069b0e04-52ea06f55f7mr2523055e87.59.1720155246515;
        Thu, 04 Jul 2024 21:54:06 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab3b255sm2669892e87.260.2024.07.04.21.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 21:54:05 -0700 (PDT)
Message-ID: <62e4ee02-9b71-4281-b2b4-fd99c55ec585@gmail.com>
Date: Fri, 5 Jul 2024 07:54:04 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/24] mfd: rohm-bd9576: Constify read-only regmap
 structs
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
 <20240704-mfd-const-regmap_config-v2-6-0c8785b1331d@gmail.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-6-0c8785b1331d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/24 20:23, Javier Carrasco wrote:
> `bd957x_regmap`, `bd9576_irqs` and `bd9576_irq_chip` are not modified
> and can be declared as const to move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks! Much appreciated.

> ---
>   drivers/mfd/rohm-bd9576.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
> index 3a9f61961721..17323ae39803 100644
> --- a/drivers/mfd/rohm-bd9576.c
> +++ b/drivers/mfd/rohm-bd9576.c
> @@ -57,7 +57,7 @@ static const struct regmap_access_table volatile_regs = {
>   	.n_yes_ranges = ARRAY_SIZE(volatile_ranges),
>   };
>   
> -static struct regmap_config bd957x_regmap = {
> +static const struct regmap_config bd957x_regmap = {
>   	.reg_bits = 8,
>   	.val_bits = 8,
>   	.volatile_table = &volatile_regs,
> @@ -65,7 +65,7 @@ static struct regmap_config bd957x_regmap = {
>   	.cache_type = REGCACHE_MAPLE,
>   };
>   
> -static struct regmap_irq bd9576_irqs[] = {
> +static const struct regmap_irq bd9576_irqs[] = {
>   	REGMAP_IRQ_REG(BD9576_INT_THERM, 0, BD957X_MASK_INT_MAIN_THERM),
>   	REGMAP_IRQ_REG(BD9576_INT_OVP, 0, BD957X_MASK_INT_MAIN_OVP),
>   	REGMAP_IRQ_REG(BD9576_INT_SCP, 0, BD957X_MASK_INT_MAIN_SCP),
> @@ -76,7 +76,7 @@ static struct regmap_irq bd9576_irqs[] = {
>   	REGMAP_IRQ_REG(BD9576_INT_SYS, 0, BD957X_MASK_INT_MAIN_SYS),
>   };
>   
> -static struct regmap_irq_chip bd9576_irq_chip = {
> +static const struct regmap_irq_chip bd9576_irq_chip = {
>   	.name = "bd9576_irq",
>   	.irqs = &bd9576_irqs[0],
>   	.num_irqs = ARRAY_SIZE(bd9576_irqs),
> 

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


