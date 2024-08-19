Return-Path: <linux-omap+bounces-1926-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BB5956D68
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2024 16:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 136BB1F24A09
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2024 14:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E71171E5F;
	Mon, 19 Aug 2024 14:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="kYMAYaaK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JCkvDd9l"
X-Original-To: linux-omap@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DBF16BE23;
	Mon, 19 Aug 2024 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724078075; cv=none; b=t4phKlwfFbZ0dLE0i5emyTPnlMJ56yRRr+TLFaf3Veen0c67xy+dKkyq5wElqaeU4GHdyJH9qCXzESmW7CH3eYcac34ECv624MPNMCVtcxKCqT2cUB1bOF6Y0LUDYWRlMniI93prFpX8YKTJNNfokvfdY3ux1fnCTiNwN4Zg5rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724078075; c=relaxed/simple;
	bh=dg9PHiIHHyncj1FUrSsiVVbktAaF5R95cmLQsROQGhQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FdR9f5xN7PmdzkC2Hb+VALapbwrCvzLN6tSkJxtjCJLs8N9A5I1xX4qA/gFRjAX/cvHyx2oHUJIxDyHsa9dVdmQSW9heqTYN1tfwSIjLO6EgxyN2oKoXaE8oZssiPl/odpbeLv/r5bKt8i79vGg7U4OtZHPEdVVUmzJ5Os7ypaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=kYMAYaaK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JCkvDd9l; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 33081138FD36;
	Mon, 19 Aug 2024 10:34:33 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 10:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724078073;
	 x=1724164473; bh=Cplj/5Hfvrx9mPB6KI5mnvTdVq2LqbBokqZy1h0BfXk=; b=
	kYMAYaaKojb6fGpgnXuMzkNoSxwsdCs0LxOUZxfOOzOa6l8mJvsto2qOWvKDe99w
	O3Kog/eyVXd+256u2o2kPdwQ3YpdMsBgviTdsB3xmYsuu2GtP/atJ1VSeqVPKnVc
	GoDk75Ke3in7UV36T09C7alZrVzRSKmpuliwqq8XbHrNBZcjDhkmaQTUZCbF+AIJ
	rB4UEu6M7k/itpJcrjfTpZvwTThfMiXtK/CVKY7o4AkAd0skdhuiE+jOzVHbtYl0
	jj8l4tXSHFRywaPTpU2mjtpawXTZMWyRS/nkhQ2jg9CHZ+dQ5S5vSbFK9aA/vRPO
	Z5HaFnk0YgKhGeMO8O6kwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724078073; x=
	1724164473; bh=Cplj/5Hfvrx9mPB6KI5mnvTdVq2LqbBokqZy1h0BfXk=; b=J
	CkvDd9l31/OQqQw1lpW4KEnwJ8P7Nr7aKLzhFBUVshxxg3bqee9p7y09ATguGVW2
	QtRvUejpY2RWR8FtKk4VacCE6u3+sH1df+anfzGcCZf+RwhqQ/v1Kr7o/V4PZS/G
	111fR1KlmJ6PPCCMy2IgIxTIIFIiMF1lTcZ3FsRkHPmnOGkBVAovqVdxczD8iUYw
	OvqetryOhjHInR0MiSktY3jlZ27XTIJ3C4QGFGhRa+unxz6yKKJhW/AFP/+PmCxa
	63A2d+pMeIMpKnWmp3Dj/cvMv47y10l1WdT8PM12dgwsY+5bAzgOAfnsyKURr9cd
	GKHEv8zSkC0uN6fhrJO+A==
X-ME-Sender: <xms:-FfDZqu7s1tsN0B7slXYxeRDXVGIQDXsSaevAsPMDqBZBX9S_Ssjjw>
    <xme:-FfDZvelvBkRUNFtAVS_DmlU80HLnH51Wvr8CgOVDAx8pvRimBjXGT6uRt7anLFD9
    xGRM0Gkx6FYkZNmnBs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedgjeekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:-FfDZlzsgpt03jojW3yQcRME6tNfJK75hzi7RgV-ucZw5_G6MKuo2g>
    <xmx:-FfDZlO3zMheNL8FfsxzSMjAHSHde4IMCp7SwXpQKWGtq5GSigwlWw>
    <xmx:-FfDZq9kpqKTM4mjyh4WXTittGT3XqQpeXV2EFjNhyj9jhIRB0MxPA>
    <xmx:-FfDZtW0iNO3POcp2g2N7lQE_HQTiDEaS6ozNc7rcAuNPFbY8rQR2Q>
    <xmx:-VfDZoMsg0jqnAeDmEoIZoSKAU9HMfoouEsaTUrbOi6ZWq2D5FR6Mhbb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1939B16005E; Mon, 19 Aug 2024 10:34:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 16:34:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Russell King" <linux@armlinux.org.uk>,
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
 linux-samsung-soc@vger.kernel.org,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 debian-arm@lists.debian.org,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>
Message-Id: <a0ecae5c-e72f-4d19-98df-1ab848f36d4b@app.fastmail.com>
In-Reply-To: <a6316f7c-4064-4145-aa6a-d34197a3981a@lunn.ch>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <3413899.e9J7NaK4W3@earth>
 <790bf2c4-2ecf-429c-8e28-ad5807ffed7a@app.fastmail.com>
 <a8c009b5-ada0-4f78-92f7-7a6c5075ccf1@app.fastmail.com>
 <a6316f7c-4064-4145-aa6a-d34197a3981a@lunn.ch>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 19, 2024, at 16:23, Andrew Lunn wrote:
> On Mon, Aug 19, 2024 at 04:12:10PM +0200, Arnd Bergmann wrote:
>
> It is a long time since i looked at Orion, so i could be wrong....
>
> As far as i remember, it has a PCI controller and a PCIe
> controller. They are slightly different. The PCIe part is i think
> simpler to support, it follows the standards better. I _think_ the PCI
> controller uses a GPIO for interrupt support, which causes a mess.
>
> If only PCIe is needed, it should not be too hard to make work. I
> would try to avoid the PCI controller is possible.

This machine uses both PCIe (for ethernet) and PCI (for SATA).

The PCIe driver is arch/arm/plat-orion/pcie.c and is shared
with mach-dove and mach-mv78xx0, previously also with kirkwood
and presumably armadaxp, which now use the more modern
drivers/pci/controller/pci-mvebu.c.

I just looked at the other dts files for orion5x and see
that they still use the old pci/pcie driver without an
entry in the dts files.

This is clearly not where we want to be in the long run,
but doing the same thing for the terastation_pro2
is at least not going to make it worse.

       Arnd

