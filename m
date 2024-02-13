Return-Path: <linux-omap+bounces-575-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03925853C0E
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 21:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFCB52861A7
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 20:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BFB60B99;
	Tue, 13 Feb 2024 20:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="FnCL2QCh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aiHH+K4t"
X-Original-To: linux-omap@vger.kernel.org
Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48497608FD
	for <linux-omap@vger.kernel.org>; Tue, 13 Feb 2024 20:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707855125; cv=none; b=AKbskPUJBmSw0SawOBN8/r7QJYXkw8FNHTHqdAu5QI+y7SLxHH/cwVdrq3vSV7dVJgbpLkWRXjI4GughOaJST/B0srFKG7KZl1DaYBtPvqKX9c0woptXD+vL3Qv1CoDTOzRRk7hNKtNJJbjxUpnDzsU51yExwV8gQG3CVq0YzHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707855125; c=relaxed/simple;
	bh=mHn0JimzLPLrzUo+zkpIFJW+49+BaVHWbEYSOH6iHpQ=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=gjjGuVBmu6Pv7lKFedJsokUmI6JixZZbiGgc/m+nzoMmsvVmy4jE56xTHiLUn2ff8HoiL/CcPsWO6Xmohwg95hmwtvfijoVSQ3lv53u22BJi1v+eKdtRuDcj8fvmFv5eP+AzoQMC1ur/sKu67fZ8F4TEN8J/gmFjW7PNvTBofeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=FnCL2QCh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aiHH+K4t; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 2745E180021E;
	Tue, 13 Feb 2024 15:12:01 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 13 Feb 2024 15:12:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1707855120; x=1707941520; bh=6XgfZLq/8l
	T+ICPCdLSnFWbgNYDzIi+HJw7RYxPU5Os=; b=FnCL2QCh9cTaeZhBhtO7x394sh
	Xxrm26lecN8AHh6RLOIVT/XRe9sfIQzADbT7uPnyRgXqgxSgoyvIfGlgBP98ThTe
	jaonJ0iBiQP8tEE2C92+R344hqvfasAU4XR+p59ScHTc94wmp9uEnbpjIjCHZ64C
	RHdAcX7I/dpNlUnw56I5a1n2GlDmKldJKZx08h+ToE3eZZ0azz5QLg2px5M3RlMv
	Tssdrbu+YE/KH1EQt/CJmv5ijlJLjkORGSA7xwKOxLZdY7je7doM+5eZ+UzpKEAA
	xGWuWXGV3z8utZkcjBlI/NdY25AhFQB2TtfqMUWLOr2nPa9AzvjJ8/6nIajQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707855120; x=1707941520; bh=6XgfZLq/8lT+ICPCdLSnFWbgNYDz
	Ii+HJw7RYxPU5Os=; b=aiHH+K4tTbrTP/X85/c3UbqSE0/fBcTHK83YAp41iCPJ
	VHWaQ64PkWV4wF30Xf+pFYAwxKacQKcz1DdxaU1/KEFjs2lGdJhtEJEoWr79il0b
	jNy+eaIx6U0mi1ocCS9Dl+zwfZhYD3yC2CYYSoEpD7wFR78UGkCo9gqM4ZMxrVrw
	IHb3Rwc99DomuTkYlMBV3s6uOScW6vkayDf4/0A9hMZAdOnTX+ZGoxif93ga+ojT
	ulAssApAeSs83qSw78gdZ/YNr/uOK0v4cL5Tilc7ERrW8m1ZcrGrIzo+yU1LlXtH
	gpzfyAm0/ifUVTzyOw6DIABGfdIUqs5e+LLKIFKMGA==
X-ME-Sender: <xms:EM3LZTNoyMsAJ-IF9DZur3I71qkG--7DqAXEhTXZPdf2yXDSRoJbaQ>
    <xme:EM3LZd9L7GKmKzM5x59D0ae4cQgtYsHFnmUQztHA1a7pJanX8DR2vDd8w_ogTT8q7
    m4ZrIvn50X_tAF9HRI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehgddufeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:EM3LZSQAu7XOcH0UmLJ0F4yBR4ZfPkXWP9rgq0n0br4dsrhG5ukeXQ>
    <xmx:EM3LZXvT0gBDacLImceImAXcRwvvDBpAYoY-3vjZN93j3AgaBXUXXw>
    <xmx:EM3LZbdRbJ86I8dtqO0-oV8dIKUbXqkuk-PaAjMBDXNMrO66FXC0yA>
    <xmx:EM3LZW9QEBRIHTh6yzolh69eiqqf3eds4ORZXHqdJUMMUvCs32nscdtLls4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 24472B6008D; Tue, 13 Feb 2024 15:12:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
In-Reply-To: <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
References: 
 <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
Date: Tue, 13 Feb 2024 21:11:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>,
 "Peter Maydell" <peter.maydell@linaro.org>
Cc: "QEMU Developers" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "Marcin Juszkiewicz" <marcin.juszkiewicz@linaro.org>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>,
 "Daniel Mack" <daniel@zonque.org>, "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Stefan Lehner" <stefan-lehner@aon.at>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine types
 (pxa2xx, omap, sa1110)
Content-Type: text/plain

On Tue, Feb 13, 2024, at 16:36, Guenter Roeck wrote:
> On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote:
>> On Mon, 12 Feb 2024 at 14:36, Guenter Roeck <linux@roeck-us.net> wrote:
>> > On 2/12/24 04:32, Peter Maydell wrote:
>> > > The machines I have in mind are:
>> > >
>> > > PXA2xx machines:
>> > >
>> > > akita                Sharp SL-C1000 (Akita) PDA (PXA270)
>> > > borzoi               Sharp SL-C3100 (Borzoi) PDA (PXA270)
>> > > connex               Gumstix Connex (PXA255)
>> > > mainstone            Mainstone II (PXA27x)
>> > > spitz                Sharp SL-C3000 (Spitz) PDA (PXA270)
>> > > terrier              Sharp SL-C3200 (Terrier) PDA (PXA270)
>> > > tosa                 Sharp SL-6000 (Tosa) PDA (PXA255)
>> > > verdex               Gumstix Verdex Pro XL6P COMs (PXA270)
>> > > z2                   Zipit Z2 (PXA27x)
>> > >
>> > I test akita, borzoi, spitz, and terrier. Upstream Linux removed support
>> > for mainstone, tosa, and z2 from the Linux kernel as of version 6.0, so

It was 6.3 (about one year ago).

>> > I am no longer testing those.
>> >
>> > I never managed to boot connex or verdex.

I kept specifically the pxa boards that would be sensible to port
to devicetree because they had qemu support. gumstix verdex is the
one with the most RAM out of those; spitz, sharpsl and their
variants are the ones that some of us still have around.

Robert had working devicetree support for some machines out of tree
that he has not submitted, and presumably not worked on since.

Unless someone starts working on converting the remaining
pxa board files to DT, we can probably remove them after the
next LTS kernel a year from now.

I have no objection to removing them from qemu if that helps,
the existing qemu releases should be sufficient for anyone
trying the conversion.

>> > > OMAP1 machines:
>> > >
>> > > cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
>> > > sx1                  Siemens SX1 (OMAP310) V2
>> > > sx1-v1               Siemens SX1 (OMAP310) V1
>> > >
>> > I test sx1. I don't think I ever tried cheetah, and I could not get sx1-v1
>> > to work.

This is similar. omap1 development is slightly more active
than pxa, but then again they have no DT support today and
are unlikely to ever get there at this point.

Out of the five machines that are still supported in the
kernel, I think three still run on hardware (osk, ams-delta
and nokia770), while the other ones were left there only
for their qemu support. I don't mind removing them from
the kernel as well if they are gone from qemu.

>> > > OMAP2 machines:
>> > >
>> > > n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
>> > > n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
>> > >
>> > I never managed to get those to boot the Linux kernel.

I think Tony still tests these on both hardware and qemu.
The platform side here is much more modern than any of the
others above since it does use DT and it has enough RAM
to be somewhat usable.

On the other hand, this is the one platform actually using
the cursed arm1136r0 core (not counting imx31 and
realview here as I'm not aware of any real users), and
anything that would get us closer to dropping support for
this CPU would be welcome ;-)

>> > > The one SA1110 machine:
>> > >
>> > > collie               Sharp SL-5500 (Collie) PDA (SA-1110)
>> > >
>> > I do test collie.

Adding Linus Walleij and Stefan Lehner to Cc, as they were
interested in modernizing sa1100 back in 2022. If they
are still interested in that, they might want to keep collie
support.

Surprisingly, at the time I removed unused old board files,
there was a lot more interest in sa1100 than in the newer
pxa platform, which I guess wasn't as appealing for
retrocomputing yet.

>> > All the ones I use still boot the latest Linux kernel.
>> >
>> > > Obviously if we can remove all the machines that used a given
>> > > SoC, that's much more effective than if we just delete one or two.
>> > >
>> > > I don't have any test images for the SA1110 or OMAP1 machines,
>> > > so those are the ones I am most keen to be able to drop.
>> > > I do have test images for a few of the pxa2xx and the OMAP2 machines.
>> > >
>> > I don't mind dropping them, just listing what I use for testing the
>> > Linux kernel. I suspect I may be the only "user" of those boards,
>> > though, both in Linux and qemu.
>> 
>> Mmm; there's not much point in both QEMU and the kernel
>> maintaining code that nobody's using. Are you considering
>> dropping support for any of these SoC families from the kernel?
>> 
> Not me personally. Arnd is the one mostly involved in dropping
> support of obsolete hardware from the kernel

These are all clearly among the least maintained boards we have
left in the kernel after the last purge. At the time I asked
for remaining users in 2022, I kept pretty much anything that
had the slightest chance of still being used and I was already
planning another round for the next LTS kernel in early 2023
that would be more aggressive about removing things that
nobody is working on modernizing.

>> It sounds like between the two of us we do have at least one
>> test image per SoC type if we do keep any of these, but
>> if it isn't going to inconvenience kernel testing I'm
>> inclined to go ahead with deprecate-and-drop for the whole lot.
>> (With QEMU's deprecate-and-drop policy, that would be "announce
>> deprecation now for 9.0, keep in 9.1, remove before 9.2 release
>> at the end of the year".) At a minimum I would like to drop
>> the OMAP1 and OMAP2 boards, as that's the biggest code burden.
>
> I am copying Arnd, the OMAP1 Linux kernel maintainers, PXA2 maintainers,
> and the Linux omap mailing list for input. Sorry for the noise for those
> who don't care, but I think it is useful to have your voices heard.
>
> Personally I think it very unlikely that anyone is using the latest Linux
> kernel on any of the affected machines, but I may be wrong.

I imagine that the Nokia machines are the most likely to still
be used somewhere.

       Arnd 

