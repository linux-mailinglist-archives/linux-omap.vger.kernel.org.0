Return-Path: <linux-omap+bounces-212-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C571821974
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jan 2024 11:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B8F41C210AE
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jan 2024 10:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A6AD282;
	Tue,  2 Jan 2024 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7RiniZH"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC75CD268;
	Tue,  2 Jan 2024 10:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a2331e7058aso1075351866b.2;
        Tue, 02 Jan 2024 02:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704190263; x=1704795063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTIxxdjF/k/SNWH9LYiJo85IvSjRk+6uvfW/gGLUveo=;
        b=i7RiniZHJxAjQMwD5CYhxgR++m5kr6nZ2uxcwEDNhG410phaUmAVqwBfvtyAWLZOpn
         1vYPQG/w2QzhIMP/aXSmaZpEY12IKyLBEzBFR8lgppK0sQt8ezDLb15YX2DqIXGUsvON
         LDAC+25jShvxwhAak5wUR3K1rH4ErRYYXUQ++C/ve3I9ZgO1gBpD+iUFuT36BUL78btJ
         8ugWnj1iWdivyZ+3dSVpJdznphJ8KxTahX5eR1OOwV5bkZ1Xi6pNI6LYGxILW/qwqCLq
         v0qLbOM/zNuLRSwxfwIKgpJOQpOCZs5XLaTB/qcutI0NiYGQzngyCvtSRo5LpGBRPD/d
         nfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704190263; x=1704795063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTIxxdjF/k/SNWH9LYiJo85IvSjRk+6uvfW/gGLUveo=;
        b=al5vCNMYGfyunAkaH0VYQ98FlFgy4UEgDdtxsioiXpsuHuqtF4JHvBzOPA4HY42D7R
         viWuAyo7fIfeQ/q0NClDja6AUCpRMGAMY/oexHqj9s87pw/PQPcV1+woetQY6pB/dIwp
         RL6LKAwgMAXC+tI3tR4I6iOzcRkR2Hhm04GGExKyDF1TmhVyCKMP2qf4JSefbBxSvPIv
         T8AcuciUFyRL27VLS9oJmYJYouJVoypHmuk9I6l697cBUfJA22xPftT9C9yUbh/w7IUK
         UGVm1B7VvBKHZoQUpZligAAzoEh6Y6czCzR0kbAUo7L7PEuIdr0F0oIVNKRkB/aScfoH
         wuuw==
X-Gm-Message-State: AOJu0YxVqPkKFlk+KOg0tOkx03hsHqmpeNFukA2EN9QrGnyeDCLWVC+9
	7h+eYYg0EPmNC/7Mn6uNiGiNEmx/ZdAA/x5av6HhVQ2l
X-Google-Smtp-Source: AGHT+IEoCHDaUWl96RTbBBhd4TTEuHCZctud7RVVVW0vrrjk2kuSyGPeqsx/kVY7xG2tmugc0IArHckGENn8Kf3TBys=
X-Received: by 2002:a17:906:c10e:b0:a27:f094:5f4a with SMTP id
 do14-20020a170906c10e00b00a27f0945f4amr933849ejc.71.1704190262837; Tue, 02
 Jan 2024 02:11:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220135950.433588-1-pbrobinson@gmail.com> <0fe97709-6b6c-4c66-82a1-ecf58dde5b3f@intel.com>
In-Reply-To: <0fe97709-6b6c-4c66-82a1-ecf58dde5b3f@intel.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 2 Jan 2024 10:10:51 +0000
Message-ID: <CALeDE9Ndke9YTCeiJJWBtHAbrShEEr1bv67Cwu1LWJAXs6Ad2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: sdhci_am654: Fix TI SoC dependencies
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Faiz Abbas <faiz_abbas@ti.com>, 
	Kishon Vijay Abraham I <kishon@ti.com>, Tony Lindgren <tony@atomide.com>, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 2, 2024 at 10:06=E2=80=AFAM Adrian Hunter <adrian.hunter@intel.=
com> wrote:
>
> On 20/12/23 15:59, Peter Robinson wrote:
> > The sdhci_am654 is specific to recent TI SoCs, update the
> > dependencies for those SoCs and compile testing. While we're
> > at it update the text to reflect the wider range of
> > supported TI SoCS the driver now supports.
> >
> > Fixes: 41fd4caeb00b ("mmc: sdhci_am654: Add Initial Support for AM654 S=
DHCI driver")
>
> Is this really a fix?  Seems like a minor improvement.
> Same question for patch 2/2.

It is for distro kernels at least :)

> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>
> It would be good to get an Ack from a TI person.
> Same for patch 2/2.
>
> > ---
> >  drivers/mmc/host/Kconfig | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> > index 58bd5fe4cd25..24ce5576b61a 100644
> > --- a/drivers/mmc/host/Kconfig
> > +++ b/drivers/mmc/host/Kconfig
> > @@ -1041,14 +1041,15 @@ config MMC_SDHCI_OMAP
> >
> >  config MMC_SDHCI_AM654
> >       tristate "Support for the SDHCI Controller in TI's AM654 SOCs"
> > +     depends on ARCH_K3 || COMPILE_TEST
> >       depends on MMC_SDHCI_PLTFM && OF
> >       select MMC_SDHCI_IO_ACCESSORS
> >       select MMC_CQHCI
> >       select REGMAP_MMIO
> >       help
> >         This selects the Secure Digital Host Controller Interface (SDHC=
I)
> > -       support present in TI's AM654 SOCs. The controller supports
> > -       SD/MMC/SDIO devices.
> > +       support present in TI's AM65x/AM64x/AM62x/J721E SOCs. The contr=
oller
> > +       supports SD/MMC/SDIO devices.
> >
> >         If you have a controller with this interface, say Y or M here.
> >
>

