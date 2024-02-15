Return-Path: <linux-omap+bounces-608-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D14BA856197
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 12:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 868CD287B25
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 11:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2977C129A73;
	Thu, 15 Feb 2024 11:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="s/Bn9hov";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="7/ucvTxn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A4753369
	for <linux-omap@vger.kernel.org>; Thu, 15 Feb 2024 11:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707996710; cv=pass; b=Q/4YDxFE6LFeDUaXfZNJ4cBB6FtpwvI1FZt5g0G7csGPU5xaGPdu7yeZBsLvFYWnQNO2qJmkQW0YF0XJWqRfzZyZc3mPx1WFybp6qb7QKMV4uh71kls6/YtllAY+UtnmY4+/BMZ7/WPDBUq8a2pfUQG+2nvsirgdjev2Bi86z34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707996710; c=relaxed/simple;
	bh=a4mzxkEyzudwkHg8/Q5jsJVAmdLVIouP56wdNlx5Klk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=TmdcOHXzV3c5ePRu6tijQwFISoUYTDQrUht2FUug5aH/VIg7a8gmQFEUWJDFQUxlueS66UHic4ikNpq8RtQmlWxOq5EZPmUyjtyEWkLKgnR3Fy6wq27hT9XRBzNa97Tsf0BKXhKWDC/XVSP+yUzvljDK56+hpiLVJmevhtH9Avs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=s/Bn9hov; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=7/ucvTxn; arc=pass smtp.client-ip=81.169.146.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1707996686; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=c3VQEsPMq3q2V3jBVlpEJMCwmm5bzCDbbu9hGzrS+FTVW/1ld8poJb/XER4TENNHJ/
    w0Y4CbKYodbhTItYVbXAQZ+lkf0I+hC8dDFBych/AXyXzI8rOiie0C4lRIccBcuFC+br
    Y36ALabQ8KSfu5GQzcVAv+Hhx+OqgFYcNe3Rrv03ZK/DRo8eK2c7GmWWDhOILg8OCut2
    DKjU0/o22Aou07FKnwNFS++e4ShfKxxMY6lRPs57/bL6GbAleYgeQd28mp3hxM7Qcixu
    C4ug2zF7dauCZdWZM8JGx8yLpCCJCcg55VliJphxRa3k6NxC7+Rk7vAykEoLz3tJeJR6
    Zsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1707996686;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=a4mzxkEyzudwkHg8/Q5jsJVAmdLVIouP56wdNlx5Klk=;
    b=mPraINUrMWmxdml54QQuPIeKFvYew36uKGGMKfFemUK1Xcq0guXJNsr6RWhZ1RX9x2
    7qhEZZ1TRITZM1NC/iCn9RmGQM9Ribu4BFA/3pwOQEfXf2Ukh9XvQfAlr9bTxhMp3g99
    2sMJsAUAVjqaHV9m8esPviRYWzhwGaZivqyVrYx7r/hd2yBeSn1uzhHTySco3OhnxPp7
    WNU3aBCa9D1sFmNlyilQEmTcAdjxTGS6akN6ot8DOIxfbFWh0HeX4SbcKpOWHPYF6pu8
    cGnP5qLy1BblhFfe/3KQcsYw1xrpgx0yp8pmNXzYIcMndZGBYi9K+aXP2yfop5ECaRrf
    WfhA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1707996686;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=a4mzxkEyzudwkHg8/Q5jsJVAmdLVIouP56wdNlx5Klk=;
    b=s/Bn9hov0Chy9Cze5Qc8SbV/U/KJHbSWGp1V7d4/R6BwvwHFqKRVUzTR7Xq2lWp17O
    iNpLA+yZC3thSSbW5AkcE7pmCJu93InvIIFfWa6wjhB7vOcpdUEv3JtV+lnHQ3+AowKV
    Uzyf7bNYElYUJfPoB+T1oInAgQb81IpQ7Q/vTjftUuJLuMO+WpJCqPUII6tJWpzOGw25
    trvodr48HM0PgxFFKrx/naXpQYU7OhVivrIHXHdaXbHVx29XmWbphS5alMGGk6IlaPue
    qdPRDR5Ddr6u1whdIRVYIRzoz5sZMTZCf9E1LKeheR3RpjX1eyNRfamdS9u2UwbDbch9
    kKYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1707996686;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=a4mzxkEyzudwkHg8/Q5jsJVAmdLVIouP56wdNlx5Klk=;
    b=7/ucvTxnf39LJF99iPUhyiY8bbAZfU3SP4Gt9NuDvfXYjThK2jbU/MbwqdQ/NAPoYu
    TQgr7JuMoPgKCs1PKqAA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qviAxtjc3+iDRKYXYiBKB+t+xHWJ5dYFU7T2iPf8ad6Lg=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.11.2 AUTH)
    with ESMTPSA id z5997c01FBVO8Hg
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 15 Feb 2024 12:31:24 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20240215093113.5c58cabe@aktux>
Date: Thu, 15 Feb 2024 12:31:13 +0100
Cc: Arnd Bergmann <arnd@arndb.de>,
 Dmitry Baryshkov <dbaryshkov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 paul.eggleton@linux.intel.com,
 Andrea Adami <andrea.adami@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Tony Lindgren <tony@atomide.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Daniel Mack <daniel@zonque.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Stefan Lehner <stefan-lehner@aon.at>
Content-Transfer-Encoding: quoted-printable
Message-Id: <313D5846-3F4E-485C-AD93-172CCD1F48F5@goldelico.com>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
 <CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
 <CALT56yOT_U9jVkhTP=zZu-32B4pta5zaJocn9695N7ari4cFyQ@mail.gmail.com>
 <be4038e1-a578-4439-a9bf-e936484c64cc@app.fastmail.com>
 <20240215093113.5c58cabe@aktux>
To: Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3774.400.31)



> Am 15.02.2024 um 09:31 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> On Wed, 14 Feb 2024 23:42:58 +0100
> "Arnd Bergmann" <arnd@arndb.de> wrote:
>=20
>> On Wed, Feb 14, 2024, at 13:26, Dmitry Baryshkov wrote:
>>> On Tue, 13 Feb 2024 at 23:22, Linus Walleij =
<linus.walleij@linaro.org> wrote: =20
>>>> On Tue, Feb 13, 2024 at 9:12=E2=80=AFPM Arnd Bergmann =
<arnd@arndb.de> wrote: =20
>>>>> On Tue, Feb 13, 2024, at 16:36, Guenter Roeck wrote: =20
>>>>>> On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote: =20=

>>>>=20
>>>> Andrea Adami and Dmitry Eremin-Solenikov did the work in 2017 to
>>>> modernize it a bit, and Russell helped out. I was under the =
impression
>>>> that they only used real hardware though! =20
>>>=20
>>> I used both Qemu and actual hardware (having collie, poodle, tosa =
and
>>> c860 that was easy).
>>>=20
>>> The biggest issue with Zaurus PDAs was that supporting interesting
>>> parts of the platform (PCMCIA, companion chips) required almost
>>> rebootstrapping of the corresponding drivers.
>>> E.g. I had a separate driver for the LoCoMo chip which worked =
properly
>>> with the DT systems.
>>> PCMCIA was a huuuge trouble and it didn't play well at all. The =
driver
>>> must be rewritten to use the component framework. =20
>>=20
>> If we want to actually go there, I think the best option for PCMCIA
>> support is likely to replace the entire "soc_common" pcmcia driver
>> with a simple drivers/pata/ storage driver and no support for
>> other cards. There was a driver until commit 38943cbd25a2
>> ("ata: remove palmld pata driver") that could serve as an
>> template.
>>=20
> hmm, main usage for PCMCIA/CF in those devices was often something =
else,
> not storage, at least on the IPAQ h2200. Wondering wether that road is

There was a WiFi CF card for the Zaurus devices and I remember having
donated one to someone who could make the drivers work.

Unfortunately my devices are collecting dust and the batteries may be
bad now.

> actually good. When I was mainly using those devices, I was not good =
in
> mainlining things.

Same for me...

BR,
Nikolaus



