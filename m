Return-Path: <linux-omap+bounces-587-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F838546EC
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 11:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 958661C26193
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 10:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960D017584;
	Wed, 14 Feb 2024 10:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="kUuVyA1D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jzxrEYpE"
X-Original-To: linux-omap@vger.kernel.org
Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A0217580
	for <linux-omap@vger.kernel.org>; Wed, 14 Feb 2024 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707905712; cv=none; b=Oxb1RtH4snIG7BwLHluex0SKIVzZqQJS2S6pjFWXtROxYs7AbDmuJ+/zCe9SW7NQNrfun8ncVyuDcUCg/Zqai3qXsEJPMz4Jl4mb5wwlBnBV24TKikV1As2LpSjmZb4ZXPRCf6mfIsVF9b7fJcJ3b+uBEkQuu+TXLPTHUiWiSZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707905712; c=relaxed/simple;
	bh=gnQZAjCFXADNik7pMkm9IZya4cKYcfL0kpjA4rBTYmY=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=BfrTroIPTKEWrTXc10Sf2wMBZRlPW0JF6aAL0f66iOo4IBTr1JyNCrOLxwsluJp+RhVePVbhpZoSXkKsAimmtbeDGEkAZIvb/jyUiyKTYDQbNwJT8cQqaFiI7cf1UfMpikdFDG6+8JBUHqincUyXyeeoDe8Jk1YNZsStlF1Zok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=kUuVyA1D; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jzxrEYpE; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 5D112180007C;
	Wed, 14 Feb 2024 05:15:07 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 14 Feb 2024 05:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1707905706; x=1707992106; bh=9niqc0+7jc
	fr6QpSV2gwMi7IMeSeD3k5oJNJPRgDMYg=; b=kUuVyA1DVgx0CseVFwAQk+hQnq
	0Ro11/mex1DPr05qJjq9Q4M1CjlpW8orS3dQCv+zS7/HUjOHfBbRtV3IZ79YtBP5
	to+zRDJv0YxifaRuVnFGo0RnppP1ugno6TiHajVl885lBW9u4DVfQ/FFWKgY4TG+
	Rn8JHfMT/mWU/5Zu3lrCezJE1Kqa/DJNX8PkUumjc3kZPJsuzd/dMhG2D7xxHWY2
	gjfNPEFWob90ZDSssBGsx5BZyPrjI7mzYt9jqYrwPKoVt/i+3/Mm4WwNyvx4VovM
	AL+wNe+34JGEEv+8NSSyxuQDmNNRy/HAtrf+XNfAUEBVqnAYQ4qevuiXEIjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707905706; x=1707992106; bh=9niqc0+7jcfr6QpSV2gwMi7IMeSe
	D3k5oJNJPRgDMYg=; b=jzxrEYpEo7MDlfdkoE+amVNkU1MBHBdkdty7FY6H1T/O
	rHG6r12j9gdgMVJtPq655H6qLhXjwss7ZZdkY2tRz1Unm03034YZEAqq45ytutGm
	2CxdjXur4fNgqMMcmuBtG+/Uzto3ugmYK4Oo67r1cFXTW3pAk1v//4wjuJ5duqrX
	X/vyEiE+CNk2tokz1qhXqHBXN8DcR3h55u7OOSOJrY8DoJQ0O9BRRiRLtpvAWhqW
	4JwkLLcBGn8rNhE3qoqbKm6rdVeUKdgPbUGjZP07iNmYlRmQQSKnnw9G+n5FBzjJ
	s4eDv0YS7yzyPZzSsA6Z2Yzlyipeu/uvs5Ey48e0nA==
X-ME-Sender: <xms:qpLMZYM2eLrUj4vc6T403X8fYyIaEo-BRf-hA5nBzBndkK12732Shw>
    <xme:qpLMZe8D44gh4elff_N-rDZqnd3QQ7OE9-SiPUM5K69NI6B1byblnFQiwhR6Qn72O
    3bo5FdFSDEjqP7aEaE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:qpLMZfS-5RdMOF5ujr2db6muCyc2v4pld-c5mJwghU7w--YEY6-Hug>
    <xmx:qpLMZQvyNHzXxUaMaZn_Lqo1AKr1zTDJqpFdugaXRkjgE5AcstiWNw>
    <xmx:qpLMZQe1aFzghPLXipPbr1aJ-mPM0vHA_PA2TpIldC47uHzLMtHLWA>
    <xmx:qpLMZTtKb06vWpgU3Dbrpusv7dDJxFVihcVef0o3GyectOIdqgqSeyHoims>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0C7CAB6008F; Wed, 14 Feb 2024 05:15:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <7daf3998-0c0c-4e21-bec7-cfb9560deaa9@app.fastmail.com>
In-Reply-To: 
 <CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
References: 
 <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
 <CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
Date: Wed, 14 Feb 2024 11:14:44 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linus.walleij@linaro.org>, paul.eggleton@linux.intel.com,
 "Andrea Adami" <andrea.adami@gmail.com>,
 "Dmitry Baryshkov" <dbaryshkov@gmail.com>
Cc: "Guenter Roeck" <linux@roeck-us.net>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 "QEMU Developers" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "Marcin Juszkiewicz" <marcin.juszkiewicz@linaro.org>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>,
 "Daniel Mack" <daniel@zonque.org>, "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Stefan Lehner" <stefan-lehner@aon.at>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine types
 (pxa2xx, omap, sa1110)
Content-Type: text/plain

On Tue, Feb 13, 2024, at 22:21, Linus Walleij wrote:

> The Collie is popular because it is/was easy to get hold of and
> easy to hack. PXA was in candybar phones (right?) which
> are just veritable fortresses and really hard to hack so that is why
> there is no interest (except for the occasional hyperfocused Harald
> Welte), so those are a bit like the iPhones: you *can* boot something
> custom on them, but it won't be easy or quick, and not as fun and
> rewarding.

The PXA machines that we support in kernel and qemu are either
industrial/embedded machines or upgraded versions of the SA1100
PDAs (sharpsl), not phones.

OTOH, these chips came out between 2003 and 2007 so I can
also see how people at the time had already moved away from
using pure PDAs to Symbian or Blackberry phones, so there
might just be fewer PDAs that got sold with PXA than with
SA1100 before there were smartphones.

      Arnd

