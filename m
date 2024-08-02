Return-Path: <linux-omap+bounces-1829-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F264946002
	for <lists+linux-omap@lfdr.de>; Fri,  2 Aug 2024 17:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2D141F2262E
	for <lists+linux-omap@lfdr.de>; Fri,  2 Aug 2024 15:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C53B2139C8;
	Fri,  2 Aug 2024 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="NyApQ1Bi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HqmUAiK3"
X-Original-To: linux-omap@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219EB1F61C;
	Fri,  2 Aug 2024 15:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722611557; cv=none; b=FsxyVfUqAL7e5n4o39aStytIoyzwk1OM9Q6PlDl0R0had9SDwOp9eJgRlkCeWynWwD1nw2tsFQFq4+qX9ujqjuWE/ymKs6qT/xkf7eIxBF/QAWwyaxdHOz0EgHOpLyVO81WiMeLh7/ljSXuOw6QzXhvSA1TilocreGF5Yz0RdEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722611557; c=relaxed/simple;
	bh=W3wC7Ikbkwi/Pgp0kqDiZgPvH2nay3XrVIOwwdKUw4I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=AOZyfTwzLF/h/5taVzFyrGB31m5H4GlC45zccvPEafh+qqK8BS6IwvnTBbhl3+rw2/C6XtuBq0c0GiuWxswqjUP6CPHbncrz8j2pMnJnL8y2eNeo27BTE2dGXuXxSvKXnKUAzK+1KKdfJCO3voIMJFdWrVoupRmPwA+qLvRHrFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=NyApQ1Bi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HqmUAiK3; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6B53E138822F;
	Fri,  2 Aug 2024 11:12:31 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Fri, 02 Aug 2024 11:12:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1722611551;
	 x=1722697951; bh=rxwcyT4FiQZfyMKXPhPP1+sJGwFMbXH2xa6spGjudeE=; b=
	NyApQ1BigbVEecF8OOYW2csf4GZoK5pN0ZLjKxIuR+flxlgFOYZoFPQL/i3zGwjH
	h3wnN1+bs26Og3JJDCwbqQIiHPJMnuJsqdE33Et8EyjWYhNQRZ8MhmLre9ZdXnPZ
	HomyI+ZpBEklZCNQ9Yk6LPZoO05T5OTdWBmtUtTbikilRjXWcrk0690qrUUYvUid
	9l5bBcUXAS2IqE7+ZRm1CSrAzlf+7uIn7aV71127/lmljbt+VBiu6AnOW12DuGXP
	UXsKxHgPjfJ1uzDPVY0h6ZAgKgB1KoQrhmqmxTDL2R+8XdGI8QM+k2R1UtkmPAGq
	hV6hh56XVU6Vhm9uAgdacg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722611551; x=
	1722697951; bh=rxwcyT4FiQZfyMKXPhPP1+sJGwFMbXH2xa6spGjudeE=; b=H
	qmUAiK3ncBPYWcQK/GsGNbNb7cj8qK1Ys8E80EQXq4019Xqkt7rJ3Vdv01rYQYCN
	6FrHa5XcWcKE1d4IazSSsrNVBLiA7fIcj8n1yhbOUlAUgpoUXyE5astYqieaQ/Mf
	J2yGQbL/UFBdObn2ITMHw/qW5wpNG0uQXXjWivFxD/yqfCQljjGmr3dk3RDL/uiV
	OZYtRKRWuSyhzCmyzyELTrq1fOVmIl4dwJyjs7SjrF7xhFMeki6xQxShFPxXnsr1
	DaG3hI/WWRCZ7e5/Cq+5596IbPZx9mRwktf4BlOQK+ue/vqXsJ660PCDDjl50bbX
	y5YrsGE/exD1ky/F9Z9mw==
X-ME-Sender: <xms:XvesZphaaqrP9UicW7fKe3vTBm6xSgiS7QtBp1hna1JGgtMe9FbK_Q>
    <xme:XvesZuA-w7gCKwbOtrY_9_Z58_SU9dvx9yz2umX58yCOBd4ttG0umQ4d7peb7ywf8
    wIZ128yqACyIt6PGfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkedtgdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdv
    ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:XvesZpFdf0Ol8Hdln3kfVekYI9z4j3THnm8vWoPOGdFEWDLXXG-9JA>
    <xmx:XvesZuSI2m9tkgFlgarWgQhTbWeab-z1ZVm_0dcE2qnaHoyrkekznQ>
    <xmx:XvesZmzlfB0lD1iv1Eo3L_37RhBDfE4DjkyAZ7e8cUWNUUd20Dn6gQ>
    <xmx:XvesZk5Tw2yEfpbTxyQ7k57tfIeBpoalF6StOq7by5R7Bv5t0zBmRg>
    <xmx:X_esZjhcoUfk0XhfcbjVViWDP_T6n3KiWVyucBwkU1dAM234aJsfbNso>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 45F37B6008D; Fri,  2 Aug 2024 11:12:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 02 Aug 2024 17:12:09 +0200
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
Message-Id: <8f8c07c6-d138-491c-9ca0-72f82779b2d2@app.fastmail.com>
In-Reply-To: <e19821dc-01b8-4801-88ce-4c33d1a9fd63@arm.com>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <e19821dc-01b8-4801-88ce-4c33d1a9fd63@arm.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Aug 1, 2024, at 16:15, Richard Earnshaw wrote:
> On 31/07/2024 18:29, Arnd Bergmann wrote:
>>   This is used for both StrongARM and FA526 CPUs, which are still
>>   used on a small number of boards. Even the newest chips (moxa
>>   art, ) are close to 20 years olds but were still in use a few years
>>   ago. The last Debian release for these was Lenny (5.0).
>>
>>   Dropping compiler support now would be appropriate IMHO, and
>>   we can drop kernel support in a few years.
>
> This is good to know.  The lack of Thumb (particularly the lack of BX) on these
> CPUs is a major wart we still have to handle in the compiler.

See also my (too long) reply to Linus Walleij. He thinks we may
want to support ARMv4 a little longer, but hopefully we can reach
a consensus about how long exactly.

>> === iWMMXt ===
>> 
>> I'm not aware of any remaining users for iWMMXt, and we dropped
>> support for ARMv7 PJ4 CPUs (MMP2, Berlin) already, so the
>> only supported hardware that even has this is Intel/Marvell
>> PXA and MMP1.
>> 
>> Dropping support from gcc is probably a good idea now,
>> it is already unsupported in clang.
>
> We marked iWMMXt as deprecated in gcc-14 and will likely remove support 
> in GCC-15.  We expect to continue supporting these as Armv5T cores, but 
> not the iwmmxt (or other XScale) extensions.  

Ok, good to know. The kernel doesn't actually have a build
time dependency on gcc's xscale or iwmmxt support aside from the
one assembly file we build with gcc -march=xscale.

>> === big-endian ARMv7 (BE8) kernel ===
>> 
>> This is very different from BE32 mode in making more sense
>> from a kernel point of view. In theory any ARMv7 hardware
>> should work, though a lot of drivers are buggy. I am not
>> aware of any actual use cases, though in theory it can be
>> helpful for testing big-endian userspace when one has
>> access to Arm hardware but no other big-endian machine.
>> 
>> We should probably keep this a few more years in both
>> toolchain and kernel, unless it starts causing actual
>> problems. I don't think anyone is testing it any more
>> though.
>> 
>> Side-note: netbsd has a armv7+be8 variant, so clang will
>> likely keep supporting be8 even if gcc ends up dropping it
>> in the future.

Do you have any comments on BE8 support? I would imagine
that having two (mostly) unused big-endian targets in
the compiler still complicates things a bit.

>> I would propose to leave the feature in the kernel but
>> make it harder to enable by accident, changing the default
>> for all targets to EABI and adding a dependency on
>> 'CPU_32v4 || EXPERT'.
>> 
>> For the compiler, I think removing support for -mabi=apcs
>> makes sense, unless there are non-Linux targets that still
>> use this.
>
> Gas 2.43 (finally) drops support for the FPA and Maverick. gas 2.44 
> may well drop support for OABI binaries (arm-none-elf, as opposed to 
> arm-none-eabi).  Support for these is probably buggy now and it is 
> certainly making maintenance more difficult.

Ok. I can certainly confirm that we regularly run into
build problems with -mabi=apcs in the kernel, usually
because of the incompatible structure alignment rules.
If binutils are dropping support, that also means we will
eventually stop supporting it in the kernel.

>> === NWFPE ===
>> 
>> Russell had a patch set to remove this 11 years ago,
>> but ended up keeping it. This is fundamentally tied
>> to OABI userland, so we'll likely need to keep it for
>> as long as either OABI or OABI_COMPAT remains.
>
> See above re FPA removal from GAS.  GCC removed FPA support in 2012!

Right, for us this is clearly only done for legacy user
binaries. It is still possible to run an OABI Debian-5.0
or older rootfs with a new kernel, but there are not a lot
of reasons to do so, other than ARMv4 (StrongARM)
hardware. The only times I ever tried using it were
to test kernel changes that impact OABI syscall handling.

       Arnd

