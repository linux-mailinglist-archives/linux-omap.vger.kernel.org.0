Return-Path: <linux-omap+bounces-1960-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD41958C3E
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 18:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60D281C21A08
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 16:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0391AE04F;
	Tue, 20 Aug 2024 16:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="LSoMR42Z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WmELDH8r"
X-Original-To: linux-omap@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AE74409;
	Tue, 20 Aug 2024 16:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724171643; cv=none; b=MBLTbAEvKwo3OF4aaaVVQlgwPJ9ONP6ra0i94ltO81+1K4tc/M3e2EXNMMVF+/4gUjQ4zNdyjvLveG9EDrisd9h5cB5aPMlE5zIHfNBAb7OGjRhtCBQUvyf258NmFVBaiaixYLtMiDMBtRyt+KSMh+vO2dQ5BCdWUl0yY8+iX4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724171643; c=relaxed/simple;
	bh=/XoyeLhJOMdiV+fck/gfdRhWNFn3uUSCiXd8QjDtXkY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jKGEZ0DTgQUI4wQIWG1zRI+7ZMZtMjlZfkEJvL35/d3/OgjJruWHNjht2H/kKDy2iRgLErszK+zdqhcOGixvgQVG4gFMW5NQa/oiNf5N8oYUZvRTzFk1ZkYzEQh7Ii2DacWkhc2xSM8s1iDjl61khuwfEodwFWZ1LhcOG9mzOww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=LSoMR42Z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WmELDH8r; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C921A114C014;
	Tue, 20 Aug 2024 12:33:59 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-01.internal (MEProxy); Tue, 20 Aug 2024 12:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724171639;
	 x=1724258039; bh=8tm+zjOSeS2e198Z0q8BGjvR8eFaaeCScshlT6M34Ho=; b=
	LSoMR42ZnljNCZWUuf7Ica3R0rDI6eRJhXUvyFRyDuBYFeicQnpQanK996a3ISjd
	4VhlX5YOedVagec2Sr7ez8ceJrUkfhz7Mqan3WAw6s0FVLDGCGUxS/vhuNrO4IUB
	6I4mNa7P+qlGqGaS7NjRXktBVC7hmrMjNgNgvjaZj5dHhfI18xQYSNLEbriNpXQI
	c37VkY96s4q3lvce4SLlzTAuHqaHdxcwmzIPn1foqxYcrpb0AOKNicV85iAJ1ZOI
	a6n+2EhuSqG7ElMk0iurDxyLUfTClZFCwXf4ixVVcdGKfFjS0MXPgRaoo7ATgmHb
	hF5WYYMqAQKaCSJEYUl8Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724171639; x=
	1724258039; bh=8tm+zjOSeS2e198Z0q8BGjvR8eFaaeCScshlT6M34Ho=; b=W
	mELDH8rysxjw5IYDfLIY+0HilcaqCfRCPxflKRMP1anRUl5RY/H9jdQ++kzVnMDD
	+DxYTILmuM/A7jUsDx1n5vLx+REXq8hGJPFM4HIrDnG1F8bJcUqZr0Sf4bpyD4aa
	usaEk/0AwucMYQrY+yJvOzUlFqZ2V+j3o4FtWmhYMlmHzigVxNJ6sI6PY1XS0gMR
	qmUg/tvKiEDwl72ZfFjH4SIHrlf4fV/YRWTGm+CYdLew8oxY9kV9TyW3EnBrEyhj
	2trh7VXrc4hnAfb2TmrytSbAwOV7TyP5I/HNq36iQIEybdGhVGls89J9acC0pFCD
	NvHiBtVCVK6dirEkNGS5g==
X-ME-Sender: <xms:dsXEZoOC7cAle-HVCC7Dw2WLLhPQ5_bj9i9fMLE6b_eXdOgyuxP7Bg>
    <xme:dsXEZu9fHLuPDfxnJcx3T_i4I35s0yKjkISESzhdIwqKZWDsuAuzk1M_yRBvCDylK
    dhB9jcQ_-Fokk87vv0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduiedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedv
    hedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhitghhrghrugdrvggrrhhnsh
    hhrgifsegrrhhmrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrshgrnhguihhfohhr
    ugesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrgh
    druhhkpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohep
    ghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhope
    hnihgtohesfhhluhignhhitgdrnhgvthdprhgtphhtthhopegrlhgvgigrnhgurhgvrdht
    ohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehrohgsvghrthdrjhgrrh
    iimhhikhesfhhrvggvrdhfrhdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhv
    sehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:dsXEZvTq-dKl0lHys-_p-n7a9nMxhxbzi4iAWVPcngckaFzZilkNMQ>
    <xmx:dsXEZguuU9O6deysSeuR5eh-pGeZ0niR4EO71DH1rKczmXtrRvOjmw>
    <xmx:dsXEZgfBZmEnkWq5T4Z0mzs84wxYiqDwevvMkiRQS1oXaXUVJEfdzg>
    <xmx:dsXEZk0Wh0_Pts4MK2CoQ3Ud9neqA7_jVdYlEq89y1k1F5hzP0ZEww>
    <xmx:d8XEZhtXFSrnVvDvhy8nN-Jczcl9jszmuXz26pvi1AtXyeeSZ2XQx5ba>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CB64F16005F; Tue, 20 Aug 2024 12:33:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 20 Aug 2024 16:33:27 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Richard Earnshaw" <Richard.Earnshaw@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 "Linus Walleij" <linus.walleij@linaro.org>,
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
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>
Message-Id: <80c0dd7d-6b4b-40ae-a4f4-09bb890ba26b@app.fastmail.com>
In-Reply-To: <5c7f9469-78ad-4092-8e93-bfb41028ca34@arm.com>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <e19821dc-01b8-4801-88ce-4c33d1a9fd63@arm.com>
 <8f8c07c6-d138-491c-9ca0-72f82779b2d2@app.fastmail.com>
 <5c7f9469-78ad-4092-8e93-bfb41028ca34@arm.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Aug 20, 2024, at 16:58, Richard Earnshaw wrote:
> On 02/08/2024 16:12, Arnd Bergmann wrote:
>>>> === iWMMXt ===
>>>>
>>>> I'm not aware of any remaining users for iWMMXt, and we dropped
>>>> support for ARMv7 PJ4 CPUs (MMP2, Berlin) already, so the
>>>> only supported hardware that even has this is Intel/Marvell
>>>> PXA and MMP1.
>>>>
>>>> Dropping support from gcc is probably a good idea now,
>>>> it is already unsupported in clang.
>>>
>>> We marked iWMMXt as deprecated in gcc-14 and will likely remove support 
>>> in GCC-15.  We expect to continue supporting these as Armv5T cores, but 
>>> not the iwmmxt (or other XScale) extensions.  
>> 
>> Ok, good to know. The kernel doesn't actually have a build
>> time dependency on gcc's xscale or iwmmxt support aside from the
>> one assembly file we build with gcc -march=xscale.
>
> I think you mean -mcpu=xscale (-march=xscale isn't recognized), or 
> perhaps you mean -march=iwmmxt? 

We currently use "-Wa,-mcpu=iwmmxt", sorry for the mixup.

>>>> === big-endian ARMv7 (BE8) kernel ===
>>>>
>>>> This is very different from BE32 mode in making more sense
>>>> from a kernel point of view. In theory any ARMv7 hardware
>>>> should work, though a lot of drivers are buggy. I am not
>>>> aware of any actual use cases, though in theory it can be
>>>> helpful for testing big-endian userspace when one has
>>>> access to Arm hardware but no other big-endian machine.
>>>>
>>>> We should probably keep this a few more years in both
>>>> toolchain and kernel, unless it starts causing actual
>>>> problems. I don't think anyone is testing it any more
>>>> though.
>>>>
>>>> Side-note: netbsd has a armv7+be8 variant, so clang will
>>>> likely keep supporting be8 even if gcc ends up dropping it
>>>> in the future.
>> 
>> Do you have any comments on BE8 support? I would imagine
>> that having two (mostly) unused big-endian targets in
>> the compiler still complicates things a bit.
>
> The compiler/assembler largely treat BE8 and BE32 the same; the linker 
> then byte-swaps the BE8 instructions during linking to generate BE8 
> images (this is mostly why we need mapping symbols).  That won't really 
> change if we drop BE32 support.  So I don't think we gain much from 
> this.

Right, makes sense. I can never remember the way this is
actually implemented

>> Ok. I can certainly confirm that we regularly run into
>> build problems with -mabi=apcs in the kernel, usually
>> because of the incompatible structure alignment rules.
>> If binutils are dropping support, that also means we will
>> eventually stop supporting it in the kernel.
>
> This is primarily about the arm-elf (as opposed to arm-eabi) object 
> file format, -mabi=apcs doesn't change that.  There are some options in 
> gcc relating to the old APCS that I'd really like to get rid of (in 
> particular -mapcs-frame (aka -mapcs)), but that's a separate issue.

I think I mixed this up as well, what we use for OABI kernels
is "-mabi=apcs-gnu", which creates an "ELF 32-bit LSB relocatable,
ARM, version 1 (ARM)" OABI  file instead of "ELF 32-bit LSB
relocatable, ARM, EABI5 version 1 (SYSV)".

We still use "-mapcs-frame" whenever we enable CONFIG_FRAME_POINTER
(aka -fno-omit-frame-pointer). Frame pointers used to be required
for a number of things in the kernel, now there are only two
places that don't work with the modern unwinder:

- CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE -- this should
  be on someone's TODO list, no idea why the implementation was
  never completed for this.

- OABI (-mabi=apcs-gnu) kernels, for the in-kernel stack unwinder

Neither of those is particularly important I think, so deprecating
-mapcs-frame along with -mabi=apcs-gnu for new gcc versions should
be from the kernel perspective.

I'll also send a patch to make both OABI and OABI_COMPAT support
depend on StrongARM, based on the earlier discussion. That way
dropping StrongARM (but not armv4 or fa526) in the future will also
eliminate OABI and nwfpe.

       Arnd

