Return-Path: <linux-omap+bounces-2087-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E76B1969FAD
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 16:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AAE2B24EC6
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 14:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A72E364A0;
	Tue,  3 Sep 2024 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="fRo13zLb";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="mFs/Vc/L"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5CE2C6A3;
	Tue,  3 Sep 2024 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725372077; cv=pass; b=C0ddU2w92EV0LTei25dZcb/Gnu+VJt5yZvyL4faa0X6wUcOBHGHCsCRbSi90gN6Fj8Vmvg3kMZTJ1zstVb7wWRks8Wen8qYL54DxlDmHu9NQ15y/DPbaq8B9BSrGFyDLZloMCacqmQ97KV2bMMbO/gg4+3np/dLXKf1ciTb6uFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725372077; c=relaxed/simple;
	bh=yR/ZqBQR9hE9YBeKLF1idKz1V8EiAXBhFvGF5P8pA7c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=VbPgyajwk2DYLiYyr0vqUIWhiyGYVaOqmTOfZDHfiOSVngHH0pV26C49TCqy4hofNyf6vth1WbfDqB5KqDQ70jiTVRzjtAG4ScLnF0AAbpzbf4nBicwve0ZSsRs7gZCYLo29a3NgmwulkoQbCofCDct22NKBuqJBUQHMLiUlDEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=fRo13zLb; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=mFs/Vc/L; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1725372044; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qsdcNvgkESsevo2yEX3EOKprduYjZvEFzmhYstCSVhwTibEu+u6mqrhqcMAFTW/2Ui
    1SBJ7ZphKBxb6eBaK4si6/PSrjfcvVzHjyR4wDi9xOE8jw0qRqTLHvvsiDvx8NZ3BAfJ
    EBrotWsZ8eh75f7L1m0l3/nCfIFp/QfdUq7jSAJWQrwhjEL2VEKt7FRH+tswA5KKMlGZ
    75HV6qsHsZmVd7eIhDE1L0lgBqUZW/ua2Nj7qaetEjgyBCsMhRh7xjgryfXkvoKcjhh2
    mQdq8wxkawa7AGymjxefUVYdMPAcnCV2xBwZo7E6jGWmgyS154sL/J3UO9FH3eKg8Kg3
    v0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1725372044;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=CCCRDaLfkQpidipIjgukQVULEMXG7rWNDE6sAyR9OLA=;
    b=JUA+hzrB2eV/8fukkftcnMihI3qOFTzbgXnfF9pPRjaBAvpAfTtpyxVF4/slSvGYFK
    afv3lgHDNNayEWUgL9WvTehCY9//+CLlbGZwoppwYt3QGbPPWnipseoB3vH68DSij5Al
    aaWEbVBdGV7v013VNrMrVSMGDfs9IR19EPUykyaqItHSQqqjwJ1fIXM32GItWCRQs8NU
    /g2a4noLFBpNtD9cw7g+yeCnKr/OjuKJwLVyndFbcAnY43PjsGOU978g2nJYkUToWgg5
    OIQP2Z6ad0WJdhkx76YGdfQg92t4qTFCazF01LmZWthZ2zsnxX94N+zsr979e8EyNKWs
    iexw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1725372044;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=CCCRDaLfkQpidipIjgukQVULEMXG7rWNDE6sAyR9OLA=;
    b=fRo13zLb5/UZzXayMmvmm8otCBLL9NJuaH5KFWbaKLzb+NBp6YE4Tqkz/0WzdLmyJr
    tP0XwP0qWoRQsVlOhMOwQIKS3Qmn+OhnM6HSH9PrMJwsMrIn+747XBD32VvZkH3NOobd
    z8fi2A6XEQJESJcY10O7MQQvz2UwEYVdiWSOcYWFtEDDF2ZqsMbqUvts6axcyfyf/XGb
    v9q/IbmBUnwv39aNHSsQx3RU/4wEFHvR+f6gKdjfCyRuyy7H6UVV9VFKX5F+9U2NwN48
    /lgyhIbBwharye/uXc+bnPmvLtFvZjo2XUV5SpHxzyYy8nJCKP81e6P5yOxhuUXam+gq
    wY8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1725372044;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=CCCRDaLfkQpidipIjgukQVULEMXG7rWNDE6sAyR9OLA=;
    b=mFs/Vc/LMXv2HGzfgbG+cvdC0zDRjStPVxlz+bmOYgpNFT3x9AcPkCz+tOfner3Yuy
    jRAiI4ErxXj0qJUIqrAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeDkZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.3 DYNA|AUTH)
    with ESMTPSA id Q984c2083E0iOag
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 3 Sep 2024 16:00:44 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [Letux-kernel] clk mess on omap4460 with mpu clock
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <21258246-D800-47DC-B1F1-C8D879BA2D71@goldelico.com>
Date: Tue, 3 Sep 2024 16:00:33 +0200
Cc: Paul Walmsley <paul@pwsan.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-clk@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1B1B9276-8244-4BFF-9FA3-B06AF8EDFE40@goldelico.com>
References: <20240603234139.280629b2@aktux>
 <CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
 <20240903143357.2532258b@akair>
 <CAMuHMdWF4G5Uon1=6TMzBogN2CX8EuiVBMuCPtAAMPNa-DtiOw@mail.gmail.com>
 <21258246-D800-47DC-B1F1-C8D879BA2D71@goldelico.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3776.700.51)



> Am 03.09.2024 um 15:09 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> I can roll back and try to build&run letux-6.10-rc1 as well.

Ok, I can confirm this issue in 6.10-rc1:

[    0.000000] Linux version 6.10.0-rc1-letux+ (hns@iMac.local) =
(arm-linux-gnueabihf-gcc (GCC) 6.3.0, GNU ld (GNU Binutils) 2.27) #18983 =
SMP PREEMPT Tue Sep  3 15:18:59 CEST 2024
[    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), =
cr=3D10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing =
instruction cache
[    0.000000] OF: fdt: Machine model: TI OMAP4 PandaBoard-ES
...
[    2.315277] omap_i2c 48350000.i2c: bus 3 rev0.11 at 400 kHz
[    2.325073] ocp:target-module@48210000:mpu:fck: device ID is greater =
than 24
[    2.332580] ti-sysc ocp:target-module@48210000: could not add child =
clock fck: -12
[    2.356781] omap_wdt: OMAP Watchdog Timer Rev 0x00: initial timeout =
60 sec

Boot process is stuck with=20
SELinux:  Could not open policy file <=3D =
/etc/selinux/targeted/policy/policy.33:  No such file or directory

Both effects are gone with 6.11-rc6.

If I find time I can try some versions in between.

BR,
Nikolaus


