Return-Path: <linux-omap+bounces-3886-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEA9ADAEF4
	for <lists+linux-omap@lfdr.de>; Mon, 16 Jun 2025 13:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C373168932
	for <lists+linux-omap@lfdr.de>; Mon, 16 Jun 2025 11:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2194F2E92D2;
	Mon, 16 Jun 2025 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jm0.eu header.i=@jm0.eu header.b="HWemglRp";
	dkim=permerror (0-bit key) header.d=jm0.eu header.i=@jm0.eu header.b="Ve7bFb6T"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221712EA46D;
	Mon, 16 Jun 2025 11:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074310; cv=pass; b=bnhYMApy2AoJqxwRxo/T/Wryd2RLnF9tYS7OpLJcUNMYF7xQFfAaqs52XFQfcsHLZVWUnTPfRz7VzCiDWWSmfBCPQzb8zGMNOQoZ5TZlsEKtVqlnUz3lVxumUp0EEUKfN+JfcwxbUKDogWQoqa/TvCM+UADASWvTYkuLKtB6cxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074310; c=relaxed/simple;
	bh=/fJnsIDZVbBh60xVBDENVXk/vS0J+yOhafeM1KUVnuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UB3Le1j3byj31iNVry/YPQu/2ISv09qc7hVJrhAh+auHJsDW7oKIJ4Gzs90zwhIjrz1X34t5Td3/LxPj9CqzPyVgQ6y1d3ROMhwkXts8hz3+Spi0luZGE5/wa+s3bTPh0ZLWJWXXfrPk3FFTFllviesi9eZjrYci5Af42mOMRfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jm0.eu; spf=none smtp.mailfrom=jm0.eu; dkim=pass (2048-bit key) header.d=jm0.eu header.i=@jm0.eu header.b=HWemglRp; dkim=permerror (0-bit key) header.d=jm0.eu header.i=@jm0.eu header.b=Ve7bFb6T; arc=pass smtp.client-ip=85.215.255.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jm0.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=jm0.eu
ARC-Seal: i=1; a=rsa-sha256; t=1750073947; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=F9RTtV/6F2OkIl8BeaUyhAktRiwZQ00InbFBWyfnaCw6onw9mTIqmf0UlGV/QSDHg9
    9kddPwBkAy8MKk8DyZ5NF7Ldlf/RLgFzhu2s48GTM2fvS5uVbnTur9Abm98m72LcH6L0
    0Tlep/85UQyEze4CIOWwlAS9HlAQhxAwxkBtHraBMQc/FBfDWE84M0jBymbuPsFaMtw9
    hJ7hTZIzZWi7SfCsiUjpyAyKCl9FbHly5mbEXjKwimWqj6nOQKbHQLlXhDJvqds6Puo5
    vaJQ0kJjYsuQIFdCAlcDgrpXcUQfsm/JjAqvkOo3GfwFsR3jJ33x2yohEN05eYthh/46
    /Ehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1750073947;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=YQ5aUH7zfhXOCP2tutXlMeFvigXdIeN/ybAKmivyPd0=;
    b=ru7uZ7Suplu5qdTNB98Cyf8drcyfuJIAY9Mru6PLW5Xc6DwOGPEGVAaTXEeQNdgwiH
    4yzgIosobXzMaoZJCljEPSLqdMkZO4XiWANJTgjHqlZyfUT15pAQjus5ede/2QQoFGES
    W9d86jivVEQ7Zr2Rlkb+sNjHkYSY/NudTIU7GU6jrFa85K5YWw/hn52vc6iMJszvLY18
    6MoCqXVrrZhuubAyimn8OAOgRxSHGTvZYeVwH9bETbFBeFQ+l7WFrGFNOn6Wkyq8LBaQ
    sROoPqceeYC4TRjtXI18jCGem1T8QkqzF6vr+yPZdra74um/JlbS2vTHGUi6QUi+GCBD
    JPag==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750073947;
    s=strato-dkim-0002; d=jm0.eu;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=YQ5aUH7zfhXOCP2tutXlMeFvigXdIeN/ybAKmivyPd0=;
    b=HWemglRppNKZ1QHsrbVcMdKipm0cRSRDqE49HPoVg0lOmnT87CU8lC2Je7ukL5r31D
    0BBscAoiGNOZIbyPKtibfdAkIj8FF7V2+GIue5mF0L2AaviyiWZ4+z8RvXN0ybpx+Ew5
    uMmtaPj1Mux1Wv4xb49wIyU9eK87NBdfxXqib9p5BBrU8LVXqKW4LqHvvTDpyGqnxsX1
    xYdGhGIo0svxwFMWxI/f1RGwsneToFL0xSsfygcYRz0IOT32yq5xHsj3c3EDL+DBkcSZ
    A31gigFm5NR7f+lLZF42Ni3XmMR7NUyW62+zGKEX5lfc2Nc/3z810ssemzIgT2M9Om4G
    krJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750073947;
    s=strato-dkim-0003; d=jm0.eu;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=YQ5aUH7zfhXOCP2tutXlMeFvigXdIeN/ybAKmivyPd0=;
    b=Ve7bFb6T+npQJDnr7+7YXB5MuWFGZBn58mFWWVRbrGPo5SUeV8BHgHTXOg6jdXzl4i
    2ef7EzOPLS6kNzs7KeAQ==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPTeoCaRth8YQl85wlaBlpkx4CWttlFZIgbULbhEgjs89efw=="
Received: from [IPV6:2a00:a041:265b:4200::1001]
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id z292ee15GBd4Qh9
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 16 Jun 2025 13:39:04 +0200 (CEST)
Message-ID: <7e854232-f02f-4ad6-b65e-22c18d1d9fe5@jm0.eu>
Date: Mon, 16 Jun 2025 14:39:03 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] ARM: dts: omap: Remove incorrect compatible
 strings from device trees
To: Kory Maincent <kory.maincent@bootlin.com>,
 Jason Kridner <jkridner@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Paul Barker <paul.barker@sancloud.com>,
 Marc Murphy <marc.murphy@sancloud.com>, Andrew Davis <afd@ti.com>,
 Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
 <20250613-bbg-v3-2-514cdc768448@bootlin.com>
 <CA+T6QPnaCFZyRsv9q3bcOrTc22nA0AOXy0tR_SpAkGVVPQqfLg@mail.gmail.com>
 <20250616103919.2d678c1a@kmaincent-XPS-13-7390>
Content-Language: en-US
From: Josua Mayer <josua.mayer@jm0.eu>
In-Reply-To: <20250616103919.2d678c1a@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Kory,

Am 16.06.25 um 11:39 schrieb Kory Maincent:
> Le Fri, 13 Jun 2025 13:52:23 -0500,
> Jason Kridner <jkridner@gmail.com> a écrit :
>
>> On Fri, Jun 13, 2025 at 10:49 AM Kory Maincent <kory.maincent@bootlin.com>
>> wrote:
>>
>>> Several device trees incorrectly included extraneous compatible strings
>>> in their compatible property lists. The policy is to only describe the
>>> specific board name and SoC name to avoid confusion.
>>>
>>> Remove these incorrect compatible strings to fix the inconsistency.
>>>
>>> Also fix board vendor prefixes for BeagleBoard variants that were
>>> incorrectly using "ti" instead of "beagle" or "seeed".
>>>
>>> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
>>> ---
>>>
>>> Changes in v3:
>>> - Remove extraneous compatible strings.
>>> - Replace BeagleBone board name vendor.
>>>
>>> Changes in v2:
>>> - New patch
>>> ---
>>>   arch/arm/boot/dts/ti/omap/am335x-base0033.dts                   | 2 +-
>>>   arch/arm/boot/dts/ti/omap/am335x-bone.dts                       | 4 ++--
>>>   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts         | 4 ++--
>>>   arch/arm/boot/dts/ti/omap/am335x-boneblack.dts                  | 4 ++--
>>>   arch/arm/boot/dts/ti/omap/am335x-boneblue.dts                   | 4 ++--
>>>   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts         | 4 ++--
>>>   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts                  | 4 ++--
>>>   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts                 | 3 +--
>>>   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts               | 2 +-
>>>   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts             | 2 +-
>>>   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts               | 4 ++--
>>>   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts | 5 +----
>>>   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts          | 5 +----
>>>   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts               | 2 +-
>>>   arch/arm/boot/dts/ti/omap/am335x-shc.dts                        | 2 +-
>>>   15 files changed, 22 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
>>> b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
>>> index 46078af4b7a3..176de29de2a6 100644
>>> --- a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
>>> +++ b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
>>> @@ -9,7 +9,7 @@
>>>
>>>   / {
>>>          model = "IGEP COM AM335x on AQUILA Expansion";
>>> -       compatible = "isee,am335x-base0033", "isee,am335x-igep0033",
>>> "ti,am33xx";
>>> +       compatible = "isee,am335x-base0033", "ti,am33xx";
>>>
>>>          hdmi {
>>>                  compatible = "ti,tilcdc,slave";
>>> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone.dts
>>> b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
>>> index b5d85ef51a02..2790c0c5a473 100644
>>> --- a/arch/arm/boot/dts/ti/omap/am335x-bone.dts
>>> +++ b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
>>> @@ -8,8 +8,8 @@
>>>   #include "am335x-bone-common.dtsi"
>>>
>>>   / {
>>> -       model = "TI AM335x BeagleBone";
>>> -       compatible = "ti,am335x-bone", "ti,am33xx";
>>> +       model = "AM335x BeagleBone";
>>
>> We have software that looks at these in running systems, so I’d be ok not
>> to change. If changing, why not “BeagleBoard.org BeagleBone”? Not sure of
>> the convention to mention the SoC, but AM335x is not part of the product
>> name.
> Is it ok to change it or not then? Ok to move on to BeagleBoard.org.
The Debian project most notably uses the "model" string:

https://salsa.debian.org/installer-team/flash-kernel/-/blob/master/db/all.db?ref_type=heads#L2191

When that changes inside a dtb by kernel update, users may be unable to 
boot.
Therefore I would recommend against changing "model" values.

sincerely
Josua Mayer

