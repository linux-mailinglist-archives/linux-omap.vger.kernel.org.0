Return-Path: <linux-omap+bounces-1921-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C86C59564D2
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2024 09:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EBEA2813CB
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2024 07:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CC7157E9F;
	Mon, 19 Aug 2024 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="RWFaWCVd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XuAcUDpE"
X-Original-To: linux-omap@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C627B14A605;
	Mon, 19 Aug 2024 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724053246; cv=none; b=Ta9z6mf65zreyvjC12H87+uWtecp/yyk0Q2DYZJ96DvPWVgUQbZjwCbvplXtkCRBhgBX6c4ZzX0UFxR7QO7/iB7V0sqKMUbhr05l4zhWZLK/uXCCYp2+KwxCd2Lr/cr/VTrE+Qupp4riSVwyNbS5pBX5eqGnL0d99bxTNChVzAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724053246; c=relaxed/simple;
	bh=5C6hi9jVni636FVTIqqwW0CM1paMDr5oiHPxcLE6rcY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=E610XT72w5QxtFygsjnQMCLxGUfgoitAoqtg+4PPa3tl+usrAUDLEPFmeLJkbI5h7X5R0nQloljQZzlDpIjpKN8KQNmUSgEx9fo60rrl12la8RGSavg+HooZXu15EyGkkogeMECaVXi98Hoo5j8KYQK8y3Xq8sPpax76Zn4kPlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=RWFaWCVd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XuAcUDpE; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C84B7114EA2A;
	Mon, 19 Aug 2024 03:40:43 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 03:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724053243;
	 x=1724139643; bh=5rOgtNXqnl/XTtdpDxQ7vxXNP5y5q63LBK60m42hBYA=; b=
	RWFaWCVdotq7usC8JKB5/ooUKrFWEMHvhs9+ek41MUU/PZnvHgSJwI5iYtSKRvf+
	SRijzroUudyCNiGFU0eO0Ehc4P82tb32uiMk2xd3v08qd1PjeXa30aFH5uEpgsyz
	8f52fDI6XvjOn7rwMlAi+j16lOvSikYCXfH2vVqOmmxJvb6Vh8rSsQyVUzBq/5ld
	0QRKk4he/k3swJoIqA/kZ1eeIV5nV0CNq2T7XuIMgd/eFHNirQi6bpgGQwJcinIm
	KR5dtZnm5XbudgEeGnGZ6E9F4lsnm0vJM8L38c39xM5FTRU+ZXlw+K1IKsWFFQWR
	5TYH7T1n+gKcV69Jw1NeWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724053243; x=
	1724139643; bh=5rOgtNXqnl/XTtdpDxQ7vxXNP5y5q63LBK60m42hBYA=; b=X
	uAcUDpENxX3JeOBw3ghu3j2zTTh8HI3ttsk312poqBYDZVgB5JIreUdXj0LpCL9n
	TQQvuRhAApUxltOolJuK2U0eekO9X2fE4ntnUbyyOSG38vNLew3wT/Jgt/qZwSTO
	/rSZM9Q6+dessLRYdJrGgXAleCTYK3ZbIXXMuBSMIkIEAysW/kOpTUiZFhCrOGK1
	FqiFpSPhI090DIaLw+os9Gw728TlbkYIwc/PobrSMSiQSfo9D+GDiZt/d7Ksg79Z
	1+evdzrmTMUyu53tpWDR9U92mAC4ALfZDMsY33oPHxIwdSgjUfUGPlNZDpX8c0Pt
	m4pbEJFRA7JhL6abaMRuA==
X-ME-Sender: <xms:-vbCZknn1GfGbKx7_1df5aEvDlDW_s9xkUhyQlddmArQn-l_8zzwwg>
    <xme:-vbCZj0stErkO9lplvqUoCmG9FNY90ez3JPxbY4k9oeVqQH1pDI1srlhK5arzsTx2
    hGuUGjCk8N02CORtbk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddufedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeevfeelhfelheekleeggefgjeeljeehiefgteev
    feetueeihfekgedvieelhfdugeenucffohhmrghinhepuggvsghirghnrdhnvghtpdhlrg
    hihhhurgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvjedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtoheprhhitghhrghrugdrvggrrhhnshhhrgifsegr
    rhhmrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrshgrnhguihhfohhrugesrghrmh
    drtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhr
    tghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohepghhrvghgoh
    hrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnihgtohes
    fhhluhignhhitgdrnhgvthdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvg
    esfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehrohgsvghrthdrjhgrrhiimhhikhes
    fhhrvggvrdhfrhdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrih
    hlrdgtohhm
X-ME-Proxy: <xmx:-vbCZir8EVT-NEhPrM456o9YtVwjX4tVHQvn3BqnzDtH3fenZUO8FQ>
    <xmx:-vbCZgmG0Rt_S4U8j7zMWNJrcFjCeuE4g7Hd3A0D_wwyVGwU8LeHGg>
    <xmx:-vbCZi3sMbGBlcxtde0P8ut_c_sbypjpeBWtOFNuvg7iTCAl6COtZg>
    <xmx:-vbCZnuZ1IyXddqtZznd53gK8LP7yOT5cH439SNqBSHzM8w7LdR_eQ>
    <xmx:-_bCZmLqs-nTReoqfIKEPTaXlq3iafuMGqEncmxBUIjssGNEViHiBUrl>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5F01A16005E; Mon, 19 Aug 2024 03:40:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 09:37:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Matt Turner" <mattst88@gmail.com>, "Ard Biesheuvel" <ardb@kernel.org>
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
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>
Message-Id: <edb61f55-da54-4015-8f09-178a6644c2b0@app.fastmail.com>
In-Reply-To: 
 <upt52224svue5ozyacrzm3qcavkcz7kojyi2yajoqb4y2pgffo@cy437r5ipdbm>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <upt52224svue5ozyacrzm3qcavkcz7kojyi2yajoqb4y2pgffo@cy437r5ipdbm>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Aug 15, 2024, at 20:24, Matt Turner wrote:
> On 07/31, Arnd Bergmann wrote:
>>=== iWMMXt ===
>>
>>I'm not aware of any remaining users for iWMMXt, and we dropped
>>support for ARMv7 PJ4 CPUs (MMP2, Berlin) already, so the
>>only supported hardware that even has this is Intel/Marvell
>>PXA and MMP1.
>
> pixman had [1][2] iwMMXt paths that I optimized for the XO 1.75 and
> would occasionally test on a CuBox over the years.
>
> I'm surprised to see that commit b9920fdd5a75 ("ARM: 9352/1: iwmmxt:
> Remove support for PJ4/PJ4B cores") landed with the claim that "there is
> no v6/v7 user space that actually makes use of this". A quick Google
> search reveals evidence of usage [3]. It doesn't seem like this should
> have been backported to the stable branches in any case.

Sorry for missing this one, I'm sure I spend more than a quick
google search trying to find instances of this, but clearly didn't
see this, and I now see that pixman is the only package listed in
https://codesearch.debian.net that uses the compiler flags.

I'm still not sure how your version worked on ARMv7, was this before
or after the move to the hardfloat ABI? What I see on modern armhf
gcc targets is that they reject -march=iwmmxt{,2} because those
imply armv5 without vfp, while armhf toolchains require vfpv3d16
as the minimum fpu.

My guess is that the pixman code still works correctly for softfloat
toolchains, but the meson.build check would fall back to the vfpv3
version for armv7/hardfloat builds.

gcc also rejects "-march=iwmmxt2+vfpv3-d16". While it accepts
"-march=iwmmxt2 -mfpu=vfpv3-d16", I suspect that this combination
has not been tested well.

> I know that ffmpeg used to have iwMMXt paths as well, but I believe they
> were removed a few years ago.

Right, apparently this was in 2012:
https://gitlab.laihua.com/linshizhi/ffmpeg.wasm-core/commit/363bd1c62c1bcbac2dcb56f3dc47824f075888d2

   Arnd

