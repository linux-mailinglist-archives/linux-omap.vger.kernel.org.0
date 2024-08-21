Return-Path: <linux-omap+bounces-1966-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE3C9599CD
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2024 13:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FC5C1C2247B
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2024 11:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66C81B5EDD;
	Wed, 21 Aug 2024 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="OUzK94bQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jtNyDz+w"
X-Original-To: linux-omap@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BC31B2ECB;
	Wed, 21 Aug 2024 10:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724235829; cv=none; b=S0Ou1E00Jd31Gm6Gv0V/QiKOaAKOfVIt88H8sRb4w55biTal8uyNjw7DWsrc/dhLcnmT0s6FbDwt+ZYy9RzQSxNSQTOLaJvWV2BWdziZ+TWDCUdmYtLveG7GPN4zYZyDFdAzGBjcQNgvOKDzfZSq97chgYmaEEeP3g0f1+OnPXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724235829; c=relaxed/simple;
	bh=Z2O1BIwzKLfp9MUBsaV5TLSLjRVX0FvhU8f2ETMverc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=PQ/lSQs4+N8imt0SYJEbVLYF/DSbp2aJGl5Oi/rogiJQwKsFu6OO7TUCIEL6n/1Zgr6/VgGSLMkSC+2NQeUy5YhsDQGEATlw0mslDDkyIRCCJdc9PxDaGdVbQ+QdqxADRIHDM6+D+xGoiUWVOByayzlem7i5a9HhpWbe+/eb04w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=OUzK94bQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jtNyDz+w; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 4F011114FDA5;
	Wed, 21 Aug 2024 03:51:26 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Wed, 21 Aug 2024 03:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724226686;
	 x=1724313086; bh=lxaTuQ67supVBazauuDO1cZaNg6VSSGIXpqcmIQHamY=; b=
	OUzK94bQrq9+v8zOLVgNxlaKTtJpdmBKbSz8E+uYJ0YY2JfmxFJLFLyc6zFpNMfy
	+ADFTlnI6ykBkXlj2/hOSnzIlRoHReSyxkeTNgAASVtJ7+pPL0LUlRcu4AS8Za5e
	6SXVH7/4No7ls2O84v+PeWcKP19IX+tzAZ3V84wysy7fao06abA6A0NLqQQIdBFE
	+naKXMIp0qwkXmCjt4qk8hJCoQo4weh7BMuGcX/o0ucvToE+k9/OdjzbjDVz8yHV
	qWfpubICrE4vbArsMfSXE8z/0mTARnU8NJGZzBXvwsnYCp/EoEzGI5gfk57UVP9n
	LSh+OFAbX8sPNv1dqGooLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724226686; x=
	1724313086; bh=lxaTuQ67supVBazauuDO1cZaNg6VSSGIXpqcmIQHamY=; b=j
	tNyDz+wPtAostZuntuLXDs5T7GTb3odXchCsJVgeJ+xFFgMBM6tv0hpDCiyxKJBa
	KcyjM7zPcC8vyBTqCanWsV8AgwJH1LDwWPp0onkuxSzzMgOggPmlCpmzYX2DLER1
	hj69NfnVKCcVqAs2caQyp5NAUkcMbIKeCkJHhh5/4v7TEikdOyyJAnIqa+Zf1hkB
	/6pnpDjXOX/9uya4e5z6XgVWpwuubS8iaWY5fVJr3vFRZZ3AqZDNfKbpkpjeZWZY
	FgAVS871ofaccQd1ypTeRSk++axCxZdQYmH3ILMOMwNHYkAfNY3/j7B7NeQxcylx
	u5ULWyzIuNLEEFTTTEndA==
X-ME-Sender: <xms:fJzFZnodR2Dw668YZfsk2Kxehyr0XVUgPruqra8MBK2WwZT5yRDtlg>
    <xme:fJzFZhpFMSPvfotX9MuEc0Vh44ZnzyVXDIP-bmOkwjHRYijROy1Xl29aP83D-NyYl
    BnBiktZsGrBDQI1cJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddujedguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedv
    jedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhitghhrghrugdrvggrrhhnsh
    hhrgifsegrrhhmrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrshgrnhguihhfohhr
    ugesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrgh
    druhhkpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohep
    ghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhope
    hnihgtohesfhhluhignhhitgdrnhgvthdprhgtphhtthhopegrlhgvgigrnhgurhgvrdht
    ohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehrohgsvghrthdrjhgrrh
    iimhhikhesfhhrvggvrdhfrhdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhv
    sehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:fJzFZkMgaHdX5CaTgdpf7JLneO-JB21RhtWNhan8nMSBi1u5CPlYZA>
    <xmx:fJzFZq5a-YC4clj9TZOqXmYjyAcjbNT1klLxNCwje15lSJefSwiarA>
    <xmx:fJzFZm60T6pUcCOS3JNIZge1G01eCXNvs435xawZrro9AKWWd753cg>
    <xmx:fJzFZihDWVrNFzpIyuCZIZZS0T5sZA4oKYmsTDDvKCARS7fZcoji9Q>
    <xmx:fpzFZiPnh3MyPtpJ7DvIwFXXNejSccFI0J2ChBj6HpPdJ9080GryxsJ8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6008B16005E; Wed, 21 Aug 2024 03:51:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 21 Aug 2024 07:51:04 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Dahl" <ada@thorsis.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
 linux-samsung-soc@vger.kernel.org, "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>, debian-arm@lists.debian.org,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>
Message-Id: <96558a17-8c90-4092-a0b0-e128574f3d89@app.fastmail.com>
In-Reply-To: <20240821-moonlike-winnings-fcee547a16b2@thorsis.com>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <20240821-moonlike-winnings-fcee547a16b2@thorsis.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Aug 21, 2024, at 06:15, Alexander Dahl wrote:
> Am Wed, Jul 31, 2024 at 07:29:29PM +0200 schrieb Arnd Bergmann:
>> === ARMv5 ===
>> 
>> About one third of all supported platforms use ARMv5,
>> but most of these are near their end of support. Notably
>> there are still new SAM9 variants from Microchip that are
>> meant as backward-compatible replacements for their
>> older variants.
>> 
>> Debian still supports these, but the lack of FPU and
>> atomics makes this harder, so I expect this to become
>> an unofficial port in the future.
>
> FWIW, these are not only replacements, but actually new boards are
> designed with SAM9X60 for example.

Right, but I would assume that most of those board
designs using it are done because someone needs an
ARMv5 design in order to run a certain piece of
software, or because they are already invested in
Microchip's SAM9 ecosystem in other products.

For someone starting from scratch, there would be few
reasons to pick a SAM9 over e.g. an STM32MP1 with a
Cortex-A7 that is more capable in most ways but half
the cost.

> Not all have .dts files in mainline kernel, though.  Would that
> improve or change things with regard to long term platform support, if
> the .dts files were upstream?

I think upstreaming the dts files is mostly an advantage for
maintaining the specific boards, as it allows easier
integration into CI test environments and lets developers
see which drivers are used by a platform. Having at
least a couple of products with full dts files in addition
to the reference boards does help though.

For the at91 platform support itself in the kernel,
I don't see a real risk at the moment. There are a few
areas that make ARMv5 support risky in the long run:

- Debian support for the softfloat "armel" port will
  likely be moved into an inofficial port in the future,
  which in turn makes it harder for average kernel
  developers to test things. 

- There are discussions about making SMP support
  mandatory for all architectures in the kernel.
  If it gets to this, ARMv4T and ARMv5 support may
  need to end, unlike ARMv6K and up.

- Even longer in the future, all 32-bit kernel
  support will end. I don't expect this to happen
  for another 15 years, but the writing is on the
  wall.

      Arnd

