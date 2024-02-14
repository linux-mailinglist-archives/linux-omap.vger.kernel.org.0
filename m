Return-Path: <linux-omap+bounces-593-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8441F854BF8
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 15:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8C5B1C216AC
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 14:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C835C8F1;
	Wed, 14 Feb 2024 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="rjNYeC12";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pGI2V3GL"
X-Original-To: linux-omap@vger.kernel.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E51C5C8FC
	for <linux-omap@vger.kernel.org>; Wed, 14 Feb 2024 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707922695; cv=none; b=tIS9sJTRUVObo3K++V2HGU9gw+TGcqSGUfkbys7Cx5A2SMV+xoJ9RwCYghgh0cXHh8O86+ulQUeCIJZ2wKheix5GD9hwZf1hrNYqataNsPyT2nfXS1nZwXAnX0muk8UGeyf2O0SvBWyUy9ROt4LlkLXgl+aIO2TFVF6mgRBbXBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707922695; c=relaxed/simple;
	bh=0I00Zd1krWMH/Fnp1v0LnwHGI3Eq7M0JP2iP0ZtnYpo=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=uuv+md0GE+/21sfNpAqUK3AjEDLlgiFrqhCjC57uBLCNS+92n6W7+P4/uwsZZspvLr++iiO6ViiQGiCeNjMRYtmUJThiLU7iNOCugtC8kgF9mRaFB/LR9rQhlAjfr69dz9qKUr/m/B8Bd/XcNRbadXvT2PjO87smLqPlYEtj5zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=rjNYeC12; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pGI2V3GL; arc=none smtp.client-ip=64.147.123.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 909EF3200392;
	Wed, 14 Feb 2024 09:58:10 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 14 Feb 2024 09:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1707922690; x=1708009090; bh=uDmfOsg9gU
	tVPfRB+2sWNwn5yu3xkUXEF+MG27C5Dtc=; b=rjNYeC12XR01H737Y39uCh/un7
	h+k+7rvPsh/l250F8FM1N97OFbD59aBSu18Bupi7vNc8qYOr4iZo+BGCmTvFgQ4C
	2Y5anjFNO4Aj2XOiZXRaKtoAkr2tEsX+Ci5t37PoChOb0HKQhJS+ksD0XpCK4emj
	j26WnowC0Bqnerz8PANjdwk+jr4WGRU9tBXhHbts73nVyG0icaBA9A7nGES7IMGs
	WM3l0gVRNm4utZOM6habjtRFzU8PRbWt3BNZJlx4cP5UWmudV7EVv2d5f8do7ezJ
	5IYMRuo9aICx32wb8DXw4ayHCC16DRDU2F0y1d4PPc1TmPQw+CcKj0eGbftw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707922690; x=1708009090; bh=uDmfOsg9gUtVPfRB+2sWNwn5yu3x
	kUXEF+MG27C5Dtc=; b=pGI2V3GLyNYFup6/YmJUkWU83lP5R3rTwThzRyTCmEjt
	yBzm3kBcOk6kYYaBD3/dbPOdgUMjnSZUiNUYp00f5JECLcBg0XO/zgbUGAD6roIe
	JD+JE0omtgMkmGoFiGG1kdhXlbfYssLeQWw3+8yl4/qWiQSXeCxsvUCPEdtCO1iN
	yh4f3Ra0lRdrRWeu1ez2AuatYX13rI6DITBHPWs6WJMJQ5KLCi138zUHpS/C54T5
	H/k8hUJDX0tcerKjEdOMCYSF//xfnZAsaG9kMO4+DRVLQopPRGwTJ7vllGkAR8N8
	Y5Gdgq1i50S9JSnZDy9tb8zrh1YbzasQZEzkqNXRfw==
X-ME-Sender: <xms:AdXMZTYxcc4dpVQ4ctlSARACqDNe9AgVQYiyBh_cL3wzrsO7p6tPzg>
    <xme:AdXMZSaUJhJp6ie9-mLwUmrFduJNHYFYMpNE5CjlFa3o3zrRe4hSgLdTl0hzyobyZ
    ApA1lyFjApBeYfTfNE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejgdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:AdXMZV-Q7-HjMFByKcFClo-jqyEZyiJe9f25HSLLQFJwrsmsGYRUYA>
    <xmx:AdXMZZo-LS2PeA2lLmSAAYz_0V7ZwjGrdVfzyMKMzwBDf7J4mzL0YQ>
    <xmx:AdXMZerHvWACUsNWccPL8vjOEHU5nh2t2YewQHGg2m6Si4nVrLNRag>
    <xmx:AtXMZUieTMLYWDSgJVKe_O1rwJnlT25wtsGI5ejnXYulQxs0TPVfBQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6CC73B6008D; Wed, 14 Feb 2024 09:58:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <5214dd7c-0472-4ce8-bc41-ad565ddcc7a9@app.fastmail.com>
In-Reply-To: <20240214012749.GA203324@darkstar.musicnaut.iki.fi>
References: 
 <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
 <20240214012749.GA203324@darkstar.musicnaut.iki.fi>
Date: Wed, 14 Feb 2024 15:57:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Aaro Koskinen" <aaro.koskinen@iki.fi>
Cc: "Guenter Roeck" <linux@roeck-us.net>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 "QEMU Developers" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "Marcin Juszkiewicz" <marcin.juszkiewicz@linaro.org>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>,
 "Daniel Mack" <daniel@zonque.org>, "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Stefan Lehner" <stefan-lehner@aon.at>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine types
 (pxa2xx, omap, sa1110)
Content-Type: text/plain

On Wed, Feb 14, 2024, at 02:27, Aaro Koskinen wrote:
> On Tue, Feb 13, 2024 at 09:11:38PM +0100, Arnd Bergmann wrote:
>
> I'm one of the OMAP1 Linux kernel maintainers, and I have Palm TE which
> I have been using for testing and development (and reporting bugs,
> regressions) along with those other boards you mentioned.
>
> Since I have the real Palm HW, I haven't used QEMU for that particular
> board. But however I use QEMU SX1 support frequently as it's quickest way
> to check if OMAP1 is bootable, and if the basic peripherals are working.
> SX1 is close to Palm/AMS-Delta, and also it's ARMv4T which is rare these
> days. I think it's useful to keep it in QEMU as long there are hardware
> that people use.
>
> So my wish is to keep at least SX1 support in QEMU as long as ARMv4T
> supported in the Linux kernel.

Makes sense. We have a couple of other ARMv4T systems in the kernel
that are still being tested (ep93xx, at91rm9200, clps71xx, imx1,
nspire, integrator/ap), but none of the others have any qemu
support apparently unless you count "-Mintegratorpb -cpu arm925".
All of these are are using DT or getting there (ep93xx), so we'll
probably keep them around for a while.

Similarly, we support a couple of ARMv4 (non-T) targets in the
kernel (footbridge, sa1100, rpc, moxart, gemini), but the only
one with qemu support here is sa1100/collie.

>> >> > > OMAP2 machines:
>> >> > >
>> >> > > n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
>> >> > > n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
>> >> > >
>> >> > I never managed to get those to boot the Linux kernel.
>> 
>> I think Tony still tests these on both hardware and qemu.
>> The platform side here is much more modern than any of the
>> others above since it does use DT and it has enough RAM
>> to be somewhat usable.
>
> I have also these boards (real hardware) and test them frequently with
> mainline Linux. However, QEMU support I haven't used/needed. I recall it
> was a bit buggy, and some changes in mainline made the kernel unbootable.
> Unless Tony needs the support, I guess they are good to go.

Thanks for confirming.

> (Arnd: RAM isn't everything. Some of the OMAP1 boards today are still
> more useful than N800/N810, even with modern bloaty Linux.)

Obviously RAM isn't everything, but the machines with just 32MB
or less do seem very small for real workloads, so I admit I
dismiss them easily. I am curious what you run on those, are
there any embedded distros that maintain good support for 32MB
systems on modern kernel/musl/Xorg/..., or are you using
omething older or highly customized?

     Arnd

