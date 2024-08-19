Return-Path: <linux-omap+bounces-1924-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C55956CDF
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2024 16:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A490B1F22FBC
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2024 14:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F94A16D30C;
	Mon, 19 Aug 2024 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="snH5UHo5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h/K7d8GN"
X-Original-To: linux-omap@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750D916CD07;
	Mon, 19 Aug 2024 14:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724076766; cv=none; b=nY3anGwe5fGOuzAhwmh865bw8kiba1f1Pl0C5BvnWeRMTxfw1Ca96VllscKM+DQwjJDYxKJxeq9sP0Q8V4J6nizU1xhI57LsYBCMmOMi0pxiqylIOUPpP9OOS3ohPZSuAL0WzEtd9b/yZ1niQre2wy37C8/XBUXX20esa3w67Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724076766; c=relaxed/simple;
	bh=eebbsAW7E+geXsaHLwzlA7lnGu524xFfc/frRGe5XcI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oVUkpGla8PXcQbniB5m4mxhJk+JGXXc6yVc4q9czEeUpyMrMeAt0wNV/GorHDwv144HzBuaXLOm4rw8+FKWocHeEyXZRT+NW0KisjxylWs2wLLRahKEC7FcRAX9rornsRLSFER6oq73sMM0FOHPAvQkc6EOiKQaktKllDdTUwOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=snH5UHo5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h/K7d8GN; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 547E513879F2;
	Mon, 19 Aug 2024 10:12:43 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 10:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724076763;
	 x=1724163163; bh=CNHCaNkcKvmMf8XIIksDaBad+a8ZzVCnWR625xJrpkE=; b=
	snH5UHo5t+kEgDa61jLhwDGSszfGGTixbz8wH9JnQqJzpd9iG57mppOtClb4Mp4B
	fN06n+Efc5dBcF+inXEC/bSvFpXzTSiBPEL713sRz9N0VOhbek4PEc3ugG0GbqLm
	zqsrmJv1f1BaWSqzGDSC0oH6n94cOYG3hpPzgVYv/E9zAxZCCXj79/WzjZ40X9hJ
	BpTmB4uVRvWvXcS5HI1ox0Xe/bieHRp2Hc3T+O+kBBPOX1v6CbProUDwyOH+fH/+
	uXk3NAMLzGqK4gVo0DrBI3ldWmzTD/4Fz38DqrXopIlvF7SsQNCfgUzx3zegSq0b
	g36uwvHDziWuPaSOfhIBUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724076763; x=
	1724163163; bh=CNHCaNkcKvmMf8XIIksDaBad+a8ZzVCnWR625xJrpkE=; b=h
	/K7d8GNhvbkEIBmKk4wYFRCnXZbtzcX5OXaNFxwRP1C8QAJrTpyG+b2X3y6cybSt
	qx1mn6ohOuEzcFMyMmMp+pGlvp+5/pZld+51OoRGjJROFIUMFTZ+T7II0SLL6RIs
	YTPTKc63CQoqb8ASV6dyc1LxH03Rr67AQA6jjZzU7T7PQZFi0eBjRWuYdx6IJ+MT
	KEJ6BrXJ5l5N7aCp0kykLp9HyYZB3AyBqHhKOkni4+kt8V5P04FVfsR8PUs2M/dG
	U60KF2FCfYJGOWL+mArpKgG8Qms5EssGmyfTm6kQHkeND6kBmgJrlFeEJ4xbZx72
	wueGDZ71F+sHjIuaBuqvg==
X-ME-Sender: <xms:2lLDZiCjBbJcY4od8ZltQ-CkOtqoSGQ_Pi5rcssnQqxyGyq5Dr3Jhw>
    <xme:2lLDZshQa0bqjBjdV-7DkU2cX06ipYlzu20SEd9kVa3WGNdlf8oiaqx_C_S_6rp-x
    MVC8Cy9MXKAuMavW2I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdeh
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrihgthhgrrhgurdgvrghrnhhshh
    grfiesrghrmhdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhsrghnughifhhorhgu
    segrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrd
    hukhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehg
    rhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnh
    hitghosehflhhugihnihgtrdhnvghtpdhrtghpthhtoheprghlvgigrghnughrvgdrthho
    rhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtoheprhhosggvrhhtrdhjrghrii
    hmihhksehfrhgvvgdrfhhrpdhrtghpthhtohepughmihhtrhihrdhtohhrohhkhhhovhes
    ghhmrghilhdrtghomh
X-ME-Proxy: <xmx:2lLDZlltBUYT-FySgHP5xI2odApdA4TrGVpE2kO6MjLJFv29D_C1ow>
    <xmx:2lLDZgzxfPEvIDhUJF3W4-tJazz8WJdUuusG0AUSq4i6wOpNqOFkCA>
    <xmx:2lLDZnQuF-50v8f-iwoj2HdFgM_o8R-4nyJhQY-a5SGF2cfwF72TxQ>
    <xmx:2lLDZrabcR8FMrQ4Xx-BClL1M5R5d3-T6tXuQ4PoSC7QVctaiQRqoQ>
    <xmx:21LDZgDwknI2cbF4N4AoFVdf9-Z8R3AZkaZpj9LrrLG3qsy6by0VV4BW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1F78616005E; Mon, 19 Aug 2024 10:12:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 16:12:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Richard Earnshaw" <richard.earnshaw@arm.com>,
 "Richard Sandiford" <richard.sandiford@arm.com>,
 "Ramana Radhakrishnan" <ramanara@nvidia.com>,
 "Nicolas Pitre" <nico@fluxnic.net>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Mark Brown" <broonie@kernel.org>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 "Nikita Shubin" <nikita.shubin@maquefel.me>,
 linux-samsung-soc@vger.kernel.org, "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 debian-arm@lists.debian.org,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>
Message-Id: <a8c009b5-ada0-4f78-92f7-7a6c5075ccf1@app.fastmail.com>
In-Reply-To: <790bf2c4-2ecf-429c-8e28-ad5807ffed7a@app.fastmail.com>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <3413899.e9J7NaK4W3@earth>
 <790bf2c4-2ecf-429c-8e28-ad5807ffed7a@app.fastmail.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Two small additions:

On Mon, Aug 19, 2024, at 11:17, Arnd Bergmann wrote:
> On Thu, Aug 15, 2024, at 21:53, jeremy@jeremypeper.com wrote:
> I expect that the terastation pro2 is going to be fairly easy to
> convert to DT as there is already support for similar Orion5x
> machines. In this case I would just remove all the Orion5x board
> files and you can add a dts file later on. The bit I'm unsure
> about here is legacy PCI support. I see that the board file enables
> both PCI and PCIe, but I don't know if both are actually used,
> or if everything is on PCIe.
>
> I have some old patches for separating orion legacy PCI from
> PCIe support, as only the latter has a modern driver (shared
> with kirkwood and armadaxp). If you can confirm that the machine
> actually uses PCI, I can dig those out from my backups.

I did find this myself later, the machine does use an on-board
PCI connected SATA controller, which is obviously required to
make the machine useful.

Doing a PCI host bridge driver with DT support correctly is
a lot of work, especially if there is only a single machine
using it. Since this uses the same drivers/ata/sata-mv.c
driver as the other orion/kirkwood machines, I wonder if we
can just pretend that this is a platform device and skip
all of the PCI probing. I think this only needs a few
small changes to the sata-mv.c driver, but it does require
that the PCI bus is left in a known state by the boot loader.

> The WXL machine is going to be more work since there is currently
> no DT support for mv78xx0, but everything except the pin controller
> should at least have a driver since this SoC is somewhere between
> Kirkwood and Dove. Having a hack for the pin controller similar
> to what orion5x has is probably fine, especially if you only
> need to support one machine.

The complication here is that removing the board file would
imply that all of the mv78xx0 code immediately becomes dead
code. I guess the next best idea is to remove the orion5x
and dove board files first and then move bits of plat-orion
that are actually used by the WXL machine into the mv78xx0
directory.

      Arnd

