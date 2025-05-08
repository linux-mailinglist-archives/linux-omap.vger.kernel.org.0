Return-Path: <linux-omap+bounces-3676-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F64AAFB06
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 15:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C73B9E4F7D
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 13:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830BE22B8A5;
	Thu,  8 May 2025 13:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ULhribNO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A885322A4C2
	for <linux-omap@vger.kernel.org>; Thu,  8 May 2025 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710052; cv=none; b=F3UVR7uNrghPDyLWwSWMoBD8oQLPhq/k6jq328AAZK9o75RBljWlgz4VPgU3CT/+Gcc1+uWv6eZucfDfWCiRnL7RMO3kQ0WMLBXQCpN5nu7X03lMg/SI7wdRJNbyXsimMrOzIO3bm4Yg7Ki3rz90R0OAE0kNoVPiuryVukxeqvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710052; c=relaxed/simple;
	bh=9mXvjbwW8ofidBphHEKQjhYR9ffb1wijcx8qRAM1zG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Km+yfECpx/h/BG9SkQVJd6EZFxBbcmmeWzcTyhliaqhtz6JKSOnyKj/X8bMYIUblDlJ9JhZKm+MIt+8mAYMtRRhqibdA/Qsm6pWdhblQ9CFy9M4GdKBKW61mLr1YfQ+7QMM/J1eI+l6jT6p5er2vgfV5wev4xc53eZMH6HiRXFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ULhribNO; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73c17c770a7so1142020b3a.2
        for <linux-omap@vger.kernel.org>; Thu, 08 May 2025 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746710049; x=1747314849; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=W0ynFZEEXAjIagoyl65aQJ9Sy+zKGYCNgLUwmb5k0MA=;
        b=ULhribNOHgS+4z/WEc7xhhmKIDRR6VIBr1EEOjDNxPbEkAeMWSEp9M+NnfUays2k/+
         POuE4Py6xtJPh2MeEVaIzgqCgUL3+ZQv23FFZrG+7XvPPQ36jG7+9JheUTrL3kvqXzTm
         rTGIv+JVBPIxmBmey0cpOnKPL3H7y+Q/Owz9H4w4rbt8JmSgpcMiyw6zXt8JCGWRDmSz
         AQ7Jed6CBHSaFiTTsgajOo/wPxOUlc8u6FBCYXqg36dkKpQfS+V8A4MOcK7PDo8qil0P
         Qm5Ut2UXoJ0FNYxjsU3zmnAVwouDDG6fUP4fws/zvnWLax1JDoSnYavqSdryaaeBFSSw
         2uWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710049; x=1747314849;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W0ynFZEEXAjIagoyl65aQJ9Sy+zKGYCNgLUwmb5k0MA=;
        b=kRMDKbYDxadtiqUWNRxmC6yB3mbf6+Ujpi2BPSOVSwGgR8Hel9j/Ca7o+yyFt18SAu
         +UGsi5Ugyk9OosvW0LzX3DArapXAVwPA2ZLgslyPHbr/nSyvmPQ9lsSNVlJEkp+G9uc/
         F6fVaNwh7jyLPHwo6JnYAsb2e9+VToRZSupIXWJK0T9bNxwbSOESWJPFl1uLBfNHWjfB
         qBC4EkpkomjYLTrKNN0AXlXYv3FgDubA0r9qsTEihV1sSvXFHBoZGA26WBEnivxrmyDX
         vLz7vi9j3/+SapQCBCwmjJtDZgo4nzc9r/BgmOYteOkMaMorRfZk/ZWzeFyV2vOUYDqu
         clCg==
X-Forwarded-Encrypted: i=1; AJvYcCXIKEMfLfepd7WRDQpjFswle7IqmZIVqC0xfr9gocVfq2rkA4gjQes0XsyZCoHEYqYDJpWvWdmuVFcb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlbu2xkkzPwiNnS+x7l4hdjW59P6nD1NPwTW1UnwMCok6tchXt
	+T2bDzBHaxUUjfx/TDIRNtDrinr17p33rt7QwvCB+doxIO3oBLSIvDigicibgtQ=
X-Gm-Gg: ASbGncuv1j2SMKJDtAigFK5hleySgaafLbrOoF3g/3wGZfUvosGR14nfIIXSfn0grEB
	7ihaWd+/p04OzvSAaRFcxwBPWK2Pc/ggnVY3U3NjrMUHTJYgq3VGkVrWIedQCgeenKfCQZyfYky
	EjeDvLi6vSc8hXDzPXxS8v35XXl5KJ9GWyuBOQSXnVxxveC1c4nfEtADKWVtvFSyqufrBv/3wij
	iGznlSyJDpdAtceGVh8UXUuEE7xrQinXNrhxSZuOl7pd79GHwW8Ss5SdKecH2o1m2fXsSre+7lj
	633rUcJ7BjyUuKhpiK42g4Nt6JSNkx2XbcFBdlo=
X-Google-Smtp-Source: AGHT+IFA5bdAR+g+8jas/pp/moZKFd/5kEN1qQAf++05eckooX+tTxGDVWyNcpdJrbek7kiTWc5H5g==
X-Received: by 2002:a05:6a00:2887:b0:736:73ad:365b with SMTP id d2e1a72fcca58-740a99b3b98mr5056194b3a.14.1746710048945;
        Thu, 08 May 2025 06:14:08 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405905d067sm13158112b3a.126.2025.05.08.06.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:14:08 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Sukrut Bellary <sbellary@baylibre.com>, Russell King
 <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Bajjuri Praneeth <praneeth@ti.com>,
 Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu <b-liu@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/4] pmdomain: ti: Fix STANDBY handling of PER power domain
In-Reply-To: <20250318230042.3138542-3-sbellary@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
 <20250318230042.3138542-3-sbellary@baylibre.com>
Date: Thu, 08 May 2025 06:14:07 -0700
Message-ID: <7hjz6rtfc0.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sukrut Bellary <sbellary@baylibre.com> writes:

> Per AM335x TRM[1](section 8.1.4.3 Power mode), in case of STANDBY,
> PER domain should be ON. So, fix the PER power domain handling on standby.
>
> [1] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
>
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Ulf, this series has been tested now.  Go ahead and take this patch.

Thanks,

Kevin


> ---
>  drivers/pmdomain/ti/omap_prm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/ti/omap_prm.c b/drivers/pmdomain/ti/omap_prm.c
> index b8ceb3c2b81c..7e36e675a8c6 100644
> --- a/drivers/pmdomain/ti/omap_prm.c
> +++ b/drivers/pmdomain/ti/omap_prm.c
> @@ -18,7 +18,9 @@
>  #include <linux/pm_domain.h>
>  #include <linux/reset-controller.h>
>  #include <linux/delay.h>
> -
> +#if IS_ENABLED(CONFIG_SUSPEND)
> +#include <linux/suspend.h>
> +#endif
>  #include <linux/platform_data/ti-prm.h>
>  
>  enum omap_prm_domain_mode {
> @@ -88,6 +90,7 @@ struct omap_reset_data {
>  #define OMAP_PRM_HAS_RSTST	BIT(1)
>  #define OMAP_PRM_HAS_NO_CLKDM	BIT(2)
>  #define OMAP_PRM_RET_WHEN_IDLE	BIT(3)
> +#define OMAP_PRM_ON_WHEN_STANDBY	BIT(4)
>  
>  #define OMAP_PRM_HAS_RESETS	(OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_RSTST)
>  
> @@ -404,7 +407,8 @@ static const struct omap_prm_data am3_prm_data[] = {
>  		.name = "per", .base = 0x44e00c00,
>  		.pwrstctrl = 0xc, .pwrstst = 0x8, .dmap = &omap_prm_noinact,
>  		.rstctrl = 0x0, .rstmap = am3_per_rst_map,
> -		.flags = OMAP_PRM_HAS_RSTCTRL, .clkdm_name = "pruss_ocp"
> +		.flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_ON_WHEN_STANDBY,
> +		.clkdm_name = "pruss_ocp",
>  	},
>  	{
>  		.name = "wkup", .base = 0x44e00d00,
> -- 
> 2.34.1

