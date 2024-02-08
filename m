Return-Path: <linux-omap+bounces-537-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A6384E145
	for <lists+linux-omap@lfdr.de>; Thu,  8 Feb 2024 13:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1C9528E244
	for <lists+linux-omap@lfdr.de>; Thu,  8 Feb 2024 12:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF64F763E1;
	Thu,  8 Feb 2024 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGi8Z5jf"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2BE762EF;
	Thu,  8 Feb 2024 12:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707397073; cv=none; b=jWjVtKysKBDiDv1YsrDy3uYqoNgVT5OUjFDhPYxtMUU0QkUElszfkC9TpByH7HmVttVyxbnONJNf5DEFcjoOrL70bm3YveZf8LV8mKu6rN6IXJtO3wVQ115IdhiYKEW67ZGYbNQzdbm5Gkd1jIf3/bkLcTQcSvnzmYoMlGNGeEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707397073; c=relaxed/simple;
	bh=byyEeeUtJmB3wV/YMf5cOVkBPwAsORZKZfVWsvA5bgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQDJqOUDoPhJOwW2MzdtZ8bQ7w8N4gnR6jPlP/UixF/0kodYLfHRW4kdoV+++vMSArv1LTOfNVQdAFQnzGSu4V/6TOTMBKAkrWNAL1Gix8P1c58B1yVYchG1bV58HboA7kiNjT3AnV0OrpunoxN2/7VUM2gs1zvF77MrYCnOBkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGi8Z5jf; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso1899481276.0;
        Thu, 08 Feb 2024 04:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707397070; x=1708001870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxFhWXCuNClmcNgkXGLXJsFfNEmxEWjWNaWWutgfQyo=;
        b=hGi8Z5jfgEfDiKu4HBIEBawFnx4TyX2P/pmVbzLavEhlqJEPuLdTG7SBe7eXCAwC6C
         SwlJkrRvaRSSFIVRSK9LAiNIzrSuM2NhbmC2bbHIe321UAKkoqRR8gDVarSo05vemnID
         wss+eTwvnROUmGyUHSyHxFOkMj1qiEu26SD16QKlTQOnt50OD7T4/cYA6YknN3vS5tPj
         nG2IptM99QxsYLaRdcGJUIXi4eEizzJ9nKovaR9foQepaRiIAbXUd+C61BMjp+Akr1By
         POKDWhgewt3ttfkQz04GfLBGXbw8hewC5tqsnCxC0AHPekbIDiWz/8aUu9+wdfq8q5Fv
         rNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707397070; x=1708001870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxFhWXCuNClmcNgkXGLXJsFfNEmxEWjWNaWWutgfQyo=;
        b=kw4xJF0EHEDCuDENvo+cj9doL5c4p0kjC9y4fCWWUv4sB6aBuPO3uhgZKfQipw82sJ
         KhD4nf3SYrM8mEfFWCOdqCj7dYjPPCujWguYRrE7Hoby1/tRLxVlZUdIPAg3G3oSf1fv
         m2uCYxtpPMPkE8nZo+xWLJ2TA/oSqduQOndgNmdKbrwIdfpNSCJ2ZHtmhtacxbZjX+cU
         HQqx4gAdrmgN6HKtu+xKRXrHhmSAOxGejswqDIN9f4LpFHl+izoxrmwycjlxDtujIGP0
         7B9UnaTUDwWoxuy0IbgvOfWPxNtPQTSvwml/IiajOe32aLYGNgudCiJWjcIcp9HJA9tf
         Eidw==
X-Gm-Message-State: AOJu0YzfSesOtUWb+/Qf+X5pi0Ij+kVT97xpwIjSaKYe/Zivt1ZBNopA
	+XmQHQx5aN2xMqdw4/wde7XiP0cjG5YV93bHZHJBsyFP98QgNGoMjSGprDpc8Kq9/q9KAzfgX7Z
	9SOIDZ1aR3IAqCM8pU17QehPZpzzhS+uMi+A=
X-Google-Smtp-Source: AGHT+IGxNe/AO3axeXpQ7lxRVErN9GBA529JqdcgBJGMvmEJEaByMeq4bL5OPa6iUB7tccoDlYi2JPSUD/yyj7snBjc=
X-Received: by 2002:a25:83c6:0:b0:dc6:ba6d:7404 with SMTP id
 v6-20020a2583c6000000b00dc6ba6d7404mr7897786ybm.37.1707397070182; Thu, 08 Feb
 2024 04:57:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr>
 <20240127044851.GW5185@atomide.com> <d09925b3-83e6-4c52-878f-4c1db7670543@smile.fr>
 <20240129111733.GX5185@atomide.com> <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>
 <7d72f3ee-bcfe-4197-b492-857dc49b2788@smile.fr> <20240131103050.GZ5185@atomide.com>
 <519f7e2e-4df2-4b3c-90e2-2383b6b34562@smile.fr> <20240202043601.GA5185@atomide.com>
 <6eced20a-6454-4824-a149-ee331ebb7eec@smile.fr>
In-Reply-To: <6eced20a-6454-4824-a149-ee331ebb7eec@smile.fr>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 8 Feb 2024 06:57:38 -0600
Message-ID: <CAHCN7xLUH7Qj_djEuMDAx2nNVqtS5WyoM_DN4zarCbmKh=te4Q@mail.gmail.com>
Subject: Re: sdhci-omap: issues with PM features since 5.16
To: Romain Naour <romain.naour@smile.fr>
Cc: Tony Lindgren <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	Nishanth Menon <nm@ti.com>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 5:32=E2=80=AFAM Romain Naour <romain.naour@smile.fr>=
 wrote:
>
> Le 02/02/2024 =C3=A0 05:36, Tony Lindgren a =C3=A9crit :
> > * Romain Naour <romain.naour@smile.fr> [240201 09:04]:
> >> Le 31/01/2024 =C3=A0 11:30, Tony Lindgren a =C3=A9crit :
> >>> * Romain Naour <romain.naour@smile.fr> [240130 11:20]:
> >>>> Le 29/01/2024 =C3=A0 18:42, Romain Naour a =C3=A9crit :
> >>>>> Le 29/01/2024 =C3=A0 12:17, Tony Lindgren a =C3=A9crit :
> >>>>>> So I'm still guessing your issue is with emmc not getting reinitia=
lized
> >>>>>> properly as there's no mmc-pwrseq-emmc configured. Can you give it=
 a
> >>>>>> try? See am5729-beagleboneai.dts for an example.
> >>>>
> >>>> I can't add such mmc-pwrseq-emmc on the custom board, there is no gp=
io available
> >>>> to reset the emmc device.
> >>>>
> >>>> To resume:
> >>>> - the emmc doesn't work with mmc-hs200-1_8v mode with PM runtime ena=
bled
> >>>> - the emmc works with mmc-hs200-1_8v mode without PM runtime (patch =
series reverted)
> >>>> - the emmc works with mmc-ddr-1_8v mode with PM runtime enabled
> >>>>
> >>>> AFAIU the hs200 mode requires some pin iodelay tuning (SDHCI_OMAP_RE=
QUIRE_IODELAY)
> >>>> is sdhci_omap_runtime_{suspend,resume} needs to take care of that?
> >
> > On PM runtime resume, sdhci_omap_runtime_resume() gets called and calls
> > sdhci_runtime_resume_host(), and calls mmc->ops->set_ios().
> >
> > Then sdhci_omap_set_ios() calls sdhci_omap_set_timing() to set the iode=
lay.
> > Maybe add some printk to sdhci_omap_set_timing() to verify the right mo=
des
> > get set on PM runtime resume?
> >
> >>>> The mmc2 clock seems idle when mmc-hs200-1_8v and PM runtime are use=
d.
> >>>>
> >>>> omapconf dump prcm l3init
> >>>>
> >>>> (mmc2 clock idle)
> >>>> | CM_L3INIT_MMC2_CLKCTRL           | 0x4A009330   | 0x01070000 |
> >>>>
> >>>> (mmc2 clock running)
> >>>> | CM_L3INIT_MMC2_CLKCTRL           | 0x4A009330   | 0x01040002 |
> >>>>
> >>>> Thoughts?
> >
> > For the clocks above, that is as expected. The clocks get idled when th=
e
> > MMC controller is idle.
> >
> >>> OK so if the emmc reset gpio is not available, seems we should do som=
ething
> >>> like the following patch to not set MMC_CAP_POWER_OFF_CARD unless the
> >>> cap-power-off-card devicetree property is set.
> >>>
> >>> Care to give it a try and see if it helps?
> >>
> >> Same problem without MMC_CAP_POWER_OFF_CARD flag (even by removing
> >> MMC_CAP_AGGRESSIVE_PM too).
> >>
> >> I did some test with mmc capabilities mask but no progress so far.
> >
> > OK. So this issue seems to be related to the PM runtime resume not
> > restoring something properly as you suggested earlier.

I was testing the newer MMC driver on an AM3517 a few months ago, and
I noticed that SD cards were returning weird or empty data after some
indeterminate amount of time.  If I read the IOS file immediately
after boot, it worked.  If I forced some sort of file IO, it might
work, but after it went idle, it appeared to have strange data.  I
don't think this bug is limited to one platform.

adam

>
> Adding your PM reply with the mailing list in Cc:
>
> Le 06/02/2024 =C3=A0 09:25, Tony Lindgren a =C3=A9crit :
> > * Tony Lindgren <tony@atomide.com> [240202 10:30]:
> [...]
> >
> > When you get a chance, maybe give the following debug patch a try.
> > I'm mostly seeing value of 2 and sometimes 0, but that could be
> > for a different mmc controller instance as I just used pr_info.
> > So you may need to tweak the debug patch to use dev_dbg to leave
> > out other controllers.
> >
> > #define MMC_POWER_OFF           0
> > #define MMC_POWER_UP            1
> > #define MMC_POWER_ON            2
> > #define MMC_POWER_UNDEFINED     3
> >
> > So on MMC_POWER_OFF, in sdhci_runtime_resume_host() the flag
> > host->reinit_uhs =3D true does not get set, and maybe with hs200
> > that causes the failure?
>
> With the debug line added, I don't see any MMC_POWER_OFF for the emmc but=
 only
> MMC_POWER_ON lines:
>
> XXX sdhci_runtime_resume_host: mmc->ios.power_mode: 2
>
> >
> > If you're seeing MMC_POWER_OFF values, maybe also try changing
> > sdhci_omap_runtime_resume() to call sdhci_runtime_resume_host(host, 1)
> > and see if that helps as requesting a soft reset causes sdhci_init() to
> > set host->reinit_uhs =3D true.. That change feels like a workaround
> > though.
>
> I tried anyway with soft reset, the cache flush error is gone but now I h=
ave
> this dump in dmesg each time the emmc is reset:
>
> [ 3978.852783] mmc1: Reset 0x6 never completed.
> [ 3978.852783] mmc1: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D SDHCI RE=
GISTER DUMP =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [ 3978.852783] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00003302
> [ 3978.852813] mmc1: sdhci: Blk size:  0x00000000 | Blk cnt:  0x00000000
> [ 3978.852813] mmc1: sdhci: Argument:  0x00000000 | Trn mode: 0x00000000
> [ 3978.852813] mmc1: sdhci: Present:   0x01f00000 | Host ctl: 0x00000000
> [ 3978.852813] mmc1: sdhci: Power:     0x00000000 | Blk gap:  0x00000000
> [ 3978.852813] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x00000000
> [ 3978.852844] mmc1: sdhci: Timeout:   0x00000000 | Int stat: 0x00000000
> [ 3978.852844] mmc1: sdhci: Int enab:  0x00000000 | Sig enab: 0x00000000
> [ 3978.852844] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
> [ 3978.852844] mmc1: sdhci: Caps:      0x24e90080 | Caps_1:   0x00000f77
> [ 3978.852844] mmc1: sdhci: Cmd:       0x00000000 | Max curr: 0x00000000
> [ 3978.852874] mmc1: sdhci: Resp[0]:   0x00000000 | Resp[1]:  0x00000000
> [ 3978.852874] mmc1: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
> [ 3978.852874] mmc1: sdhci: Host ctl2: 0x00000000
> [ 3978.852874] mmc1: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0x00000000
> [ 3978.852874] mmc1: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> With sdhci soft reset enabled, there are some MMC_POWER_OFF in dmesg
>
> [ 3978.852905] XXX sdhci_runtime_resume_host: mmc->ios.power_mode: 0
> [ 3982.217590] XXX sdhci_runtime_resume_host: mmc->ios.power_mode: 2
>
> The iodelay pin setting is still applied after the emmc is reset:
>
> # omapconf dump 0x4A00348c 0x4A0034ac
> |----------------------------|
> | Address (hex) | Data (hex) |
> |----------------------------|
> | 0x4A00348C    | 0x00070101 |
> | 0x4A003490    | 0x00070101 |
> | 0x4A003494    | 0x00070101 |
> | 0x4A003498    | 0x00070101 |
> | 0x4A00349C    | 0x00060101 |
> | 0x4A0034A0    | 0x00070101 |
> | 0x4A0034A4    | 0x00070101 |
> | 0x4A0034A8    | 0x00070101 |
> | 0x4A0034AC    | 0x00070101 |
> |----------------------------|
>
> >
> > Regards,
> >
> > Tony
> >
> > 8< ------
> > diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> > --- a/drivers/mmc/host/sdhci.c
> > +++ b/drivers/mmc/host/sdhci.c
> > @@ -3848,6 +3848,7 @@ int sdhci_runtime_resume_host(struct sdhci_host *=
host,
> int soft_reset)
> >       }
> >
> >       sdhci_init(host, soft_reset);
> > +     pr_info("XXX %s: mmc->ios.power_mode: %i\n", __func__, mmc->ios.p=
ower_mode);
> >
> >       if (mmc->ios.power_mode !=3D MMC_POWER_UNDEFINED &&
> >           mmc->ios.power_mode !=3D MMC_POWER_OFF) {
>
>
> Best regards,
> Romain
>
>
> >
> > Regards,
> >
> > Tony
>
>

