Return-Path: <linux-omap+bounces-1836-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E1E947BEF
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 15:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 270BB28273B
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 13:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BC92F874;
	Mon,  5 Aug 2024 13:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="vmSbAT9X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rnZi/E8P"
X-Original-To: linux-omap@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AAB24B29;
	Mon,  5 Aug 2024 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722865085; cv=none; b=SzBtXx42OjZVGk3at10oVGBILbOAjNuQqYkMJE+jSgBvUPPnLJKQAblTjAKkChKYLKAepC2eypaSQD9p7mzDojngXEfTKzy4UIbXXfEUloeO8W4HWRe6dE49wavsoB7tk+wK/kt+0RS9O4pGxl3wo95HFo57QSZ5TCJ/9MQXpp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722865085; c=relaxed/simple;
	bh=uFldj6qUVCej+JdtYmdsx1hKFbZYzXr1fL2QxzwwoI4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YLEFhvtRSeqiPAxdL6wgR+CX3PWfHtNG6zt8DWDtzXA4WDUMmFyYXyJQZ9bDWQfjbOf4QAMJnSOVDfNoh13NGbfnIkBqpoqGeqeu6WyHvKkXJhI8OV6+VrCuduJyQ7Zm/JBMjbPYrqFPBGiyCPD96Ir5DhOzZ6cI1oVf/uMaek4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=vmSbAT9X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rnZi/E8P; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id DC1E61151B99;
	Mon,  5 Aug 2024 09:38:01 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Mon, 05 Aug 2024 09:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1722865081;
	 x=1722951481; bh=6FNRvRdqPMxYH148flW+90w5EFkoq4YHv2pLfv40G6o=; b=
	vmSbAT9XQ3YgIDeU7+AcK1Rv8NvIULbBFrL6GghxgXdjysQ/GllO/hKJ0MwiYu2v
	+ZqONJ2O2OT7fescPDDlFX/5Uarp9F3CQBUQxcMzU0HNzAlUz7cGIVvEtsLz2zUp
	0aaWVHcjhCqe52171OS3soeLka4VIGC1Dn9nAPsSnLAiYRD6E3s3bTTIla7+IJwv
	kO3+tWzvndCBvDhTilVm9aXQgn7tbP8Dh+TDO2XdisssZ7afhgfIM60AfUS7tF8i
	+eYY76Tb3/F6WpN4Kk8LHejHOz+CdnJd7RzfLNyD0J+3+XLtl3CdpbTe+rbrxwCe
	XDPQzEKMcWTI/8+6ADHdVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722865081; x=
	1722951481; bh=6FNRvRdqPMxYH148flW+90w5EFkoq4YHv2pLfv40G6o=; b=r
	nZi/E8P1oxPW2qYR8VlDqzWWqUlKFP1F3SXNsFS8rnbQBLVYmnIj8KkbQnsxP0RQ
	FBjKGP4pXls83tPtkLtCDm/iCbIu0D321oTqjp6UcpVB0DV+tOMK7GVePPB7z3bG
	ZyJ9CkxQPCPZ0H/K8O7k749LO/URep8ClsiF0PqFrgt5De9Drj4+/J0ljbMOoO2H
	z/QAVKot27GwrAxzHOwampqq+7MiDkvvOeuGyeJllP7ttHd0eXEXYuNJyXNfvQXQ
	JSex973Bx7ZKBZkZkixiimOOxAB0/MSU3We0aFS2/95yTf9/Fh7DbKbiS+uyfnre
	LW+M/SxrlFxOJ26mIzPag==
X-ME-Sender: <xms:uNWwZn-EFLxaoOhWeAWQ74g7dnpRctZnwPVyiQ_RtOEE0gpGC3jqmA>
    <xme:uNWwZjug0BLuq-8cdJUtwxYTbmv1ny6vYTKYyas4vp6qdp-NheC3hRunFmRCs-7OH
    OzKtIw2C5vNGu8L5Fo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkeeigdeikecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdv
    ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:uNWwZlCTjUpPdAwj4Jygs3lbWiC-OPG9ZMATbwDcOv9elMCxUW8QTA>
    <xmx:uNWwZjcFRWMnJJwIFcwXZOvIamYqagySX-rfLn8zu-e3NlptAPWbPw>
    <xmx:uNWwZsNmCgQXh7fW5jufQNXlpK9TpzzEwORl5sVOUyk-Na1PmKTNrQ>
    <xmx:uNWwZlmPa2cFjJQkAeJn2QnVXep_39jgJZNozvTpjnOlUtvjgvNt-w>
    <xmx:udWwZvhnO2swBmA0qpIC-3ql38TQj_u0uTac5skJBjTi5AFSQMES-YJQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A09FCB6008D; Mon,  5 Aug 2024 09:38:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 05 Aug 2024 15:37:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tony Lindgren" <tony@atomide.com>
Cc: "Aaro Koskinen" <aaro.koskinen@iki.fi>,
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
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 "Nikita Shubin" <nikita.shubin@maquefel.me>,
 linux-samsung-soc@vger.kernel.org, "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>, debian-arm@lists.debian.org,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>
Message-Id: <6aaefebc-c7b0-4b1e-a9ee-5621c3339bed@app.fastmail.com>
In-Reply-To: <20240805123003.GA5123@atomide.com>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <20240731191332.GB47080@darkstar.musicnaut.iki.fi>
 <ea475f27-af7c-4060-bff7-a78389174236@app.fastmail.com>
 <eb91d092-259c-4896-a06d-363c1a62712c@app.fastmail.com>
 <20240805123003.GA5123@atomide.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 5, 2024, at 14:30, Tony Lindgren wrote:
> * Arnd Bergmann <arnd@arndb.de> [240805 07:58]:
>> Thinking about this some more, I wonder if we should just
>> change the Kconfig dependencies now (for 6.12, possibly backported)
>> and forbid ARM1136r0, i.e. OMAP2 and i.MX31, from being enabled
>> in combination with SMP.
>> 
>> This would immediately prevent the bug you are seeing and
>> allow the cleanups we've been wanting to do for a while,
>> and it would avoid the larger-scale rework that I had
>> planned (moving armv6 into an armv5 kernel).
>> 
>> The main reason we didn't do this in the past was that it broke
>> Tony's workflow of testing omap2plus_defconfig across all
>> platforms, but I assume this all changed with the new group
>> maintainership anyway.
>
> Yes please go ahead, no objection from me.
>
> Also related, the 2430 support could be dropped as AFAIK there
> are no active users for it. It's similar to the 2420 support
> that n8x0 use, and only 2420 support should be kept.

I've taken a look at this, and my feeling is that we would
not gain much dropping 2430 since it has very little unique
hardware, except for a few files in mach-omap2 and drivers/clk.

Keeping it around as long as 2420 seems to be less work
overall, so I won't send patches to drop this one. If anyone
else wants to remove it, please go ahead.

While looking at 2430 support, I did notice that musb support
got lost in the DT conversion, which you mentioned as being
incomplete at the time. This does mean it's almost certainly
not been used for over a decade with an upstream kernel.

      Arnd

