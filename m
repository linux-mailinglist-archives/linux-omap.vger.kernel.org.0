Return-Path: <linux-omap+bounces-4112-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F5B0E4F4
	for <lists+linux-omap@lfdr.de>; Tue, 22 Jul 2025 22:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65FED56845C
	for <lists+linux-omap@lfdr.de>; Tue, 22 Jul 2025 20:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E65285406;
	Tue, 22 Jul 2025 20:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Rd52q2Bf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HKrle+RS"
X-Original-To: linux-omap@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401D927CB04
	for <linux-omap@vger.kernel.org>; Tue, 22 Jul 2025 20:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753215966; cv=none; b=f2red7r+lHmQcI7gJxdMmmT40kO3sRo6KsK9a9peAr+J1KlRwKvieHlaiVsdccf+ZmWs9IisSQ6vg6Tt5ef1zgYo74/81UVruWtBmP1mJw/9YVOHdwW8NXJIe+eJrzz/7rYs4D2uuA5FLkXvrWeID17auM5WfFNuOwKXNGm3B08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753215966; c=relaxed/simple;
	bh=W/bAgLR8ME2Pde2JaM5U+DcHtwE1H3uxp+kz01tcaag=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mNuSag6Oy/Z/3k27rg2ZmSyRIp8o8jftS5IyXhzRVzu+uNEMDYng8sHv2V3K6FVSNlZIli4T84NeIkvrOzwgBQq6ObktxLnKQhFxYaEtEUgVKQwe8FEeous+olxq3NpTegPyufaIpqDdKhqN8h6PxTEAnbBUrnNzILjDk4QwN5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Rd52q2Bf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HKrle+RS; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 755BDEC0496;
	Tue, 22 Jul 2025 16:26:04 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 22 Jul 2025 16:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753215964;
	 x=1753302364; bh=MPEMmEf06EwqkDHW4zrUmLX7eAmlPmYFpIvUGPbMw7U=; b=
	Rd52q2BfCL9/WIb19/Ysv8UGZ9WK2HNVOX2Ey9x/s0HqweP0jYNyn7Q30j86Jyz/
	7CF70njPB9GVR2qrqGrUkTYROhK+krc25ZRhpKhKkS6owDpiws1xKZyJ0WKaNoH9
	4iem1FH9Ip488NgaR/BtEV6IBdx/6lqO7G0VKV0TvvGfUmt3HXIM6tG+Rbm/MPZh
	QZBeHHDR2pN9csn7aHzlCbRRAnsFZbCi++sePtC3X3Fx4Y/wsnv4skNZXwzNpuPz
	uW/lWbyLzhhxLb1RRN5isACPfh1C8MJyDky8jbssKZLBbzn1r+TjG/oTJxMDUuWO
	x13cnNR7lYq+nRftU9QlkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753215964; x=
	1753302364; bh=MPEMmEf06EwqkDHW4zrUmLX7eAmlPmYFpIvUGPbMw7U=; b=H
	Krle+RSR9rlUkkLlbsHvYazh9bnORgBW3Ptun03Rn8DBtmu+7qLuWz6Ec+2sIkdf
	ftWm14RvJCnVNhnvi07AzQ5HTa8PEV2qbt/E6gpMIc7+rfrYMZxHlmTEDqMU0mMI
	sWMFaKdwa8cvkV3Ji82GEld4Jf9NZIbp6qCkko5/95INV0rmvctHoQ+okzmehnuD
	W66mPIs7+MXhzkRA60xgC54gz9/xlq9I6Rs8sGXwHcgZCykp+MtjJlcDr4Dz5k04
	bJJNX9WlrQs7DUFNOCyM39OJSUiMprnGz8eVG8cGrWKys2Vkj5sp7qeABaq66hX9
	VwF1pOWEnv8eMqHl1lp4g==
X-ME-Sender: <xms:2_N_aLPMzpfikfdmv8xVlSV_TZCO10pf9ZZhU4ol_6YTuEryAy-4lQ>
    <xme:2_N_aF8W8KVR9sO-aPd2MWLIKJ7ViLWGroBdfazZtkhU5JCUfOXN2KT3ex_2mWyst
    l4f5j6bXGnhpacXIto>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejheekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhope
    hlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    eplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3PN_aHM83_J50gnp6V0Ph2bL-JK6lWO6KCToQpcVUH8rbOLRg9n4XA>
    <xmx:3PN_aNehchB_5QVS6ARKphS_Iw4kAtWBO3j03SKen2C5-0Maoy_vXg>
    <xmx:3PN_aMs8Cyj35T7ZtPmy6o1_AT-4tXY_PkLx2RxcbMQ2kIwOxwJ7ow>
    <xmx:3PN_aGkBoW_i_fcRJSZ1L-Zhnq5OSPdONC4bhAHEsH5bF2p_jHIh_g>
    <xmx:3PN_aBZiQD9s7Pi5XJvKPPmXagN2SE7nx7sN9pA2iYeFlXiKuQU9JC5Y>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E0A63700069; Tue, 22 Jul 2025 16:26:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T977abbae7a5b9ff8
Date: Tue, 22 Jul 2025 22:25:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kevin Hilman" <khilman@baylibre.com>, soc@lists.linux.dev
Cc: Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <42241d2a-bf66-4ef0-a083-b0d4f0c3f9b2@app.fastmail.com>
In-Reply-To: <7h34b4xcxb.fsf@baylibre.com>
References: <7h34b4xcxb.fsf@baylibre.com>
Subject: Re: [GIT PULL] soc: OMAP updates for v6.17
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 10, 2025, at 17:50, Kevin Hilman wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
>
> ----------------------------------------------------------------
> Kory Maincent (2):
>       arm: omap2plus_defconfig: Enable TPS65219 regulator
>       arm: multi_v7_defconfig: Enable TPS65219 regulator
>
> Li Jun (1):
>       bus: del unnecessary init var

Unfortunately these are changes that I really want in separate
branches, for defconfig and drivers respectively.

Since all three changes are trivial, I ended up cherry-picking
the commits to where I want them. I hope that's ok with you,
let me know if you need the stable commit IDs.

     Arnd

