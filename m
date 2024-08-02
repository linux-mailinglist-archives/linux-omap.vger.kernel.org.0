Return-Path: <linux-omap+bounces-1827-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A83E945E25
	for <lists+linux-omap@lfdr.de>; Fri,  2 Aug 2024 14:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CB85283BBC
	for <lists+linux-omap@lfdr.de>; Fri,  2 Aug 2024 12:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E441E3CC6;
	Fri,  2 Aug 2024 12:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="EOrMRzlH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G4r8EcsI"
X-Original-To: linux-omap@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509281C0DEC;
	Fri,  2 Aug 2024 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722603312; cv=none; b=oyPmvHfXPALCPKIoJiXbk9FZCHImweQ8CK9W15eInIfcf607HAMYzHUzkyqZRe+T6lWzyqKXho1JEl7WFHaMDCMA2QNSaXK3Zg75qjJiu9LwzIN7zy9fcAcWzIgy5auYc4s5oM9sP/rAzhpB4Oj1oDduSPmIIXAtiVZ1gqXRBv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722603312; c=relaxed/simple;
	bh=9os/2jXyqk+ttPmhK5qIiMBlMnHVNxBlpDPZsLpQ2y4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hYvnxviGt3F1c//qs6UMLfhEBpihu0g67LMJ5t1VCi7kMBd9npns6LjRkKMl5b+PngQHGnTZR8mF/qPiqfptpRkSt1uqU4ezMCImikLBBm/S65vSOP4uuX1klNddHJ2NL4DXS7iAOwBGGOa01wI/ra9hXplEphfb5HrAfbumLxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=EOrMRzlH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G4r8EcsI; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 3D9071151237;
	Fri,  2 Aug 2024 08:55:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Fri, 02 Aug 2024 08:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1722603308;
	 x=1722689708; bh=TBCcUSaQ5lThj4uNYGKh2vJfdomWEW52A8I+K90Qqcg=; b=
	EOrMRzlHEcJ1u8dXOPRUjZ0ZqMOsKrxVHfj3T2YzpT8k/yDiWMP9esIgs/w0RW7+
	NlJ2KfbIgaYmwb73mvdQnZy2crIgXqiN6q8nzo1IJkLIS+dzw9euQyy4gyZ0W5h5
	scmSmjTlPPVNoK6cJIbLrliytb4837bgargETedsf9yFybi2twn2JdLInpJxYRF0
	rH5SmGq9rKe5CK/QPsQsYDxERAwDys43m5cr3OwY9/pN/8kLcxv8VZ5wwCxQ52Rq
	xOJxRsKssovVYdeIZAWRaLDOrOV217Uly9uHcFQJGa8q+1zl2ygN80YJCEnC63dT
	v5Q5A/KkiXvbmdv/j+P0KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722603308; x=
	1722689708; bh=TBCcUSaQ5lThj4uNYGKh2vJfdomWEW52A8I+K90Qqcg=; b=G
	4r8EcsIOy8srK+zDwsl2Smn1qaEKvCI3/91YJ/+PHPt70G5hucRlb+Ko1+WstYc3
	1DnkGW5mOV5/DrDoBjgkg646vUE72mCK6LfvCFiUjYiAcfcSAhF6dQNlCGAZzZtx
	GSC2uS1Xdvd5OX2cgycS8I9BJdTXI3m4QIQBiZOUiGGGKc0oPMnULNcWSdjlPh0P
	7U0z7CjrTZWtBnURyGRXcwaI6UW4xPM2Oqu8pULdR9Pqg8JSxSJ4c/IXMhaM4k8h
	SUjA27OlD7ZHoOgxlxp/OkWNHFGvaB6gtjfm/WJImR4dYB2g/+4QtRzZmMX++BM2
	pQ3MJFoQ48go2KPOW3mSQ==
X-ME-Sender: <xms:KtesZvJ-9vbTcdev-abYXfZIDgKfZxcnGTQD0koWhEHvjsr3F_r8tQ>
    <xme:KtesZjKVD8iNO8Sj1xVxvs3I1IiI01TCjEoOxBRq9WJ2ZcnGL5vGM6R76FBAgy0aw
    KlPgnaTqxzRyjzSZgs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkedtgdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdv
    ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:K9esZnvKJQxlsJEBQEsRFFva0cp8QfLeYE20HPcbZGxoe1i5dj8FqQ>
    <xmx:K9esZoYkSbjp0isd9uSH5nDn-xAdUd5FCJSdtlHMIOJGc-evaVfZfg>
    <xmx:K9esZma1wEnK81VFPx3alBciWd4ZeidSL6-DdTpShNRM_LiFHEVqZw>
    <xmx:K9esZsB89bi6NVdU04lAnN66P1TRehw-Ezy1_r-Mi9sr33Z3KoT-Yw>
    <xmx:LNesZiKGotzT3ocvub22Iwf9XFFW5H8YkVioTnk7qRjsojHxsJjSL-VB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DF2DCB6008D; Fri,  2 Aug 2024 08:55:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 02 Aug 2024 14:53:48 +0200
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
Message-Id: <0ca5b09d-13f6-4ea8-8a25-a189f1875a75@app.fastmail.com>
In-Reply-To: <20240801182313.GD47080@darkstar.musicnaut.iki.fi>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <20240731191332.GB47080@darkstar.musicnaut.iki.fi>
 <ea475f27-af7c-4060-bff7-a78389174236@app.fastmail.com>
 <20240801182313.GD47080@darkstar.musicnaut.iki.fi>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Aug 1, 2024, at 20:23, Aaro Koskinen wrote:
> On Thu, Aug 01, 2024 at 10:59:38AM +0200, Arnd Bergmann wrote:
>> 
>> Would the timing make any difference to you? I.e. does it help
>> to keep another year or two, or would dropping it in early 2025
>> be the same?
>
> Early 2025 could come too soon, but anyway during 2025 sounds OK. Let's
> see if anyone else has comments. At least one more LTS release where it
> has been tested would be nice.

To be clear: with "early 2025" I meant after the next LTS release
(6.12 as it seems), but one LTS later (early 2026) is still a
good outlook.

>> Ok, noted. Since you are doing the testing, that at least means
>> we have a chance of cleaning up the code gradually towards using
>> DT. Dmitry has started a migration of platform_data towards
>> DT compatible device properties, which can be done gradually
>> for the 22 platform drivers you use. This unfortunately still
>> leaves the nonstandard dmaengine interface (for UDC), but we
>> can deal with that later.
>
> I have some plans to work on that. There's a long-standing bug with 15xx
> DMA, but I have gotten that working, just need send those fixes out. After
> that the conversion to new dmaengine should be more straightforward,
> as we have a working testable reference for both boards using the UDC.

Nice, that does give a realistic hope of eventually doing a full
DT conversion then. If we manage to do both the DMA engine and
the device properties work, I would hope that writing an equivalent
dts file gets fairly easy.

     Arnd

