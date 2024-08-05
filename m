Return-Path: <linux-omap+bounces-1832-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4DC947672
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 09:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33D921F21710
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 07:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F94914AD0C;
	Mon,  5 Aug 2024 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="kTiOLSF+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cESPxOFU"
X-Original-To: linux-omap@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC76149C68;
	Mon,  5 Aug 2024 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722844715; cv=none; b=qi0iSzykaFzKDySrkgt+n//ep+mgZmJMWGLcUWe8T3PyAroY9OOQEGzcfuEcvw6lwEoVKENdx9UVmqOLBQZCiDUvpa4wAB2/GSFCvTra+9axvcUh8Z4s3647mYDyNjrfTwGJ2ic++4ZX+7937XbGVNbWw57fap4EEGsdMGzy1Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722844715; c=relaxed/simple;
	bh=bOY+IPyR12cIAAR3GsqdOr+AB4lyhFBjrlOhxlbuJq4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=aAeC6M6bXEi0mRNygdFU/WcVRsYFL9S4sUYk7RweK48K/eo1NNG7IalEM/8SOeVQzwVtXrE1B6V/hpNHjmg5DQ3BTmkkv7I0iLaKhnkcdZbmsnqK+d5AzP4ySCv/ZdIqqeIkyHrC8irdnQ+r811VxUmUlViYsT/SEX1RkxBlf9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=kTiOLSF+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cESPxOFU; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 3455C1151DC1;
	Mon,  5 Aug 2024 03:58:32 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Mon, 05 Aug 2024 03:58:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1722844712;
	 x=1722931112; bh=CjfRgRTcpF07tO03FLlQi+gafo4kdTqTmGPXzubMnTM=; b=
	kTiOLSF+ZLM2TUlU9mvO3o1n7+ZDzoYfKVRj1MsVcggPMielvL3epZJDctiI/Jna
	a3QbL9H1+xAqJ9sENUyELaXi29l9r+XszaC9pdmI1rGb6dkq8f3gsVgfSgE1iM8L
	wD16MNxBbz42yv3Hv/vM3PKhXc7eKfs5olQ5wKQ3Cvjw4r7FGb5r2JSR2iZgNvOu
	J7sl3aGZBwts3ZoLqd1P+9cBbcq/L6eai/WWiT89+hJHEmNhII+hQ/AFj/HzJghl
	Qm7/1NSox+pcMO/W+Zkrktfeu7kAhOUy2TXsszfU8MqD1JVEpkZ455xoiLGGXk1L
	VZjVXn541DGoXpcCzP4FqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722844712; x=
	1722931112; bh=CjfRgRTcpF07tO03FLlQi+gafo4kdTqTmGPXzubMnTM=; b=c
	ESPxOFU5BDhVMoxIL4zA3mR8FQ4sR37+ESva3oisuyvOUL6EAC5ehfjYbjHK7egP
	Pse7rn3bTovQbfi292yVqNB4mNFxJ9tAEk4mvSFU3JRTcd7RKTGGQMz597KF+Td9
	hSRu/hjfkqgPzzrvw+K3j6YqiAN2mvhQQKXRtmhg3De5GbVamP6TK5yjnxe7kCyC
	wWONAsgvOv27qunSyQ3tNFt6lpo/b+ET0oNaL2UN+BygtKeftTou4ltiTZuOc9fR
	3hz6xmd8HJDh3hEIU6atcmMz9nWvFZUWFfN0uP6yW8BLusCpkmZiNY1GzZRzqioS
	dfrDBQ0U0b/k+Ae8YvooA==
X-ME-Sender: <xms:JoawZgU2itwRcVt1pKwir_JdfPCvrd3EbcFPz0lm_7X_j-vXxJwsRg>
    <xme:JoawZkma8323hK5Qx2787vbIA2FAXbA8NtGiedoiY7YMkJ0F3BfcI27BF6Ymt9fmi
    WiCfEQ_0uFRk71efSU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkeehgdduvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefh
    vdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:J4awZkafAv6rXJaEwSiH1_rUTZfLNH19AeaMu14nMlX7FvQQZpwVKA>
    <xmx:J4awZvUgok8V21Q7yS_DKYDQa-fr4h0nkp_MAt6rwWKMQM3YVjDeJg>
    <xmx:J4awZqnqw6W6Zsu50Z7hVVDVfi-RjG6f8mVU6B_uNbSb7KjkH2crPQ>
    <xmx:J4awZkdc8fuJ_NjgQYOHGqFUe5vWLI8X915tgcIJYn6n5_n1ySvgaA>
    <xmx:KIawZt7W8v94ZRfex92t-JAa-6FXbeH_9EKiAorQmk9p4TWdQOVPpdAO>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DB515B6008D; Mon,  5 Aug 2024 03:58:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 05 Aug 2024 09:58:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Aaro Koskinen" <aaro.koskinen@iki.fi>
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
 "Ard Biesheuvel" <ardb@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>
Message-Id: <eb91d092-259c-4896-a06d-363c1a62712c@app.fastmail.com>
In-Reply-To: <ea475f27-af7c-4060-bff7-a78389174236@app.fastmail.com>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <20240731191332.GB47080@darkstar.musicnaut.iki.fi>
 <ea475f27-af7c-4060-bff7-a78389174236@app.fastmail.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Aug 1, 2024, at 10:59, Arnd Bergmann wrote:
> On Wed, Jul 31, 2024, at 21:13, Aaro Koskinen wrote:
>> On Wed, Jul 31, 2024 at 07:29:29PM +0200, Arnd Bergmann wrote:
>>> === early ARMv6 ===
>>> 
>>> This is the ARM1136r0p in NXP i.MX31 and OMAP24xx, which in
>>> practice means just the Nokia N8xx tablet.
>>> It causes a lot of pain to support in the kernel since it
>>> requires special hacks to support in SMP-enabled kernels.
>>
>> FWIW, I have been never able to boot N8x0 unless CONFIG_SMP was disabled
>> (but haven't tested recently if the situation has changed). And probably
>> nobody else is anymore even booting these with modern kernels. Common
>> distro kernel support for N8x0 would be unlikely anyway due to bootloader
>> and memory limitations.
>
> Thanks for your quick reply!
>
> I don't think there were ever any distro kernels with support for
> N8x0 and other hardware in the same binary, but I do recall Tony
> testing the omap2plus_defconfig across omap2 through omap5
> successfully in the past, which is the main reason we kept this
> as a Kconfig option.

Thinking about this some more, I wonder if we should just
change the Kconfig dependencies now (for 6.12, possibly backported)
and forbid ARM1136r0, i.e. OMAP2 and i.MX31, from being enabled
in combination with SMP.

This would immediately prevent the bug you are seeing and
allow the cleanups we've been wanting to do for a while,
and it would avoid the larger-scale rework that I had
planned (moving armv6 into an armv5 kernel).

The main reason we didn't do this in the past was that it broke
Tony's workflow of testing omap2plus_defconfig across all
platforms, but I assume this all changed with the new group
maintainership anyway.

The effect here would be that imx_v6_v7_defconfig would
only inlucde imx35 but not imx31, and that omap2plus_defconfig
would turn into effectively omap3plus.

I would still tentatively schedule both for removal in early
2026, but if we add the !SMP dependency it's not a big deal to
keep them around after that either. We can make that decision
next year.

       Arnd

