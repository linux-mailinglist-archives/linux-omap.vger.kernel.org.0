Return-Path: <linux-omap+bounces-599-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9714855646
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 23:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEA751C218EA
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 22:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3020F1E491;
	Wed, 14 Feb 2024 22:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="1Yr7/mbJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m6mrQt2n"
X-Original-To: linux-omap@vger.kernel.org
Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A439C182DF
	for <linux-omap@vger.kernel.org>; Wed, 14 Feb 2024 22:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707950712; cv=none; b=K5Mazc+g3CXWGQD5xcfkSXs0hcWRhy1kPZnTCI72Z1JYJSssBadQ+h50DPMEK7OMX8nLQsW5OdLacau23HdHYLNTNvQadiR5stGZgJJdPkcMLNhRSR3YqLnI0jmnq2VtWPOWfyomo4NfZ9ECQv0bxKbgtpk0mwjupBC9LvqemRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707950712; c=relaxed/simple;
	bh=z2Z6YRdp6hQz2cZxjvRy+k1JLyZfbWtn6ZggvUS9qfo=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=PV8hNEMUX7/fnmbOzIvxb2XP2rPZgbSRxNCo/p1DTo2kMXI1cgaGWAsH2JHHqH2Jly6Tj3BjVLqkBjcjaiFdPd+zvlDe1wQKvyn3/OokVTZCS6wosBgBYz1udIcyVjPpGXk+jPCSHPiYMMs/kqo6ekaESENvc0pbIGZQG7TwRG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=1Yr7/mbJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m6mrQt2n; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 5A20F1C0007F;
	Wed, 14 Feb 2024 17:45:08 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 14 Feb 2024 17:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1707950707;
	 x=1708037107; bh=5IYsIk7ogLkaGYvbkI8VhBzBfBy+gdVcvU7E21EVjY8=; b=
	1Yr7/mbJgRu/HhpfbgOUHOg+uJ5aZcOS01dttWARtkBNr2rVkChrNEqbGxMJIHO3
	wp55mLtXoq5dRfKgAkEzYd8zzQjIOnpEx5uQuwoeXN9+pdltEYqBRf5pValSpttR
	j/FMDxJbE5RcSUg9c132/I43bRqMyff0LZ3AVkGhoDn9Tf0PjXneXo2aL4EE19DR
	e3/a3mnl5ev1C1cOw7NQ5jdkVmyuMFWqzJWG0NykYGPIGpZBHaUlq+FfiwQTxubI
	ZymJ8IuULP88e7NQq0f7eKKXTuz/7196rNk5w9mGmdE/V+sb3MLP6gV0GALhYTVa
	mlJj5y/ToOsrBfR4zWpWMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1707950707; x=
	1708037107; bh=5IYsIk7ogLkaGYvbkI8VhBzBfBy+gdVcvU7E21EVjY8=; b=m
	6mrQt2ntzSE6f6WWVUf0/SLbblYyjVzZzLJkiKFZs8edw9cgmsMRIHRpTcjRwgR7
	zE5C6CjkM4qrW1H43JehuxzNMJuw1RJTrtIDS9k9LD6J7phGLo5rIAfgUiE1iZQU
	P9J/RYgM2tvb/lRkTVE6E6Hx3F7ItWrnJNSVJ6E9t1itGDSJj/4kK4LtVhH2c/c5
	z7o9qWSzLHa9a8V2nkcMIQ2q4ix8DochNgCAb6y7b9n8Trbgc70Pb3NzXypIpsV0
	k8kkIy6pjGEskTYeU4XPgr6J895lAJvCeDH/umKT3rhd7mROw7tNnkU6NmeELs3l
	vYJcwI6XYzg4Q/B/XBiow==
X-ME-Sender: <xms:ckLNZT_JJMaIVEZ2IlCnLR8UcjSc_Opv3Bh_2qtyw8ruP2zx-c9ejA>
    <xme:ckLNZftlgtrCdx5yAKOA3_9Sk59fRWoubTKnO3IkKzProJBpR-kugdW7aomPvRQ3f
    EZAqoXsYMuXQsqpv9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedtgfejveen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggv
X-ME-Proxy: <xmx:ckLNZRBG6dWjBwQiCIHiHIr1d3OD9dqKGI7cBHYYIogHlOxlTaIl8Q>
    <xmx:ckLNZfeg6GSk2ouFPnZZXu0aJylnz6EoMxw0-p_7PUEUEvJCwn9tZw>
    <xmx:ckLNZYM3oslqSs6pvDVxAbUZSmlpwfYYQtk074dm2Eno7XnE9Wm3bw>
    <xmx:c0LNZdf32ndN---QbdHBYSTIIdalud5LQRU3CRDRhLOnd0ueQCbTw9vlqxs>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C74C9B60089; Wed, 14 Feb 2024 17:45:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <be4038e1-a578-4439-a9bf-e936484c64cc@app.fastmail.com>
In-Reply-To: 
 <CALT56yOT_U9jVkhTP=zZu-32B4pta5zaJocn9695N7ari4cFyQ@mail.gmail.com>
References: 
 <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
 <CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
 <CALT56yOT_U9jVkhTP=zZu-32B4pta5zaJocn9695N7ari4cFyQ@mail.gmail.com>
Date: Wed, 14 Feb 2024 23:42:58 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Baryshkov" <dbaryshkov@gmail.com>,
 "Linus Walleij" <linus.walleij@linaro.org>
Cc: paul.eggleton@linux.intel.com, "Andrea Adami" <andrea.adami@gmail.com>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 "QEMU Developers" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "Marcin Juszkiewicz" <marcin.juszkiewicz@linaro.org>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>,
 "Daniel Mack" <daniel@zonque.org>, "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Stefan Lehner" <stefan-lehner@aon.at>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine types
 (pxa2xx, omap, sa1110)
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024, at 13:26, Dmitry Baryshkov wrote:
> On Tue, 13 Feb 2024 at 23:22, Linus Walleij <linus.walleij@linaro.org>=
 wrote:
>> On Tue, Feb 13, 2024 at 9:12=E2=80=AFPM Arnd Bergmann <arnd@arndb.de>=
 wrote:
>> > On Tue, Feb 13, 2024, at 16:36, Guenter Roeck wrote:
>> > > On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote:
>>
>> Andrea Adami and Dmitry Eremin-Solenikov did the work in 2017 to
>> modernize it a bit, and Russell helped out. I was under the impression
>> that they only used real hardware though!
>
> I used both Qemu and actual hardware (having collie, poodle, tosa and
> c860 that was easy).
>
> The biggest issue with Zaurus PDAs was that supporting interesting
> parts of the platform (PCMCIA, companion chips) required almost
> rebootstrapping of the corresponding drivers.
> E.g. I had a separate driver for the LoCoMo chip which worked properly
> with the DT systems.
> PCMCIA was a huuuge trouble and it didn't play well at all. The driver
> must be rewritten to use the component framework.

If we want to actually go there, I think the best option for PCMCIA
support is likely to replace the entire "soc_common" pcmcia driver
with a simple drivers/pata/ storage driver and no support for
other cards. There was a driver until commit 38943cbd25a2
("ata: remove palmld pata driver") that could serve as an
template.

      Arnd

