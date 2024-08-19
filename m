Return-Path: <linux-omap+bounces-1922-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 670199566A8
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2024 11:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85F791C215E4
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2024 09:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BA615E5BD;
	Mon, 19 Aug 2024 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Ud6JcAod";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dpx3IjKI"
X-Original-To: linux-omap@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689A615B992;
	Mon, 19 Aug 2024 09:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724059054; cv=none; b=dBt+2bnTLdHntmiYsUPCS7tuEUbcqIM2MplOVzETnlElXAjYRz/4Fp2u7Pt9drL+kNX0kSA+cbWTZ04W9An7RMlalHdcdxmLpvmkvpGJLGczUzt5YHUhI9KKNqHqDRdS3CrAI3cAYFiKr/fwm8urG7tBBANCmGPZOLfM0etM8X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724059054; c=relaxed/simple;
	bh=IqniPhbCmZxI9RtQPRoTeIcqNs7wU34N4HJzmRdKoLc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XnSs4y+OLx6Lh9x4VytrK8HLsM/YUMBDtuSLMAxeerfzc2oQGBsWXykUKNnQoZfytqopgNZ7vbNE8qTQv/mjM1gySGe2k+gJrmqOzR03xq/jf6oSqKC12kMMiQ13xvcywhskrapWNn2JXCM4tBhtcFXVPjMzvX4hZQRwDTFcnBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Ud6JcAod; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dpx3IjKI; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 7209B1150836;
	Mon, 19 Aug 2024 05:17:31 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 05:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724059051;
	 x=1724145451; bh=oVEsI+flW84gQwRAmwbOjMNDy4XUMPgz5I0zP431mCw=; b=
	Ud6JcAodEHQ43uv1js/tvbMDGmKlleBjvQ6u3go/ut4c3Lye59mh73AB9ZURu+QP
	nX4ddZM8RS0/XZPugidUx/gmJ50LF8P1aTv8l8yhMBW1VYazgP7/W5KQdakOoY32
	YgC/1e8V81u8v2n/oC9CfsYGLotiHSQf8rHrYrvKHi0Pov+ZHBhhhVdQx5WibfmF
	xLY54sj+u6RXlfPNhrLF7tgtqVC2PjqFio2TKqlCCJEOIGGiDHVhlVTFvUMkvKpr
	PwC8ZDADO1x8AZyLLjOCRp0cHwoWpDrYghFRLOwSNHCB80MIR0uumX59MuRj+hDO
	lQr4UN9klr8j1zgvNgpqLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724059051; x=
	1724145451; bh=oVEsI+flW84gQwRAmwbOjMNDy4XUMPgz5I0zP431mCw=; b=d
	px3IjKIcF4HxkvSSk5sCZglQnDctnDggwja+d6Kh4CHa00U07cyAijWSfsVxfH4r
	S4JJ19trSBargI08bB3TqB9sOwpSfdssjIfjO7x9Gxa+F+NF4NvGSDEAtuzwexT+
	LXdQ9XhzCR4cXg+rc19x1QImDCk+xSf2GPGUdqybPhvVi07bGX6GbpBKHUhbou1/
	nFmP/GQQPDJHHujeVieUKOAHD8l0cdGkxc3UeT2zkyr8yHTT7aYi3WEWrnQoO9Zi
	kKJwU+8s5gEAVyyLWOiLW9rUdXDjMKeFvns/yzV631d8mVhk4tVvLZ1OcvARvtt2
	F43Lem5NomunH/xhHFLSg==
X-ME-Sender: <xms:qg3DZqJ_-mqNyRF3xoP8OYz9XE-yiNJ6gfN5K7kI4WT0UxpAcbcMUQ>
    <xme:qg3DZiIAogjVOCE-Y3pdBEksPOxiGKEwrOqxlVZ6LS4lA8veYrrAU-8s-IVpihotw
    VgX9ENxCYv-YZtrBAo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedgudegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:qg3DZqvy0Ms2WN7rlf3dz4MxENrFR6kIkTgACjD-LxGv2-K2cXEOhg>
    <xmx:qg3DZvZghMZgwu5eS-WPU40pW-W7a00Uxahb0RKVH2NXaPEdmSetTA>
    <xmx:qg3DZhYRhmgPElU9UfovaioVay8uZpslc0qtf-aCpofExIB2V2qx6w>
    <xmx:qg3DZrCmnUkR7NK99ddqCqeg4JqU15x0_EhEwfAPXeLya6Gxh1uLgA>
    <xmx:qw3DZlKGdeVByaaXHPLKuFZ-JosMCVLnz0C0L16UR87QpTmN63jer7r1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 54ECE16005F; Mon, 19 Aug 2024 05:17:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 11:17:08 +0200
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
Message-Id: <790bf2c4-2ecf-429c-8e28-ad5807ffed7a@app.fastmail.com>
In-Reply-To: <3413899.e9J7NaK4W3@earth>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <3413899.e9J7NaK4W3@earth>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Aug 15, 2024, at 21:53, jeremy@jeremypeper.com wrote:
> For the Buffalo devices we still have a lot of folks using Marvell Kirkwood, 
> Orion5x and MV78100 NAS devices. In a world where SATA provides the cheapest $ 
> per TB storage and Gigabit Ethernet is still standard they end up being 
> surprisingly relevant for hobbyists.  
>
> The two pre-DTB device files that we're still using are:
> mach-mv78xx0/buffalo-wxl-setup.c
> mach-orion5x/terastation_pro2-setup.c
>
> If those can stick around for the next LTS kernel that should give me 
> sufficient 
> time to try converting them to DTS like the other Orion5x/Kirkwood 
> devices.

Right, the plan was always to keep them for this year's LTS kernel,
which is almost certainly going to be 6.12. This should be enough
for Debian Trixie.

I expect that the terastation pro2 is going to be fairly easy to
convert to DT as there is already support for similar Orion5x
machines. In this case I would just remove all the Orion5x board
files and you can add a dts file later on. The bit I'm unsure
about here is legacy PCI support. I see that the board file enables
both PCI and PCIe, but I don't know if both are actually used,
or if everything is on PCIe.

I have some old patches for separating orion legacy PCI from
PCIe support, as only the latter has a modern driver (shared
with kirkwood and armadaxp). If you can confirm that the machine
actually uses PCI, I can dig those out from my backups.

The WXL machine is going to be more work since there is currently
no DT support for mv78xx0, but everything except the pin controller
should at least have a driver since this SoC is somewhere between
Kirkwood and Dove. Having a hack for the pin controller similar
to what orion5x has is probably fine, especially if you only
need to support one machine.

Let me know if you need any help during the conversion.

    Arnd

