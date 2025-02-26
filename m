Return-Path: <linux-omap+bounces-3301-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF71A4653D
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2025 16:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18FB817EAA9
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2025 15:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70F1215764;
	Wed, 26 Feb 2025 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/jQiFgg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5C222540F;
	Wed, 26 Feb 2025 15:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584230; cv=none; b=TNU8OZXQfyssUSR3MKqJ8+qzV+aRWv5ToK5ZM9PCatYevXnvX2hiSNIPkmIVNkaxHumjvf4ylPByEmWGQvUEuPpZWFYu3lQAaxDF2bVElVEEpNfm8YFAGfyoPKLNpYQDq7EqVk+uTneibMbhf07P/5qL9OrlJ0f5XM6qrYGF+XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584230; c=relaxed/simple;
	bh=haxdMh3gegq3PCYylyPaZbASfg61mKGPEkWJBVWTgYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0yOKTmh5nlMiOfD+Uj4P/RmIhTi+Y1m0o1v3LkPdpCxQcddM8FU06jrXIise5Jbpx6aRgL06kWmXEW/luZXNHyBBkBHRZDvIuV83Uhz6v2EPM2epgdCz5iRGGzUDDNWd8XSqVoE0dISZqIOOm0Jmxj5IBMPwDBYqrFyDLXz/2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/jQiFgg; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6fb9388f9f8so68798297b3.0;
        Wed, 26 Feb 2025 07:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740584227; x=1741189027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5sNCb6VeBjrJ2uWl3QtahrMMyekbkmmUY3Vaa9Ns+4=;
        b=F/jQiFggkgTR188iWiBNgv6Tsz3ZtR7ncf4d5xGixwFBxqjck0h+iEMKBm9xdbRz0y
         odT5+qnk3mAlDbLx14Hg3nBT7UhfLDOqrnFCDwyKFCUQvmPZ0bkOLicNZtBvggx/J8HL
         yWDULv9JMQypaM7DgZy2vWyeSVkHu5trQV3o1XFB5qV2Y2ZQu6iwL8w3slNH38x7dlTE
         aS61sPMBfPz500KjUx8VDdvJNwLrbn3qqXAY2xnN1Vvil1u9LGOtfyOpTeqleU68Zfbu
         pavEFnawPvhpklyeNnJaQ87mN8lvkpwabCwGRLLL1cIpDlQBR6612I3wDiDH+7fjeP5J
         ArNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740584227; x=1741189027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5sNCb6VeBjrJ2uWl3QtahrMMyekbkmmUY3Vaa9Ns+4=;
        b=lDgqnbtcTwS2PhmharJjGkMSOTLhc7bh1aEjfIB7G7E04sUf/8LOR12IIGrC9rOw9m
         My6nvVWC+82unANYUiZ9w9t/urvHID/8LunK2MYmIVNM576h8AWTIThWn4o2fHLpel7L
         ycJPnh7zUJKtN1Ai+Z9DHHHIFl1p1PaZPBy7gRZ+XDi7zpLK99OhmOoEVcozYDX2Yzxo
         0CFbQbsGpRGaEjASznx0CBjIEO8bonoCFA50pta2ybputQyAyrH3DArfi3lyOmOEG4xi
         Fg1E9mjgea2mD5vbuPnqQ6QLjo5K5eq7r8zgy1yi8GO3Vm0q4dJNbgdmippDWAUkqmwk
         4ScA==
X-Forwarded-Encrypted: i=1; AJvYcCU9vOw0W9mrWRPfzUwDAIfS8c4PQX0jPDcaytbskxZonXyqFZzKq/ih6KxpFu0R0bHaUtlQuD0hbkk=@vger.kernel.org, AJvYcCVzPj+81NjJDdHdpvCZDjphATjt5VoXm+c5DC9YTq0MZi2iNXwJYu0QMqmhGSR012g1t0Zew5s+BgM3lA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcicIb+xPLJm5+Uw8KrvjZFeBOEDZ2ZYnebPGAWIf3+mNquaFu
	v7tJ1yIHaEFRWVpzI8YLptBPIT6W1jFCGaVXirtK74uPevfxCNDhxeNBkA8ePyDnZhwfkxMa/zo
	UB8nB0dbB3XhGb+JWOBTEioH20y4=
X-Gm-Gg: ASbGnctDejPV9Wgk2eACO6Dpq1tJqMD/80BN/u6DdeuxbGGscGRzQiZAxt5QKb4fovT
	eKNKmmgp5PqyeQgGVho4OpTOSA1VBCtKQVkL61hTPqDdIxrcqpYIOgWjkZ2OpcThmQW8a1V+Iz6
	88GIijMU96
X-Google-Smtp-Source: AGHT+IHvER8mgunVRpHv0os+9A1EJvIJCXxIdetE6KEf3TOscSXDzYINlHgw7EA2aq9XidaE+ldh7QOVhdXZ0I820ag=
X-Received: by 2002:a05:690c:6bc7:b0:6fd:2762:9d11 with SMTP id
 00721157ae682-6fd2762c924mr19682067b3.8.1740584227575; Wed, 26 Feb 2025
 07:37:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1c5f72c4-3d55-4d62-b690-8c68b76a15d2@gmail.com>
 <f6732c49-a5b1-4a13-b9f6-c2d552b5e7e8@smile.fr> <31717d89-432c-4b77-a974-99f7e6b97f97@gmail.com>
 <9168d127-06a7-46e6-a7a2-f2e60032a50e@gmail.com> <b1a369e2-938b-49ed-b743-6562f0bb46f9@smile.fr>
 <CAOCHtYiBFNY9nFjtqsFFpqRKdxUif_fC7MVqZ7cffeD8rLSe2A@mail.gmail.com>
In-Reply-To: <CAOCHtYiBFNY9nFjtqsFFpqRKdxUif_fC7MVqZ7cffeD8rLSe2A@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 26 Feb 2025 09:36:40 -0600
X-Gm-Features: AQ5f1JqEii2A0yVzr3eFi4izYdT_33kABt-SE08gcTZKss5Fqa3C5_dDGEI2c8g
Message-ID: <CAOCHtYiujoMoPHfSmyTrv_48wUn3TfaoiPEcMFB=V++MZXvuuQ@mail.gmail.com>
Subject: Re: sdhci-omap: additional PM issue since 5.16
To: Romain Naour <romain.naour@smile.fr>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Jason Kridner <jkridner@beagleboard.org>, "Aldea, Andrei" <a-aldea@ti.com>
Cc: David <daowens01@gmail.com>, linux-omap@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 3:20=E2=80=AFPM Robert Nelson <robertcnelson@gmail.=
com> wrote:
>
> > Thanks for testing.
> >
> > I'm able to reproduce the issue locally (using a kernel 6.1.112).
> > It fail after the first sleep 20...
> >
> > If I remove MMC_CAP_AGGRESSIVE_PM from the sdhci-omap driver the issue =
is gone.
> >
> > About sdhci-omap driver, It's one of the only few enabling
> > MMC_CAP_AGGRESSIVE_PM. I recently switched to a new project using a new=
er SoC
> > but the eMMC driver doesn't event set MMC_CAP_AGGRESSIVE_PM.
> >
> > I'm wondering if MMC_CAP_AGGRESSIVE_PM is really safe (or compatible) f=
or
> > HS200/HS400 eMMC speed. Indeed, MMC_CAP_AGGRESSIVE_PM has been added to
> > sdhci-omap driver to support SDIO WLAN device PM [1].
> >
> > I've found another similar report on the Beaglebone-black (AM335x SoC) =
[2].
> >
> > It seems the MMC_CAP_AGGRESSIVE_PM feature should only be enabled to SD=
IO cards.
>
> We've been chasing this Bug in BeagleLand for a while. Had Kingston
> run it thru their hardware debuggers.. On the BBB, once the eMMC is
> suspended during idle, the proper 'wakeup' cmd is NOT sent over,
> instead it forces a full reset. Eventually this kills the eMMC. Been
> playing with this same revert for a day or so, with my personal setup,
> it takes 3-4 Weeks (at idle every day) for it to finally die.. So i
> won't be able to verify this 'really' fixes it till next month..

Okay, it survived 4 weeks.. We really need to revert:
3edf588e7fe00e90d1dc7fb9e599861b2c2cf442

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D3edf588e7fe00e90d1dc7fb9e599861b2c2cf442

On every stable kernel back to v6.1.x, this commit is `killing`
Kingston eMMC's on BeagleBone Black's in under 21 days.

By reverting the commit, I finally have a board that's survived the 3
week timeline, (and a week more) with no issues.

Normally on MK2704 EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_B changes to 0x02
and the eMMC never works again..

[44-am335x-bbb: 6.1.83-ti-r37 (up 4 weeks, 18 hours, 35 minutes)]

*************************************************
cat /sys/kernel/debug/mmc1/ios
clock: 52000000 Hz
vdd: 21 (3.3 ~ 3.4 V)
bus mode: 2 (push-pull)
chip select: 0 (don't care)
power mode: 2 (on)
bus width: 3 (8 bits)
timing spec: 1 (mmc high-speed)
signal voltage: 0 (3.30 V)
driver type: 0 (driver type B)
*************************************************
dmesg | grep boot0
[    5.362457] mmcblk1boot0: mmc1:0001 MK2704 2.00 MiB
*************************************************
eMMC Firmware Version:
eMMC Life Time Estimation A [EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_A]: 0x01
eMMC Life Time Estimation B [EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_B]: 0x01
eMMC Pre EOL information [EXT_CSD_PRE_EOL_INFO]: 0x01
*************************************************
cat /tmp/eMMC.txt
eMMC name: MK2704
eMMC date: 04/2023
eMMC rev: 0x7
eMMC hwrev: 0x0
eMMC fwrev: 0x0100000000000000
eMMC oemid: 0x0100
eMMC manfid: 0x000070
eMMC life_time: 0x01 0x01
eMMC serial: 0x5992401d
*************************************************
0x01
0x01 0x01
*************************************************
cat /boot/uEnv.txt
uname_r=3D6.1.83-ti-r37

I'm sure someone will argue that we should test this "PM" mode... Well
on AM335x this is broken, at $~60 a pop I'm tired of testing this
regression for the last year and half.. waiting 3 weeks for a board to
die..

This needs to be reverted!

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

