Return-Path: <linux-omap+bounces-1189-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7368A4B2A
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 11:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61CEFB20CBA
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 09:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62E03BBD7;
	Mon, 15 Apr 2024 09:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=radisson97@web.de header.b="LyRAQjiY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AE72C848
	for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713172360; cv=none; b=phc4/TjEo1g7NFvLrxshbk1eqGT+ERRtSkbBqFkJO5i5xYE9JNCp7kDj8dDJO23T66K+/jaGVUBklnKe7BWvxrsKj43ZTQDgch4o6tTIoeZSzLCMi7OFrhB3EwOJJcDkXnM53Ysa/vuWPwOFuwXJjasoGpYq1UH3CW2QgcxbPLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713172360; c=relaxed/simple;
	bh=ge2LHwO+6uTCC9CBLsD7m1hS4k7SRWzf5RKqkeUoaFc=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=b1FIFJI7tOaKwlYMFkeT13lNLiEVnWhB+Ig569PBdqRIRwcJszW4AYF0k6vmdj1itNmSzr3FE0amX0yarzR3O1KO1n9RTO5V8gBMidtu7wM9uHkKcB2yIlF8Vp+1NJiSzJiI1EZGjgwqiHU7RNdPAW96vzmay0js/fhdWy7Dj7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=radisson97@web.de header.b=LyRAQjiY; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713172354; x=1713777154; i=radisson97@web.de;
	bh=NuiR6mJqPkaOeZmpg6PjukuIope9CUvPm1r5gc0Gn8c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:To:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LyRAQjiYm3R2klGs1Pk4tXGyEdCKC+hK955w1J1n5+N4ERReingLIshE/OPPFxSf
	 MhevfVZBRMu0MdSKnWeFLUrrNughqwjOoEPIpbwi04uWxspgH/4rt95sRK7lYfxQH
	 DhKni7oOnl3nFa6VVzXQRAKYqphN2stLRv0GAuuxC0zVSizs9d8kxwcMBvSAP4MXn
	 B2whrbIv3VTvwrcm0tP3uLErduat/peV8gTLJ5BLA9lBU3u7xPBbPBRZifyvrg9m6
	 Z1d9T7pJMjj4gaLxrvuYIigGfhvLHeQF1MExYydXIrwrM8YbANn08PnuDgJy8fp1X
	 zQKo13Q0IHP+5mf1uw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [10.186.1.237] ([193.174.231.69]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M9ISr-1rrdA524L1-006Pxi for
 <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 11:12:34 +0200
Message-ID: <862dd312-68a3-41a7-8305-dd1b3b8c07ce@web.de>
Date: Mon, 15 Apr 2024 11:12:34 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Peter Radisson <radisson97@web.de>
To: linux-omap@vger.kernel.org
Subject: omap and rs485
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mZpYPsGC+IIApw/SOBZAGN1l+C/8DoLTX931hgLyil5QF7gbKio
 qPMVWyYVc2Ufh4IRsjKTqqagw4lHDQbQbomLeFRzkWValy7OXUBrgFNyMIoXAWORUihEGyM
 Ir3b4Ea5WnB4943RAq4T/5xX6i5qL7ZQLzAKM+V4F7HiXO1qD/G7T3dYbVAhOGRoGpkW3H/
 vpMvfGR31eOFK8ivQComw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LDyxzzkVV8c=;hQij8UkSaA4hED7m24s4cizjLNC
 HUwyYSj7OklsoK0ufRLJehWnQptkkJ8sBqeXxVYoQN2fWxuiqaLa/jwCDz/LSvJLX1Qx8IPiz
 +K1/XccbGSbNJai7cqVqug7oULYTjwDcRIbwnbvcSWIJnc1dLrPxPpL5jT+1ITdyGnbuXHCT2
 xiYTW0pRp75APUQ8C7GU76gfTSBxb9yexpwwavjnUIuOvKlAWGQLzwjA+pywRSKrmJHv4gQ6b
 Hs9u/Ibt4/27ZWxG4fW1UqKDOKhG4nPuFV9CNIiB+UDD64mIeDvf3InPI0VROekOL3ucd9w4s
 L+O8ZXe9lUUY9biRwLOnLAl1T5u4hKmUyTbSwyw1ETWU29LaRx6SvCjbNudpzRvw5e7P/prWH
 ztl/rZG5P/pboFmyKd9OpqX+ztnk9PlMo2401nKHQ/WIJqwX4avgv94gUPrSMC58MsB66qmQw
 6jL6iUFBgyfnt0O//LqL2wsuCSTcCC69YrOswHzp3DBpDpZaFzgmfj+nUEdPIx2iSRqJBfW0/
 NJS+75efA8BWd8a/ZJhb+Qcfg0ES7zkGMhxyT3Ahwhe0skVkmWI45gYVRYSxzI6xvfkoqhnq1
 sO0tFlXiDIxoa7lcBt4CkIbSoFCpjZ0wUhfcnjaApCTTRqiviTxh7qUU5sfHnT8awFBOQN8fF
 l/mWLXqU5dC5Y5ZzZuFN5ZNEK6qVWoM2TrHULme8ETiWChLcCLRBCaijxWa+YwQ770Y5kLjRI
 7kRQ9NI1tkH7EEzMwO/RkMV48o14JTwqIr3Yn0z6lLKDOJC4Uz2yQfP3zHMIzjEcoss6noZhd
 1zT2e9y44vrexh7hOEIZPkQLlGPLQMmm8M3WIuN1TmzQY=

Hello List,
i have a custom-made board and trouble getting rs485 working.

1. with Kernel 3.5 it works

2. with Kernel 5.10 we got a reaction if the omap and the 8250 driver
    are both activated but the connection is bad, it seems that both
drivers are catching some bits.

I am not sure how to continue.
Is that behaviour a known problem ?

I have seem there are some patches that went into the kernel after 5.10.
Does anyone know that they may address that behavier ?

note: i am not member of this ml please reply direcly.

CU






