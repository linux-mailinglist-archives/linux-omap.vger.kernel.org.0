Return-Path: <linux-omap+bounces-2018-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB4F95F630
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 18:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DEA61C2095C
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 16:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBB8194135;
	Mon, 26 Aug 2024 16:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="goMS5+xM"
X-Original-To: linux-omap@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFCC19408C;
	Mon, 26 Aug 2024 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724688765; cv=none; b=NiO2z5nW7sRJSnfPLvr/vAGKIZxAAhrD2gB6gumCZK66l11LQV/9Pc+PfN7H0EpVundMm8XpWLtJBYtoSmA8aamkQRCu7D6UUDFKehKHBcmRdLnK0guQWuWLbXqSBuigDgh6mtfJwLIJ5mhxSHJa9kRcCo3VjFs32uX27G2X3ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724688765; c=relaxed/simple;
	bh=euGYz/59XjjsadXbAdxTA9x3OJSStUkjHo9YAXClpV8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=qVFDx+wJw7vkwgWB11MqJWY0azSqiuKXmHH7lfmbcWMP7Shn0bdFimHce1tE7XVISvtANxI9LvnBdNEJqfsS8065UO9yGQf10ycNbdCCEg0Lvu5Cl2Wz7kBhiZPn3qWocwpMPwpRos4SFi75hhgrWsEmpDXqMROFVFpgSQx4Fbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=goMS5+xM; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724688748; x=1725293548; i=markus.elfring@web.de;
	bh=euGYz/59XjjsadXbAdxTA9x3OJSStUkjHo9YAXClpV8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=goMS5+xMu7DTP1cTuzgthZ5/ctu5b3c1qN1eUmD4sOf9tyLfA3vi4a2HbuRjcBKd
	 8CMcLD9KMWbmjXpb2BUWu+YlmtGPLuERE19/F3fGBNFm0OUS/Mzs0Grvn3AJaumCI
	 hFz9rXJZKnZNY2C1ZIv71bpTofgE4+7wiDQa6FaR812deWDjCMpZn+ZBn+bUCr0Hs
	 io9dfdDT4O+cosECAqn6rCvLsnwVFS/eochHB09l3FCmjS/40GjRrRfTRGom4CBqL
	 YblEMqVCU3pCwT2kIXn7NUHuepf0s3/buHrahTRNd7Qhh5XtQCBWMKgTjN2g08cz0
	 hVs/8C/KIPqSqfK5og==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M3m59-1sjRXj2Vlr-000Fht; Mon, 26
 Aug 2024 18:12:28 +0200
Message-ID: <db60a8f9-20cc-4137-a7d5-ea557b585e54@web.de>
Date: Mon, 26 Aug 2024 18:12:26 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Lechner <dlechner@baylibre.com>, linux-clk@vger.kernel.org,
 linux-omap@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Tero Kristo <kristo@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20240826-clk-fix-leak-v1-1-f55418a13aa6@baylibre.com>
Subject: Re: [PATCH] clk: ti: dra7-atl: fix leak of of_nodes
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240826-clk-fix-leak-v1-1-f55418a13aa6@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hT/s+2HzVMMAUlV5CH2iXOKvUrj+8lJtismT4vNLkTnnbPFwVmp
 CFaxxCQLF9VEeb6t6vf4dKrsfCDKN97cBQFHKp1Z1pB/e4ZAoPRF2ypyS4+FPbF4bfdoYKi
 l2RlCa8XJhX2LD7HTHdB+2ZJmqXCrv2jcbjuqxzDK5McN5wd0c8kI4kFFjlW+C2uTwjiCnu
 HedjZOqi93z0/9wzUzI3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pLT8CqzIHAs=;TszXg/ABs/aaMjHt5Klpt1SBQpL
 enu+ZHV9TvbQvTbEux/kfqERUtBgpXhNaAG6JxUr3t8ezlKm9nZUXlW5Q8P4uG82Q4/NkKFG3
 RiE2Nw5NwAbRNx01z8dQaXBIl5aAJP7JXh0/RHB0lorJxI32zRRuTegeZWnfw2X4WjhH8WljS
 RLLf2n2OOSjCxd5MR1IX+tvNmFD3UoICpFlfqhQzv0AvlPzGr6wxmEtmiGfc0QOelJOAN09pG
 hCbsPZgREU9ExWnwxv1QJU3WikGIqDf0LNfTsHj9lv+OEM4mUC134hKRy5yW3eOodwjUEra8T
 NU2rpJ/OKvoOBv4tcp5EHtmURlX3g07dViGbd2vmZQwaOptCP2KcnMXBH3ZWd+Hb3pxUVGOum
 i9V1BjyRLIgc+z3+QunMtkcEJjlfQV29qVqLMflV2n0Ifbzmxq2Pi344UVPbCpBY7X5kVO/Vy
 I3CI8YxtdF0CDsHA1FWVIdzlG2AKl3K8Ikeba5lAy25igXbRms+qoooOZa0qFH5mIczTj5224
 G7qjrp2c/GsqtVVPpqPMX+9yXMAWkOl3v7SLAuqmZFTjvKsbEuyKzVu5df+1ecSrp3Z/t2hjN
 NBQJwdcEcfjdXAn6cQhFC8coxAhWsbP4VSF93IGu5JXIB/PwaBar2wGkx2rdi5DaAfvsJvpc6
 KkW+j5dwqZUGsQbNDTU8zs1sevmsq/M+czEFZAcntUy0hUdcHEmFRYo2uNgSj0QF7PrMCrHr8
 7XeOdJeM2eb+5JLAFdAzMMahBSNFbcrOt6AnnhyQhRsBvtp4YwL90MxwVbDC495Xzbu6v3qan
 7XFFjpyVIToVzWbD4Sz/emiw==

> This fix leaking the of_node references in of_dra7_atl_clk_probe().
=E2=80=A6

Can other change description be more desirable?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.11-rc5#n94

Regards,
Markus

