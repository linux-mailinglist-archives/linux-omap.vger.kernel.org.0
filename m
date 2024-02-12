Return-Path: <linux-omap+bounces-551-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CF785154F
	for <lists+linux-omap@lfdr.de>; Mon, 12 Feb 2024 14:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD6471C21B23
	for <lists+linux-omap@lfdr.de>; Mon, 12 Feb 2024 13:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F2D3FB38;
	Mon, 12 Feb 2024 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T700Jya+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE763FE47;
	Mon, 12 Feb 2024 13:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707744255; cv=none; b=WvYB0iXTu1gRm/foP7w3imEYmes7d2agqScOc+0P+vGwCQJq4/EklCEq5Qo/ZVLv4yv9+07U6wbgixt9qHlcGSnLdGgybj+uZtP+NyPYgZ4tMYLvODmnC8U+697DeRN89xIh0vnReeu39fQKEV+01kE6xL4GaXaJ/GpLSTZTbl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707744255; c=relaxed/simple;
	bh=azfKRryA/5evvRBteKAwTwQ1pyCs+SCMNn/gPz1PA7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMXnsYZfjovG08pNbw1vijsMpaiMvYy6NjD8+Id9IfuSMmBAwzI23iRUZxea15keweMlopGr5PtDcguC+B8mzaEpTbIeZjhV6um93OB+Q3ma8s/i4Yj0QURI+kbOXM+giVA8Yz0tiUbe0Dz2YIl3ssJOgC1UQlmK72LQ7XLdSRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T700Jya+; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso3004231a12.3;
        Mon, 12 Feb 2024 05:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707744253; x=1708349053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYG03SNu5Ej6DoBWs2uyYA9vOF4Bd91lNrwLVadd3VQ=;
        b=T700Jya+pcWfGFDbjjh2UlBJiu4Wn7z3kjtWHrlNHUx4A5jmFxy3FC0UM7p0CH6gmD
         41nPvtjZLrkVtF7sDH3mt+d3gmOEEmb+wEhsJT9spGagru3IpJKHH0o0pE+r3kWD4LW4
         XgbUXLOBivijpAQWAaRt53rT18R5e5l5Pbv1W1cdS+8F4w1YylVP5hX3Qmg2+exHm/Jd
         KlTgqU8jcEXDDXtIcs5QAy5+97Rsj3yUeSegiaJ1IhRMZnjS8vlHGhSQfQth8tio/nJi
         3fcXygxPLG6Fyyn1HnLOBK+QX3LR93Fc4QgHVfH+sUn9qzAU9KSiESVrCLuvXeIJOGhb
         Ep2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707744253; x=1708349053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYG03SNu5Ej6DoBWs2uyYA9vOF4Bd91lNrwLVadd3VQ=;
        b=MN7N3PUUY5XaRVAoJtTslq68IVdwQZctGrRl+NhdywMGmByDKZhcNQ5CbxYffsmAbl
         dAXOVfY6QHSc5885pYE0u/QN3heUPt3P5Dyf3C6hnaTkvYn4rYvB1OoxySKkvNifn23O
         rCGRRKDFjTi5Zsuehyi7g4SbiZyPO7GG9h/4LIuEYY1onDwXlIyVBQiRyF4rQZODgbk4
         BHVeSmRU+pvjGOzBg2dZIsnfWcJ1yo1rcowfFPE43RecOnM0mVpG8KQ/Z1BxliQZPhxB
         u+YGNPSRYZLSzmRJGXQHsi2Oyz4TtTMXK5h+rK+ujSdSR+iei8LIWDYDXgE6gXTHrVmo
         032Q==
X-Forwarded-Encrypted: i=1; AJvYcCWA4x8k81X/h6/J7fXzEP58/51AooeAg4Dj6393ZN3ijdBHM9k/pYnsjJxFrrVSVg7JzqBett3R9VOJz4sMEbcWsA/PZeJx9E2hNqw8greqrlI3AUoaQJYIc7ZqXAxjN2XxMGKd2w==
X-Gm-Message-State: AOJu0YxWATRm8KIuQzcNBAAmPD5Tmg00vYkj5+f6bZKx0cIGgtwklIHO
	LzB68OyMvIz9CEvadNQH1dXog3XI/yOisj+ZTGJuwcK3usVBsj7JLtjrxmyg5ovhWP5wvlMuLkV
	q9hgM22X2QBrxebwrUVNNPEfcGck=
X-Google-Smtp-Source: AGHT+IFHQXq9a2N99QTncLsV/aYCIuKT5iyDUEErqGCXrecPAWaSHQ1Iu1I0aoAMIv0oDNyvxVIYsAmh0Arb+j6p6pY=
X-Received: by 2002:a17:90a:be17:b0:297:1775:d44e with SMTP id
 a23-20020a17090abe1700b002971775d44emr3452331pjs.18.1707744253147; Mon, 12
 Feb 2024 05:24:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127044851.GW5185@atomide.com> <d09925b3-83e6-4c52-878f-4c1db7670543@smile.fr>
 <20240129111733.GX5185@atomide.com> <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>
 <7d72f3ee-bcfe-4197-b492-857dc49b2788@smile.fr> <20240131103050.GZ5185@atomide.com>
 <519f7e2e-4df2-4b3c-90e2-2383b6b34562@smile.fr> <20240202043601.GA5185@atomide.com>
 <6eced20a-6454-4824-a149-ee331ebb7eec@smile.fr> <CAHCN7xLUH7Qj_djEuMDAx2nNVqtS5WyoM_DN4zarCbmKh=te4Q@mail.gmail.com>
 <20240212072740.GC52537@atomide.com>
In-Reply-To: <20240212072740.GC52537@atomide.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 12 Feb 2024 07:24:01 -0600
Message-ID: <CAHCN7xJZXVXxiwBXgGKhGmBQhCAFfa4Tn=tJcGLX3N==tgvFzQ@mail.gmail.com>
Subject: Re: sdhci-omap: issues with PM features since 5.16
To: Tony Lindgren <tony@atomide.com>
Cc: Romain Naour <romain.naour@smile.fr>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	Nishanth Menon <nm@ti.com>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 1:28=E2=80=AFAM Tony Lindgren <tony@atomide.com> wr=
ote:
>
> * Adam Ford <aford173@gmail.com> [240208 12:57]:
> > I was testing the newer MMC driver on an AM3517 a few months ago, and
> > I noticed that SD cards were returning weird or empty data after some
> > indeterminate amount of time.  If I read the IOS file immediately
> > after boot, it worked.  If I forced some sort of file IO, it might
> > work, but after it went idle, it appeared to have strange data.  I
> > don't think this bug is limited to one platform.
>
> OK interesting. So the zero values for ios are expected when the card
> is idle. What do you mean by weird values when idle?

I meant zero-values when I said weird.  It's weird to me, because
other platforms don't return zero.
If tha's normal, I'll likely submit an update to omap3.dtsi to migrate
the MMC driver to the newer one.
I'd been meaning to do that for a while, but this threw me off, then i
forgot about it until I saw this thread.

>
> Can you please try catch the weird values or a failure maybe with
> something like:
>
> while true; do
>       cat /sys/kernel/debug/mmc0/ios
>       fdisk -l /dev/mmcblk0
>       cat /sys/kernel/debug/mmc0/ios
>       sleep 20
> done

It appears the first time, that runs after fdisk, the values seems
reasonable, but subsequent iterations, the values are zero again:

clock:          0 Hz
vdd:            0 (invalid)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     0 (off)
bus width:      0 (1 bits)
timing spec:    0 (legacy)
signal voltage: 0 (3.30 V)
driver type:    0 (driver type B)
Disk /dev/mmcblk0: 3.75 GiB, 4025483264 bytes, 7862272 sectors
Units: sectors of 1 * 512 =3D 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x00000000

Device         Boot  Start     End Sectors  Size Id Type
/dev/mmcblk0p1 *         1  512000  512000  250M  c W95 FAT32 (LBA)
/dev/mmcblk0p2      512001 1560576 1048576  512M 83 Linux
clock:          50000000 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      2 (4 bits)
timing spec:    2 (sd high-speed)
signal voltage: 0 (3.30 V)
driver type:    0 (driver type B)
clock:          0 Hz
vdd:            0 (invalid)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     0 (off)
bus width:      0 (1 bits)
timing spec:    0 (legacy)
signal voltage: 0 (3.30 V)
driver type:    0 (driver type B)
Disk /dev/mmcblk0: 3.75 GiB, 4025483264 bytes, 7862272 sectors
Units: sectors of 1 * 512 =3D 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x00000000

Device         Boot  Start     End Sectors  Size Id Type
/dev/mmcblk0p1 *         1  512000  512000  250M  c W95 FAT32 (LBA)
/dev/mmcblk0p2      512001 1560576 1048576  512M 83 Linux
clock:          0 Hz
vdd:            0 (invalid)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     0 (off)
bus width:      0 (1 bits)
timing spec:    0 (legacy)
signal voltage: 0 (3.30 V)
driver type:    0 (driver type B)
clock:          0 Hz
vdd:            0 (invalid)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     0 (off)
bus width:      0 (1 bits)
timing spec:    0 (legacy)
signal voltage: 0 (3.30 V)
driver type:    0 (driver type B)
Disk /dev/mmcblk0: 3.75 GiB, 4025483264 bytes, 7862272 sectors
Units: sectors of 1 * 512 =3D 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x00000000

Device         Boot  Start     End Sectors  Size Id Type
/dev/mmcblk0p1 *         1  512000  512000  250M  c W95 FAT32 (LBA)
/dev/mmcblk0p2      512001 1560576 1048576  512M 83 Linux
clock:          0 Hz
vdd:            0 (invalid)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     0 (off)
bus width:      0 (1 bits)
timing spec:    0 (legacy)
signal voltage: 0 (3.30 V)
driver type:    0 (driver type B)

This was on an AM3517 with an SD card.  I don't have eMMC on this
platform to try.

adam
>
> Regards,
>
> Tony

