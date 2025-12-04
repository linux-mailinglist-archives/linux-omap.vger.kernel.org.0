Return-Path: <linux-omap+bounces-5122-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89996CA4A82
	for <lists+linux-omap@lfdr.de>; Thu, 04 Dec 2025 18:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 682473130290
	for <lists+linux-omap@lfdr.de>; Thu,  4 Dec 2025 16:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CBB340290;
	Thu,  4 Dec 2025 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m64GBbpb"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C2833E37D
	for <linux-omap@vger.kernel.org>; Thu,  4 Dec 2025 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764866346; cv=none; b=AqnMyctPUimuS5Ev+TRrw6BOk3QAFxOm+9Mrceoz7ytsFY7AL6KWi/SjmRJfhsLU2P2wsnydxG+7HDEnznlEMDWtoucCs0ZACyN3Fw7XEtw2KPli7pdEgtuSD2btgvFmxAl7+VnaPSK7llar3lbzKLOnPWWsQcPr9OUsPlL505Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764866346; c=relaxed/simple;
	bh=SvNHv0bTFKcXTillna3oIEsjHJ4k7Bj8G+9Wpk4xE2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hAWKZ1wOtx6Axq+KQK57RWEObTEfBLIeRCtkkDVj04DOdDiDc+g4kyYVQ0wSvMFK0gboMTEl0GH3txOc0K8iuJvR2t0xNkIBkGN3WxDHMniAzOiowAFmUsFnkFlw1MayNGfL3JJhoS2eRnsYD80JPiu+PxBJT8/JzS36REoy73k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m64GBbpb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso15485075e9.0
        for <linux-omap@vger.kernel.org>; Thu, 04 Dec 2025 08:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764866342; x=1765471142; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+3Ml0jWCuH/33LJ6xOAJUPn9vl8+nWQjtPcrbdX2QrE=;
        b=m64GBbpbTRXk52FSBXkmPfAGhOTmKKMuu6mNFVbkF/MaRWchkX8OssZEefd1ehtaul
         ccUA9fPPFAEmCkutKwMhNcP3ziuVb1lHMamsl47TYk7MoCSWCa3ox0ZI+s/7DA9Dwf5o
         0XPFTR44WxiZCNKeDGmSGU2UW7PfB8Ek6DXmReNBC6vOhoOdv/gxp0DEAO41UcYOkXkV
         Z8O5wAMyUWKqIukLfCea6jPu5lCJlKaXOuuSZFgPFQjLkZGgkUMrojkvicQR1bGabdvp
         L0p9G2cBK2eMpyfhRiiT/DwxsrCDHHHk79j88aSpII0vZsIQ2ZhCCB0eqNwZBzqbyDxO
         /sTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764866342; x=1765471142;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3Ml0jWCuH/33LJ6xOAJUPn9vl8+nWQjtPcrbdX2QrE=;
        b=LVLSjA4lMQM8YBn9AHanQcyOuFYWrGa2iSCXZ8a9b05mpf3iXNK5NN4u1qIfbeNYs3
         1px7a3gUTLNoOWa6FU1RulMJrKVwJNudkh+SPntYTavxSRCAir2PJoe0egv0p2qfrL5N
         JFxob7rAnfFMp4hKv8gETd/h+H+mFlpVp8FPCHPxL/qNnQwjAqbjmvg+Geh7MqbOSgfN
         FZJGyovd8hU3V0snZPUnEPyk/7KBlaKX2IzvDnfJ4xuBDkjmfzWX9HiwqKkP8rJCjxZC
         MLlmNDzJORpAjsk53o9iM6acVKDsLCSk1TZNLfNeQWbiZQyyBHBghX9O/TZkZlsVR9ga
         RiFw==
X-Forwarded-Encrypted: i=1; AJvYcCUBSBevwruDtuOYH0/hTPRdSnWG0g/3Ty5eprr1YSTyadA5sH3wjkYn3Oefwc7Cq6mCJOBBpFTYZ2UT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3zrFfSnZCFNzxIZEbpNhf/eGY+3drORd9KCfX9Fv4KBS7xLDo
	f6sb5FKLspQNXhUpEJLotixzCI9wkiOX/CKnL1uH8xOmEdpDvFXtfgry
X-Gm-Gg: ASbGncsiia0H2HROHN/anvKv2+MR/OV6TUeMRW7cFAfk6VzqWdGI5Z1qYVZqhEpf5qa
	rFYL6jzp3A5hYIXverp+hUrf0cgHZALy/Kq0nX0Ba9Yz2XPDoyNtOSMBXsqNr8BV6NtayayhCup
	pxPQhDtB3gh7TNAy9d5xc6qrs2xnCtFJz4iYGp+DyZFDg0IYiXVznI6K0kCsRHjV2GM9mzctJHL
	1vMO4ebf9Dp3tRF22ZLrupKm9bgLYW8J7PpAfLqKjxnnSwy+0T4ZGV07w55HbG6DScjKeuqx/1w
	bX7kGbA1al2BelaVY83m3ymwRvLtyfKuXIC3NqkZxKj9lmMZ0PT2AcHKTWn3nOL9FDCB1idoBe4
	5SWcqilYQp5nyOlsbvfrepS3TkJiHpw75twVNa6MmuDZkdoMEmUhjOOumiscs9DTh0hYlC86NpS
	i69bDMCa2VmW5EKQfrJ/un5Aqy07D16jsvw2HNGNAhKtYlPiuvM04VLe+VPc3vy/pMUwkQ8c8KX
	j2EWQ==
X-Google-Smtp-Source: AGHT+IFsyy5YStgxmY5AXM0tdH84tJ569HxdiHRQT0I3Oz0EaQQxZDq00b76OtLTDgynIknFJ4swPA==
X-Received: by 2002:a05:600c:4710:b0:46e:1fb7:a1b3 with SMTP id 5b1f17b1804b1-4792af3d16fmr63824975e9.23.1764866341710;
        Thu, 04 Dec 2025 08:39:01 -0800 (PST)
Received: from dell.localnet (2a01-114f-4013-18c0-0000-0000-0000-0540.ea.ipv6.supernova.orange.pl. [2a01:114f:4013:18c0::540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4793092c039sm39198205e9.5.2025.12.04.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:39:01 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 david@ixit.cz
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, linux-sound@vger.kernel.org,
 David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] ALSA: Do not build obsolete API
Date: Thu, 04 Dec 2025 17:38:59 +0100
Message-ID: <1939135.tdWV9SEqCh@dell>
In-Reply-To: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
References: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2244374.irdbgypaU6";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2244374.irdbgypaU6
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ALSA: Do not build obsolete API
Date: Thu, 04 Dec 2025 17:38:59 +0100
Message-ID: <1939135.tdWV9SEqCh@dell>
In-Reply-To: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
References: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
MIME-Version: 1.0

On Wednesday, 3 December 2025 23:34:10 CET David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> ALSA 0.9.0-rc3 is from 2002, 23 years old.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Maybe I could drop also the code and Kconfig option?
> 
> David
> ---
>  arch/arm/configs/am200epdkit_defconfig    | 1 -
>  arch/arm/configs/lpc32xx_defconfig        | 1 -
>  arch/arm/configs/omap1_defconfig          | 1 -

For omap1:

Reviewed-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>


>  arch/arm/configs/tegra_defconfig          | 1 -
>  arch/mips/configs/gcw0_defconfig          | 1 -
>  arch/mips/configs/loongson1_defconfig     | 1 -
>  arch/mips/configs/qi_lb60_defconfig       | 1 -
>  arch/mips/configs/rbtx49xx_defconfig      | 1 -
>  arch/mips/configs/rs90_defconfig          | 1 -
>  arch/powerpc/configs/85xx-hw.config       | 1 -
>  arch/powerpc/configs/86xx-hw.config       | 1 -
>  arch/powerpc/configs/mpc5200_defconfig    | 1 -
>  arch/powerpc/configs/ppc6xx_defconfig     | 1 -
>  arch/sh/configs/edosk7760_defconfig       | 1 -
>  arch/sh/configs/se7724_defconfig          | 1 -
>  arch/sh/configs/sh7785lcr_32bit_defconfig | 1 -
>  sound/core/Kconfig                        | 2 +-
>  17 files changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
> index 134a559aba3dd..2367b1685c1cf 100644
> --- a/arch/arm/configs/am200epdkit_defconfig
> +++ b/arch/arm/configs/am200epdkit_defconfig
> @@ -68,7 +68,6 @@ CONFIG_SOUND=m
>  CONFIG_SND=m
>  CONFIG_SND_MIXER_OSS=m
>  CONFIG_SND_PCM_OSS=m
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_PXA2XX_AC97=m
>  CONFIG_USB_GADGET=y
> diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
> index 2bddb0924a8c0..b9e2e603cd95e 100644
> --- a/arch/arm/configs/lpc32xx_defconfig
> +++ b/arch/arm/configs/lpc32xx_defconfig
> @@ -113,7 +113,6 @@ CONFIG_LOGO=y
>  # CONFIG_LOGO_LINUX_VGA16 is not set
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_DEBUG=y
>  CONFIG_SND_DEBUG_VERBOSE=y
> diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
> index dee820474f444..df88763fc7c3d 100644
> --- a/arch/arm/configs/omap1_defconfig
> +++ b/arch/arm/configs/omap1_defconfig
> @@ -148,7 +148,6 @@ CONFIG_SOUND=y
>  CONFIG_SND=y
>  CONFIG_SND_MIXER_OSS=y
>  CONFIG_SND_PCM_OSS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_DUMMY=y
>  CONFIG_SND_USB_AUDIO=y
> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
> index ce70ff07c978a..68aedaf92667a 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -219,7 +219,6 @@ CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
>  CONFIG_LOGO=y
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_DRIVERS is not set
>  CONFIG_SND_HDA_TEGRA=y
>  CONFIG_SND_HDA_INPUT_BEEP=y
> diff --git a/arch/mips/configs/gcw0_defconfig b/arch/mips/configs/gcw0_defconfig
> index fda9971bdd8d9..adb9fd62ddb0d 100644
> --- a/arch/mips/configs/gcw0_defconfig
> +++ b/arch/mips/configs/gcw0_defconfig
> @@ -79,7 +79,6 @@ CONFIG_LOGO=y
>  # CONFIG_LOGO_LINUX_VGA16 is not set
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_PROC_FS is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_SPI is not set
> diff --git a/arch/mips/configs/loongson1_defconfig b/arch/mips/configs/loongson1_defconfig
> index 02d29110f7024..1d9781ff96986 100644
> --- a/arch/mips/configs/loongson1_defconfig
> +++ b/arch/mips/configs/loongson1_defconfig
> @@ -119,7 +119,6 @@ CONFIG_WATCHDOG_SYSFS=y
>  CONFIG_LOONGSON1_WDT=y
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_MIPS is not set
>  # CONFIG_SND_USB is not set
> diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
> index 5f5b0254d75e7..a1bb0792f6eb1 100644
> --- a/arch/mips/configs/qi_lb60_defconfig
> +++ b/arch/mips/configs/qi_lb60_defconfig
> @@ -81,7 +81,6 @@ CONFIG_LOGO=y
>  # CONFIG_LOGO_LINUX_CLUT224 is not set
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_SPI is not set
> diff --git a/arch/mips/configs/rbtx49xx_defconfig b/arch/mips/configs/rbtx49xx_defconfig
> index 03a7bbe28a532..49c709d663beb 100644
> --- a/arch/mips/configs/rbtx49xx_defconfig
> +++ b/arch/mips/configs/rbtx49xx_defconfig
> @@ -53,7 +53,6 @@ CONFIG_TXX9_WDT=m
>  # CONFIG_VGA_ARB is not set
>  CONFIG_SOUND=m
>  CONFIG_SND=m
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_PCI is not set
> diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
> index a53dd66e9b864..8382d535e6dc1 100644
> --- a/arch/mips/configs/rs90_defconfig
> +++ b/arch/mips/configs/rs90_defconfig
> @@ -105,7 +105,6 @@ CONFIG_LOGO=y
>  CONFIG_SOUND=y
>  CONFIG_SND=y
>  # CONFIG_SND_PCM_TIMER is not set
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_PROC_FS is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_MIPS is not set
> diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
> index 8aff832173977..2b19c20a9a2c4 100644
> --- a/arch/powerpc/configs/85xx-hw.config
> +++ b/arch/powerpc/configs/85xx-hw.config
> @@ -117,7 +117,6 @@ CONFIG_SND_INTEL8X0=y
>  CONFIG_SND_POWERPC_SOC=y
>  # CONFIG_SND_PPC is not set
>  CONFIG_SND_SOC=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_USB is not set
>  CONFIG_SND=y
>  CONFIG_SOUND=y
> diff --git a/arch/powerpc/configs/86xx-hw.config b/arch/powerpc/configs/86xx-hw.config
> index e7bd265fae5a4..07f30ab881e59 100644
> --- a/arch/powerpc/configs/86xx-hw.config
> +++ b/arch/powerpc/configs/86xx-hw.config
> @@ -80,7 +80,6 @@ CONFIG_SERIO_LIBPS2=y
>  CONFIG_SND_INTEL8X0=y
>  CONFIG_SND_MIXER_OSS=y
>  CONFIG_SND_PCM_OSS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  CONFIG_SND=y
>  CONFIG_SOUND=y
>  CONFIG_ULI526X=y
> diff --git a/arch/powerpc/configs/mpc5200_defconfig b/arch/powerpc/configs/mpc5200_defconfig
> index c0fe5e76604a0..617650cea56a9 100644
> --- a/arch/powerpc/configs/mpc5200_defconfig
> +++ b/arch/powerpc/configs/mpc5200_defconfig
> @@ -75,7 +75,6 @@ CONFIG_FB_SM501=m
>  CONFIG_LOGO=y
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_PCI is not set
>  # CONFIG_SND_PPC is not set
> diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
> index b082c1fae13c9..787d707f64a42 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -726,7 +726,6 @@ CONFIG_SND_OSSEMUL=y
>  CONFIG_SND_MIXER_OSS=m
>  CONFIG_SND_PCM_OSS=m
>  CONFIG_SND_DYNAMIC_MINORS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  CONFIG_SND_VERBOSE_PRINTK=y
>  CONFIG_SND_DEBUG=y
>  CONFIG_SND_DEBUG_VERBOSE=y
> diff --git a/arch/sh/configs/edosk7760_defconfig b/arch/sh/configs/edosk7760_defconfig
> index abeae220606a3..905fac1072845 100644
> --- a/arch/sh/configs/edosk7760_defconfig
> +++ b/arch/sh/configs/edosk7760_defconfig
> @@ -79,7 +79,6 @@ CONFIG_FB_TILEBLITTING=y
>  CONFIG_FB_SH_MOBILE_LCDC=m
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_VERBOSE_PRINTK=y
>  CONFIG_SND_SOC=y
> diff --git a/arch/sh/configs/se7724_defconfig b/arch/sh/configs/se7724_defconfig
> index 9e3a54936f76f..8ca46d704c8ba 100644
> --- a/arch/sh/configs/se7724_defconfig
> +++ b/arch/sh/configs/se7724_defconfig
> @@ -83,7 +83,6 @@ CONFIG_LOGO=y
>  # CONFIG_LOGO_SUPERH_VGA16 is not set
>  CONFIG_SOUND=y
>  CONFIG_SND=m
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_SPI is not set
>  # CONFIG_SND_SUPERH is not set
> diff --git a/arch/sh/configs/sh7785lcr_32bit_defconfig b/arch/sh/configs/sh7785lcr_32bit_defconfig
> index eb63aa61b0465..5468cc53cddb4 100644
> --- a/arch/sh/configs/sh7785lcr_32bit_defconfig
> +++ b/arch/sh/configs/sh7785lcr_32bit_defconfig
> @@ -93,7 +93,6 @@ CONFIG_SND_PCM_OSS=y
>  CONFIG_SND_SEQUENCER_OSS=y
>  CONFIG_SND_HRTIMER=y
>  CONFIG_SND_DYNAMIC_MINORS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_VERBOSE_PRINTK=y
>  CONFIG_SND_DEBUG=y
> diff --git a/sound/core/Kconfig b/sound/core/Kconfig
> index 48db44fa56feb..4e7bc370ffd7f 100644
> --- a/sound/core/Kconfig
> +++ b/sound/core/Kconfig
> @@ -155,7 +155,7 @@ config SND_MAX_CARDS
>  
>  config SND_SUPPORT_OLD_API
>  	bool "Support old ALSA API"
> -	default y
> +	default n
>  	help
>  	  Say Y here to support the obsolete ALSA PCM API (ver.0.9.0 rc3
>  	  or older).
> 
> ---
> base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
> change-id: 20251203-old-alsa-fa2c2cb038e1
> 
> Best regards,
> 


--nextPart2244374.irdbgypaU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmkxuSMACgkQ2WqSnlts
jBoEqQf/Sjc0qt+Drex1cQ2k/z80kq9/GzHrmnzgVxa+5a/fQpOUSV9mjQ8dXZT1
MWYxTSIbMYegarGZ7hbByLrhKbbV04MghXJ5m+sAhdDrN6QAJp5BaVu5Ols6Z5xH
MOUch2VVP88w08L9IBrwqJNFyBNxM5O4hpgEWCoO0CccbgAmtg+M3yJfxLqpz//Y
pBXwt0bdY/fKicChMpUmrsSFda0rnItv56Mp17YoibFbVxRCKSnfOLDiE4qaIAae
L09ouH5JZ3U9AxOel2JETxGJiWxv5iDWTrsKFdKt6LCYQ/zOsCerakNM8PSxlsUo
hOPg0Wrf2HhofRo0M2unRvM7bCbPpA==
=HYXo
-----END PGP SIGNATURE-----

--nextPart2244374.irdbgypaU6--




