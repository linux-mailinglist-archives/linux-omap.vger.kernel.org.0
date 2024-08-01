Return-Path: <linux-omap+bounces-1823-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0CB944740
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2024 11:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0F471F219DE
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2024 09:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678E285628;
	Thu,  1 Aug 2024 09:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="KBQuIeu7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WzOJvU1f"
X-Original-To: linux-omap@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146E516EBFA;
	Thu,  1 Aug 2024 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722502808; cv=none; b=FToLdrAeA2U8J8BppN7Td69c32yBelGZQ4/zyACofzZEwGwLK45iHrCPPAoXh4w3HZNrn3AS+Vgm76msL5UqoBR3WZDjZ6uJOWjZ6dvSKfh+fNnM8tYowfA2Gi8teqL+p6BO9sCxj8BObV8XUvERkb9FDjhk4wrd2SFbZn0dqxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722502808; c=relaxed/simple;
	bh=7gR8QdGOnkzXar3p8mbaR1p85zO26Xu3bN2OjMP1ka0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ttzwqx0nYjLP1o3yT0zkoM7D5zugNAjSDoajPXN9twfuZ4f6KymOJlyHS/uQJ1iumsc7tTcpsl/YGplRkDCzuhiTkH1avabB/QlJaYfbgxg4bkIP9+TgC2CwT+4SuDxwNhe1WxCdt5ry2FQTtettt9FMZXBjswLHV9no+bShP3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=KBQuIeu7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WzOJvU1f; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id F39B0138804D;
	Thu,  1 Aug 2024 05:00:04 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Thu, 01 Aug 2024 05:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1722502804;
	 x=1722589204; bh=4/QrqdukPXNhvxt49ojl7bM2Ny37HuFJq43m9HH4jxU=; b=
	KBQuIeu7GY9JcBpxIamRvGFgB2mknBLKV4RIZvKsAtV/vQvGmsWGx9cSilsLiRPF
	HQroSbgkN/iVPklpGrEInjvogVRA5wCwGbvowLXWtTk3DQaQ9B9KwRh+gZHSsdTh
	U+8EURiCtcg6gaY/5ScwwOiFVR47JsHncVTPInMjzW/yFwJWeeGdnOChHwkiL0MQ
	x0klOMVysSe22hiJuIEYN9xbHYLBtTqvOXi/HSxZct8RRR9Fcp8Ih19qQMEqAVPc
	kwXn+0Xu6NmVS/smsw/Al5DvZCRtmna/S/7wAs8lSBQjMJygXAgZHcitU/eRgWFw
	2Uc05xFdJAWoFxY7S3pysw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722502804; x=
	1722589204; bh=4/QrqdukPXNhvxt49ojl7bM2Ny37HuFJq43m9HH4jxU=; b=W
	zOJvU1fXp1RnEK+qP2756KliFcGXHzwy2x+4Oor/IE6gVztRjmQJuOTOOoOQ+PBW
	vGu2aAFsJqkf1OtV7ml59Y2u9zz07qAk74nOlecB78CnbUfuXIcYedTJRsZrKp09
	jX+scqGNsvbCq+btdfg2naSsFHvsO+K8jVgiELYcb14EEDjEFUQ+OTi+Jrd4iw+G
	lrypTPLwJsbldIGlxJVtYm0UapK/jHogKxcs0wJVITSpnSerl4LuPiuTPsJXIjV/
	sXye5fMOQVIT/xmNAHQ3ueAOjvEq1rXP75ZYQB2514zHKk4VzMa6YzDaOmjENXKP
	3W4NnggmPMaUo9mc0u4Mw==
X-ME-Sender: <xms:k06rZiiX6xnMsXDSAMtW5iI7IB3w1vIhtI7pkk1W2oUW7VxgW1W7yQ>
    <xme:k06rZjBo8wNoXfwLPAj0rKWbMbjQ0d4q1jfkY6X7AMeZbWBngu8-0hJWuBu0XHhtT
    t2hPupMzLsr45VqkIE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjeekgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdv
    ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:k06rZqHU3gFqUMCKAMIBmiBhB9PWtzRReM1bDPjQ-X75uBLg84M8cQ>
    <xmx:k06rZrSaOOaz1ZNknuSZjJnmN2kF6d6tpY6C2bTnBve8AXRoDOwMbQ>
    <xmx:k06rZvxaS9OI8En5MZzMQ5FrShaA6yn0LKtr9dZnyBy4VR0yyYRKcw>
    <xmx:k06rZp7BCpQ_h-koQnVK2GhkBFf-cyovTG5LDPLrTEzOBpBdJTiH7A>
    <xmx:lE6rZkib2YSJU4tTUeCz5lG6L9xcdQ0idbh14vMswZC8k0hwLfcToQld>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 761B1B6008D; Thu,  1 Aug 2024 05:00:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 01 Aug 2024 10:59:38 +0200
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
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>
Message-Id: <ea475f27-af7c-4060-bff7-a78389174236@app.fastmail.com>
In-Reply-To: <20240731191332.GB47080@darkstar.musicnaut.iki.fi>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <20240731191332.GB47080@darkstar.musicnaut.iki.fi>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jul 31, 2024, at 21:13, Aaro Koskinen wrote:
> On Wed, Jul 31, 2024 at 07:29:29PM +0200, Arnd Bergmann wrote:
>> === early ARMv6 ===
>> 
>> This is the ARM1136r0p in NXP i.MX31 and OMAP24xx, which in
>> practice means just the Nokia N8xx tablet.
>> It causes a lot of pain to support in the kernel since it
>> requires special hacks to support in SMP-enabled kernels.
>
> FWIW, I have been never able to boot N8x0 unless CONFIG_SMP was disabled
> (but haven't tested recently if the situation has changed). And probably
> nobody else is anymore even booting these with modern kernels. Common
> distro kernel support for N8x0 would be unlikely anyway due to bootloader
> and memory limitations.

Thanks for your quick reply!

I don't think there were ever any distro kernels with support for
N8x0 and other hardware in the same binary, but I do recall Tony
testing the omap2plus_defconfig across omap2 through omap5
successfully in the past, which is the main reason we kept this
as a Kconfig option.

The combination has always been a bit odd, and aside from the
problems with atomics and barriers, there was also the odd
ARM11MPcore cache handling that got removed in 2560cffd2134
("ARM: Delete ARM11MPCore (ARM11 ARMv6K SMP) support")

> These tablets are not very attractive for hobbyists anymore as the display
> support got broken and eventually deleted due to bitrot. There has been
> some out-of-tree patches/interest to regain display and other features,
> but no major progress really in 10 years or so. The last major mainline
> feature was adding Retu watchdog support that allowed the device to stay
> on longer than 30 seconds after the boot (the hardware watchdog cannot
> be disabled).
>
> I guess in OMAP-land N8x0 is one of the least used/active boards, so if
> it causes "a lot of pain" then maybe could be a candidate for deprecation.
> But with custom kernel config, the board has been pretty stable overall
> between the releases for limited use cases.

Yes, I think it would help a lot to deprecate it, at least this
would save me the work of moving ARMv6 into an ARMv5 compatible
option (I have done the patches, but they are entirely untested
on real hardware and probably incorrect).

Would the timing make any difference to you? I.e. does it help
to keep another year or two, or would dropping it in early 2025
be the same?

We'd also want to coordinate this with the i.MX31 maintainers,
since dropping both together is the only way to remove
ARM1136r0 support.

>> === OMAP1 ===
>> 
>> This is now the only ARMv4T/ARMv5 platform with no
>> DT support, making it a target for removal at some
>> point. Unlike PXA, there are still users, but it seems
>> there are no current plans for a DT conversion.
>> 
>> I would suggest going through the five boards
>> individually to see which ones we can remove in 2025
>> and keep the remaining ones for the moment.
>
> Here situation hasn't changed - all of the boards are equally
> important/useful, at least from a maintainer point of view. The routine
> I use to test/debug kernel releases relies on all of them.

Ok, noted. Since you are doing the testing, that at least means
we have a chance of cleaning up the code gradually towards using
DT. Dmitry has started a migration of platform_data towards
DT compatible device properties, which can be done gradually
for the 22 platform drivers you use. This unfortunately still
leaves the nonstandard dmaengine interface (for UDC), but we
can deal with that later.

     Arnd

