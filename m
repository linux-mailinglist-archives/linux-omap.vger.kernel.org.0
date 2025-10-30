Return-Path: <linux-omap+bounces-4818-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE8C220FE
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 20:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8E5534EF08E
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 19:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B349329C52;
	Thu, 30 Oct 2025 19:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="CvceYUOT"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3B7318135
	for <linux-omap@vger.kernel.org>; Thu, 30 Oct 2025 19:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761853685; cv=none; b=PyBtYEkfOjdFIWdoQoBU1a/9FtcLB+COKYetLBBAoGnq37SEz3YEHwvJPf42sdRTuWCtEJQINF1fs/Bm75D597KioST3aqhjNBTRkjhEsfr9VKnds5A2nopwjyrL7bjHmTHMEkNOXXOFbGNtpgSchbXybJSU3AzQcGUGONlNdSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761853685; c=relaxed/simple;
	bh=V4gEPAw7c1Xo4RZkpTqr+1GnVCaVV1FvxqrK4WYDs+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mdkh1sRSPnJuRJmSM7AanI0m4GyOfBaaX75SX62B14aPafm0sDID/boutEv/yRXZiKE+LgLoSfEN55ohvH10d7ATiQMC2spIngOFX/7V1AZ9GtXLGjSMXZhNZmsTbzqMip8CzSgrgJeMYTfxo7zrx787yZD8qShLjKFHZXuZ41E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=CvceYUOT; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-92c781fd73aso126950939f.1
        for <linux-omap@vger.kernel.org>; Thu, 30 Oct 2025 12:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1761853682; x=1762458482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NyHHMh5+Ig5nWuJhvXvhTG1NXrgVmuFvDzkpLb+CBVo=;
        b=CvceYUOTB+FRho/0jLwdeDHwLRh0JG9FQ4viQzA2wIjA4GcXLQgp8ubJ2bXYOwHKkz
         iWmHK/5+6+kTKZTtzsr+EmXoYyi3uO7UpILcotArh4WaOGFlbblagdWvVEKEDJqHLhAv
         CSPc9CK2Ly2/y8hbt7EIv2vrLk4SKj5pPOUIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761853682; x=1762458482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyHHMh5+Ig5nWuJhvXvhTG1NXrgVmuFvDzkpLb+CBVo=;
        b=qbaszuvzzhQpJO8RmGe9WNyLeMrzIacniCst0XFiyBWit0Yn9O42TYMBHDWvIU8uCO
         rFLLpj60oD/c5tJBX43GAXzstlSftT1WqcGtdg3K7A+g3hEkezShZJL79WywCCK7xzg4
         7B7Sd8Cilz3S4rlNnIDfixDT7Md68XQ4aXVkWBQ0xR9eBeZb8QGcedfpTPovUBBQFuGh
         1pU4aEtiM1RZL3lojXZmS0MR7kQCdMhH5FquLWi+x0hKZ8kAcl3aSwccDHMJUC43Z2Lz
         OgSvXSqxwH0ZsSkszuXqyh+98bp87ZI70i8YZx4YSNTnFM0r62vLX/IUS758MX0itcxq
         +JHg==
X-Forwarded-Encrypted: i=1; AJvYcCXwY1mdRCWxRrxl3HZu62ffoRnrUJH66X2S7vSw62MSJVjsJX5DAAJsQCPCQgYSsXIlB46ov0J+rhzr@vger.kernel.org
X-Gm-Message-State: AOJu0YySf0OFSXHM06ujYwrisFLS+wmVa6Yhfe4VLbpupuOZt1TsJIb2
	I2AOPN+oeZ5pqQywNW7qpLEEW8856t2OdUL5g+8GLjJ5uDdJEVBpvX3kqM+DX9nVcg==
X-Gm-Gg: ASbGncum/Z2+HGA8st7NMxv0y8rg28wipQCCBfniU4CnGWpvmDMYXnCTFYpdk+GL26G
	B5QRQcDNNnwvFSKXbwvhKpAVc0XsFAGuNDGQEmoHeFDslpbId9vRWTjeTtBLaGwipMOjozq/D7q
	rrZYtjXuzNNGMF5Vgyx14bzggGvHBCgDUNMXaDOh17djtGfwkh2HszgT9xioA1axWJihTb2T4T6
	tPMCjTEsu5G1akJxaFg6dD1B/O9IZso/ZcI5n8d+G9R9YKLctIdI51vZidDx2WSR8wE4XMXL6zr
	hVe70hd2w3XgSqh+ong2uHmYovBLvrO5Vz7yXq+JOesPdj0u9Mbf0PjOOuFmlaw+XSpLcbEOZYQ
	PIbBo/N6vdiL362ESBc/sseVLswwVi3q83ZaI2c+mrSzD6RPUMzgTzy5KP2/+K1KqMR7H7zS3U6
	3njGJnGKZTea/y2sYUMlEfvMtE8zcPGgomyTC44kgus4DIug==
X-Google-Smtp-Source: AGHT+IF4U576EpcuWMn8dengv2WlARr6njaCWT9h6oVZ6fzg/nO5M7RbgoKh1r0euu415UbWbr61ag==
X-Received: by 2002:a05:6e02:339d:b0:423:fcd6:5488 with SMTP id e9e14a558f8ab-4330d1435a8mr16944295ab.12.1761853681791;
        Thu, 30 Oct 2025 12:48:01 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-5aea995e701sm6883943173.49.2025.10.30.12.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 12:48:01 -0700 (PDT)
Message-ID: <6cfe0af8-77f9-4f3d-9494-17f4defe6558@ieee.org>
Date: Thu, 30 Oct 2025 14:47:56 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/4] net: ipa: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Roger Quadros <rogerq@kernel.org>, Alex Elder <elder@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Stephan Gerhold <stephan@gerhold.net>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Liu Haijun <haijun.liu@mediatek.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>, Ingo Molnar
 <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Michael Nemanov <michael.nemanov@ti.com>, Kalle Valo <kvalo@kernel.org>,
 Andreas Kemnade <andreas@kemnade.info>,
 Roopni Devanathan <quic_rdevanat@quicinc.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20251027115022.390997-1-sakari.ailus@linux.intel.com>
 <20251027115022.390997-2-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20251027115022.390997-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/25 6:50 AM, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/ipa_interrupt.c | 1 -
>   drivers/net/ipa/ipa_main.c      | 1 -
>   drivers/net/ipa/ipa_modem.c     | 4 ----
>   drivers/net/ipa/ipa_smp2p.c     | 2 --
>   drivers/net/ipa/ipa_uc.c        | 2 --
>   5 files changed, 10 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
> index 245a06997055..8336596b1247 100644
> --- a/drivers/net/ipa/ipa_interrupt.c
> +++ b/drivers/net/ipa/ipa_interrupt.c
> @@ -149,7 +149,6 @@ static irqreturn_t ipa_isr_thread(int irq, void *dev_id)
>   		iowrite32(pending, ipa->reg_virt + reg_offset(reg));
>   	}
>   out_power_put:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return IRQ_HANDLED;
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 25500c5a6928..95a61bae3124 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -903,7 +903,6 @@ static int ipa_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_deconfig;
>   done:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return 0;
> diff --git a/drivers/net/ipa/ipa_modem.c b/drivers/net/ipa/ipa_modem.c
> index 8fe0d0e1a00f..9b136f6b8b4a 100644
> --- a/drivers/net/ipa/ipa_modem.c
> +++ b/drivers/net/ipa/ipa_modem.c
> @@ -71,7 +71,6 @@ static int ipa_open(struct net_device *netdev)
>   
>   	netif_start_queue(netdev);
>   
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return 0;
> @@ -102,7 +101,6 @@ static int ipa_stop(struct net_device *netdev)
>   	ipa_endpoint_disable_one(priv->rx);
>   	ipa_endpoint_disable_one(priv->tx);
>   out_power_put:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return 0;
> @@ -175,7 +173,6 @@ ipa_start_xmit(struct sk_buff *skb, struct net_device *netdev)
>   
>   	ret = ipa_endpoint_skb_tx(endpoint, skb);
>   
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	if (ret) {
> @@ -432,7 +429,6 @@ static void ipa_modem_crashed(struct ipa *ipa)
>   		dev_err(dev, "error %d zeroing modem memory regions\n", ret);
>   
>   out_power_put:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   }
>   
> diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
> index fcaadd111a8a..420098796eec 100644
> --- a/drivers/net/ipa/ipa_smp2p.c
> +++ b/drivers/net/ipa/ipa_smp2p.c
> @@ -171,7 +171,6 @@ static irqreturn_t ipa_smp2p_modem_setup_ready_isr(int irq, void *dev_id)
>   	WARN(ret != 0, "error %d from ipa_setup()\n", ret);
>   
>   out_power_put:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return IRQ_HANDLED;
> @@ -213,7 +212,6 @@ static void ipa_smp2p_power_release(struct ipa *ipa)
>   	if (!ipa->smp2p->power_on)
>   		return;
>   
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   	ipa->smp2p->power_on = false;
>   }
> diff --git a/drivers/net/ipa/ipa_uc.c b/drivers/net/ipa/ipa_uc.c
> index 2963db83ab6b..dc7e92f2a4fb 100644
> --- a/drivers/net/ipa/ipa_uc.c
> +++ b/drivers/net/ipa/ipa_uc.c
> @@ -158,7 +158,6 @@ static void ipa_uc_response_hdlr(struct ipa *ipa)
>   		if (ipa->uc_powered) {
>   			ipa->uc_loaded = true;
>   			ipa_power_retention(ipa, true);
> -			pm_runtime_mark_last_busy(dev);
>   			(void)pm_runtime_put_autosuspend(dev);
>   			ipa->uc_powered = false;
>   		} else {
> @@ -203,7 +202,6 @@ void ipa_uc_deconfig(struct ipa *ipa)
>   	if (!ipa->uc_powered)
>   		return;
>   
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   }
>   


