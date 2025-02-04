Return-Path: <linux-omap+bounces-3262-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69268A27AE0
	for <lists+linux-omap@lfdr.de>; Tue,  4 Feb 2025 20:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DF7F1886955
	for <lists+linux-omap@lfdr.de>; Tue,  4 Feb 2025 19:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEC1218AD6;
	Tue,  4 Feb 2025 19:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uSlvlZ4c"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAB8153828;
	Tue,  4 Feb 2025 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738696132; cv=none; b=pz/8zk7o+b/WHEzJUjBkl02Xcy0VMJddtYBLFrMOj81W6tz4OnYQ77ExdNbOu7WukCqdAbQ0irEW6tMo4Z4FIEXw4d8NGNY7JWW1jcp13aniGX1IkcYv/r8YOpLPnJwt1ksP6KAGMhD+kLyqkTVqgJvai1fp0Dxrcuuar4Qa9V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738696132; c=relaxed/simple;
	bh=asILBDTAQVkEGZTyYOv9krHuMTsQ9hzfdlstnv9ER4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eCvKawZKQDXjZ1Akl+ktZ0aI6++Z8JBjSHN9cs6roTR+uWv5okoAdP6SQjMLghJWwQgsUU8OUOn/hn2VtDyYZj3ZFN2MAQQEwrNKcMPOiZgKamse3U1mXCsNqliK5y7QaC4jY9sutvtcevfUk58QXwM20fEGYKjGOMgJIePGMi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uSlvlZ4c; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514J8DSP2388926
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 13:08:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738696093;
	bh=ZQ/Tl+5zzv/S7A23BMt0rIGSp/0HNeQhDQ08EcYX/NI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uSlvlZ4cY4rqxnMKdTeAhbeVqdLFmKJfq5zHqtfyioxJY2xt2GGw8crn8n6E4DPBU
	 zz5Xc+rT6IyM0USRQutSjbMk9yTrGG+cLiVHfkwYJoUd+ipUsYLmrchzpnyqrRiQyv
	 Z+PO62B2mgula5h4gfo43xYC/seNR8mpHXSurleU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 514J8DFj074646
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 13:08:13 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 13:08:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 13:08:12 -0600
Received: from [128.247.29.251] (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514J8CN6022644;
	Tue, 4 Feb 2025 13:08:12 -0600
Message-ID: <2b433451-9faf-4721-b589-731838370664@ti.com>
Date: Tue, 4 Feb 2025 13:08:12 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] regulator: dt-bindings: Add TI TPS65214 PMIC
 bindings
To: Mark Brown <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>,
        <khilman@baylibre.com>, <rogerq@kernel.org>, <tony@atomide.com>,
        <jerome.neanne@baylibre.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
References: <20250116223740.429515-1-s-ramamoorthy@ti.com>
 <20250116223740.429515-2-s-ramamoorthy@ti.com>
 <8f5ed865-cd21-4b20-af17-dfc52e28b4d3@sirena.org.uk>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <8f5ed865-cd21-4b20-af17-dfc52e28b4d3@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,


On 2/2/25 6:40 PM, Mark Brown wrote:
> On Thu, Jan 16, 2025 at 04:37:39PM -0600, Shree Ramamoorthy wrote:
>> - TPS65214 is a Power Management IC with 3 Buck regulators and 2 LDOs.
>> - TPS65214 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs.
>> - TPS65214's LDO1 maps to TPS65219's LDO3.
>> - A key difference between TPS65215 & TPS65214 are the LDO current and
>>    voltage output ranges and the configurable options available.
>> - The remaining features for both devices are the same.
>>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> ---
>>   .../bindings/regulator/ti,tps65219.yaml          | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
> This doesn't apply against current code, please check and resend:
>
> Applying: regulator: dt-bindings: Add TI TPS65214 PMIC bindings
> error: sha1 information is lacking or useless (Documentation/devicetree/bindings/regulator/ti,tps65219.yaml).
> error: could not build fake ancestor
> Patch failed at 0001 regulator: dt-bindings: Add TI TPS65214 PMIC bindings

I combined this TPS65214 series with TPS65215: https://lore.kernel.org/all/20250131221139.342967-1-s-ramamoorthy@ti.com/
I will be re-sending the v5 with Krzysztof's feedback added soon. That would be the replacement patch series to try applying.
Thank you for your time!


-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


