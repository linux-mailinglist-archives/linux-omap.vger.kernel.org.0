Return-Path: <linux-omap+bounces-2109-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7ED96B2C5
	for <lists+linux-omap@lfdr.de>; Wed,  4 Sep 2024 09:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1BA2285588
	for <lists+linux-omap@lfdr.de>; Wed,  4 Sep 2024 07:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C377E146018;
	Wed,  4 Sep 2024 07:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="ENbuBTjJ";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="Tj1zsPl6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49468824AF;
	Wed,  4 Sep 2024 07:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725434809; cv=pass; b=qoaqTaPcnS88hUDDdevKoEGQ7WkKXLJtoqGzAERxECxsXvaEzI/MZUbRnBuz7eYzpByAPa1ZuR/ZQXrIfuRgbvcIjrmSUaIFMhRayUgdQhAFD3hOEa57p2WR3duiJZgcNRLGm5KTxNiSesv2edFFaxYeTSL6RvjmHu111Yb8NxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725434809; c=relaxed/simple;
	bh=3T72XQFSu/yiZiZCfDC1sHZ+3ChFnoL4Il9ChEqwYcw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=P1uXPWmz9rkd7rlNMk6TZ+X4X9RnpeYRqu+6YzIa8Ww2cC21Ondoh+Rs+n6XK3WVO4K1n8dvbFp5ss8zegocPDTzq5CuzXArc/w7Z+lmlEMVhrhMIkxTH3hsqN7IlH12SGNxPPd6BVXO8pSBTOcAP3jvOE7BMeCsSuq6hyS0TPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=ENbuBTjJ; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=Tj1zsPl6; arc=pass smtp.client-ip=81.169.146.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1725434619; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=hpniwhjQ3mOOpznUD3ryni2nAmU7LpbOJ3H0XFa+WVLNScL0ihGJSV5m6FwrhDcaol
    Ee4fPpTKkZ9Pj+CXCrJD76emAw+NnzyihGu3I4oGpNSBZTtjN73MsBMeGiKE6lrI7zwY
    mDBS7Qyv4Z0QUDjulFZwgG35al/xM/gJfocitT5wi7Upy8GlYHwUR1Nx/tfQEvDZZ/t6
    t+rCEW+T8yrjROzQ1kzBg+jNNqhw00fhbay+BF3WP5lGWlw2gIUXrwd8fQQzwe7rEi/w
    l5e485KfkhVjucZUmVwgtoLQIpWl7KdXNy05VqF1juEQXMpF4sMnSTxB3dIklKbdKBMu
    c/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1725434619;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=f7gne7IDJURoYO/MQfIsXrZIsPne4pig9A6tciellDA=;
    b=q79n1Jg6x2BNV87fHm+0fmjYxnTlSjbMUCgxerbrjtBNCeMNyr9VCHNm/Ju+7QEYTG
    eY+dfUGl0ebawqMBAHRfGt/BRRMcLl5XlBCqDhiVIHlrvVx4WH8QMEl8SM2/RxxtGVQd
    w0sFpWAdy+OGByhbR75zbRo/+SDuosJFSmOsSIHrnNBz8eOt9B5UgWbEp9550FvvufCD
    /KsQ2dXhUF7BRDGwaab1J6UKfPeIfg0NLV1fUIeamwMVd5TFn8VpdL3zsVCRRf4YmpE9
    kNswmH8VABwjXzuJlyy6G0Z8EfuHhTGNj1B8mIuS941EtqwGo+GRVOo55A+sMn59btbs
    u3Ag==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1725434619;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=f7gne7IDJURoYO/MQfIsXrZIsPne4pig9A6tciellDA=;
    b=ENbuBTjJhrGKagVfjDE9c6wTwOo60TsrZWA7JuGBEoJg5u3kIovUmfZzWh6X1XJ2rk
    mmDKae2+xLX39MVRNFIQWO6M5jRA9NVt9JXwikA90Vd36Rh8tO3c2bSxaJ/ZnXjHgpSi
    8WZVy8D5Ff1UKt2LX2b7s5CiU6FfAidn7GOirAxcM+Moc4kMaiVSKs3QKiXKY+TNCR5Y
    9L20NMtlvi6jKMQkxzWdZLInbSLZTEOBBYmWLfsrIaywu8tJUR+RdGfNydutLtHSLddQ
    3Dop/PGhj6VbvtxvQr3qp05Tv5fJchfZiXaGkyJNGpyI5X1eGk9hiEWmhXLZMQu3X2yx
    b5ZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1725434619;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=f7gne7IDJURoYO/MQfIsXrZIsPne4pig9A6tciellDA=;
    b=Tj1zsPl6JBCXtk9c2iM7SzEiYLowbjXUpCxYjhQOaS8RhJnlC56LyFf3CEDL+VVzw+
    c4cPnAKA2Ri0ExbgfgDA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfzwZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.3 DYNA|AUTH)
    with ESMTPSA id Q984c20847NcRSH
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 4 Sep 2024 09:23:38 +0200 (CEST)
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
In-Reply-To: <1B1B9276-8244-4BFF-9FA3-B06AF8EDFE40@goldelico.com>
Date: Wed, 4 Sep 2024 09:23:26 +0200
Cc: Paul Walmsley <paul@pwsan.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-clk <linux-clk@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1E848917-4408-4BEB-B973-C6DECF7BC30A@goldelico.com>
References: <20240603234139.280629b2@aktux>
 <CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
 <20240903143357.2532258b@akair>
 <CAMuHMdWF4G5Uon1=6TMzBogN2CX8EuiVBMuCPtAAMPNa-DtiOw@mail.gmail.com>
 <21258246-D800-47DC-B1F1-C8D879BA2D71@goldelico.com>
 <1B1B9276-8244-4BFF-9FA3-B06AF8EDFE40@goldelico.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3776.700.51)

Hi all,

> Am 03.09.2024 um 16:00 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>=20
>> Am 03.09.2024 um 15:09 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>=20
>> I can roll back and try to build&run letux-6.10-rc1 as well.
>=20
> Ok, I can confirm this issue in 6.10-rc1:
>=20
> [    0.000000] Linux version 6.10.0-rc1-letux+ (hns@iMac.local) =
(arm-linux-gnueabihf-gcc (GCC) 6.3.0, GNU ld (GNU Binutils) 2.27) #18983 =
SMP PREEMPT Tue Sep  3 15:18:59 CEST 2024
> [    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), =
cr=3D10c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing =
instruction cache
> [    0.000000] OF: fdt: Machine model: TI OMAP4 PandaBoard-ES
> ...
> [    2.315277] omap_i2c 48350000.i2c: bus 3 rev0.11 at 400 kHz
> [    2.325073] ocp:target-module@48210000:mpu:fck: device ID is =
greater than 24
> [    2.332580] ti-sysc ocp:target-module@48210000: could not add child =
clock fck: -12
> [    2.356781] omap_wdt: OMAP Watchdog Timer Rev 0x00: initial timeout =
60 sec
>=20
> Boot process is stuck with=20
> SELinux:  Could not open policy file <=3D =
/etc/selinux/targeted/policy/policy.33:  No such file or directory
>=20
> Both effects are gone with 6.11-rc6.

I had made a mistake in updating the kernels and drawn a false =
conclusion.
The new result is:

all kernels I have tested between v6.10-rc1 and v6.11-rc6 report these =
messages.

But after 6.10-rc1 they appear to be harmless (I did not miss any =
functions so far)
and it is not clear if my 6.10-rc1 being stuck is related to this at =
all.

E.g. from 6.11-rc6:

root@letux:~# dmesg | fgrep 'device ID is greater than'
[    2.340148] ocp:target-module@48210000:mpu:fck: device ID is greater =
than 24
[    2.414978] ocp:target-module@54000000:pmu:fck: device ID is greater =
than 24
[    2.491973] 5a05a400.target-module:iva:fck: device ID is greater than =
24
root@letux:~#=20

BR,
Nikolaus


