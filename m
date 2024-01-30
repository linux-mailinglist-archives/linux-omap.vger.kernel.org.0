Return-Path: <linux-omap+bounces-439-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CE88422E1
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jan 2024 12:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE92A1F20F3C
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jan 2024 11:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BF966B29;
	Tue, 30 Jan 2024 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="ERmWKDd5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E544CA23
	for <linux-omap@vger.kernel.org>; Tue, 30 Jan 2024 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706613750; cv=none; b=npjDgeNOjkddUkk6umBITkcXn99PKb4UAvLMfcT0vWjLZyjjDQVXwTsdUIpcjlvRjTc7SSxxqI/XbbMd21S99HshXKvIEsH/bAWdWZrMyEm8rC73yGqVxDEIqW8svxnlxgNN6NvREnbsdDBRr8ZUO7pH8vVn4jfoDDFyqd28UfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706613750; c=relaxed/simple;
	bh=mz50I04HWN1JEi6Z01jpnVawmfMCfGyc3tRU94OV46s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0nuxzV+Arrz95XSyningcv4UrsPprXF8W0BKoEqZaZYqdk/klqeE54/8ubS3U0cScFaDuG+e4aiSvMdhl5wgmFEwIbZJ3zkparM0aTQ7qaxO7VQy59kXXSfBGjNk39Z/L1ozaxzi8/HJWW5QGRmLttZc1mL0Ujo9rtMLoXVa3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=ERmWKDd5; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5110fae7af5so2330818e87.0
        for <linux-omap@vger.kernel.org>; Tue, 30 Jan 2024 03:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706613746; x=1707218546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcsl9dEb/AV3p6MstPkTNZnyX7ZF2mY6HhaS1oOuQyk=;
        b=ERmWKDd5Z4EI1h3wnIztznfmH8YQpMeycG9NttcZ1eqyJJcKds688hps1cC14kRn/f
         DdM0j+k4Vr55crN3dMM1tYNuqQ/8Q42CtXDNRM+Sx+8XgSlREpB2D70j1hkSYQqKghQP
         IofUcaSrcGzj2NeElqRJJXI3SR9YM0JpG81rApAZ4mmdD42tCl4U2MOHgC9U4QDZEAPU
         a9nykZM5JGRA5mWSNbu3zYu4qcWYgGYf8YuIi2vehfsuFFLTbiknXurFE8nw2kmlidI5
         7yo1cXyarMx/dFyGlM0CBmyJgKtUqj8Zcrbwzsi2I/qyXxjkVdUPKs5o8dko/ILe8OJM
         8pVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706613746; x=1707218546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcsl9dEb/AV3p6MstPkTNZnyX7ZF2mY6HhaS1oOuQyk=;
        b=tbOkK94CcqIBwSrQ4AaQ4KKLufL8pQuK59DUuLas+1UCfyTTl7qwui5DBbX2p1Egfh
         qj9O/ZWqif3Yg3Tb2aYTvUWIGCyjc8aDWE6AyD+3Vlm+wGWROUvwR1tBcs9z94tU2PCQ
         i4O5wWaQ4Nou01vzmZWakchbzx3KvCFh4Eu3sOHNb1yx+cQlVPCMnj6nuk2kCLNd2G2b
         skoCXMxS8VvEp0IEH/um9Q7UNT4+eQ7wLk+JYKiW+I9VXgY7MPrprHmkcKkxMu4TT6J0
         GBLZVzi7Vzn92i96fW4PpbOWhx7RObsLdRR3kEkLFh+Woz1UKwTsCOHtJwSeQiMS3xlO
         CmVA==
X-Gm-Message-State: AOJu0YwcP1lz+wy5HlwV0ZKE99tEUCE1kcu+Mm9B+vySNyUtLMoOBe3C
	iNtUl9yl+cv4xeRI59yvvO8WF4p1E+HfWaVLMFIiIsAvu3oliFxHK2JfTdiYC4Q=
X-Google-Smtp-Source: AGHT+IFGHU3BYxFbzmnR/7st/DVMOvV4xqoxdnbZ+2ZiTQAxNMckU/NgkMCaGYX255DaWRnn64C/Sw==
X-Received: by 2002:ac2:4101:0:b0:510:1364:cea1 with SMTP id b1-20020ac24101000000b005101364cea1mr5482393lfi.48.1706613745846;
        Tue, 30 Jan 2024 03:22:25 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31? (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id ay4-20020a05600c1e0400b0040f0219c371sm1669559wmb.19.2024.01.30.03.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 03:22:25 -0800 (PST)
Message-ID: <c3daa433-a867-4dfc-91f9-a0fdeab5c3f5@smile.fr>
Date: Tue, 30 Jan 2024 12:22:25 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sdhci-omap: issues with PM features since 5.16
Content-Language: fr, en-US
To: Tony Lindgren <tony@atomide.com>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, Nishanth Menon <nm@ti.com>
References: <2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr>
 <20240127044851.GW5185@atomide.com>
 <d09925b3-83e6-4c52-878f-4c1db7670543@smile.fr>
 <20240129111733.GX5185@atomide.com>
 <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>
 <20240130111511.GY5185@atomide.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240130111511.GY5185@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Le 30/01/2024 à 12:15, Tony Lindgren a écrit :
> * Romain Naour <romain.naour@smile.fr> [240129 17:42]:
>> OK, I reproduced the same behavior on the AM574x evaluation board. I didn't know
>> that ios can report clock 0 Hz and vdd invalid when the device is idle. I
>> thought that was a symptom of my initial issue "mmc1: cache flush error -110".
>>
>> So, there is no issue on AM574x evaluation board.
> 
> OK
> 
>> I don't understand how the emmc_pwrseq node can work on am5729-beagleboneai
>> using gpio5_7 as reset-gpio since this pin it's not connected (F13 ball)
>>
>> 	emmc_pwrseq: emmc_pwrseq {
>> 		compatible = "mmc-pwrseq-emmc";
>> 		reset-gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
>> 	};
>>
>> https://openbeagle.org/beagleboard/beaglebone-ai/-/blob/master/BeagleBone-AI_RevA2_sch.pdf
> 
> Sounds like that's only wired for some different revisions then?

I don't know, there are only two bord revision A1 and A2 but with a similar
schematic on emmc side.

> 
>> Note that mmc2 node is using ti,needs-special-reset property that is not used in
>> shdci-omap driver but only in omap_hsmmc.
> 
> OK I think that's leftover from the earier use of omap_hsmmc.
> 
> Can you check that you have the dts property non-removable set for the emmc?

non-removable is set in mmc2 node.

/* eMMC */
&mmc2 {
	status = "okay";
	vmmc-supply = <&smps8_reg>;
	vqmmc-supply = <&smps8_reg>;
	bus-width = <8>;
	non-removable;

	pinctrl-names = "default", "hs", "ddr_1_8v", "hs200_1_8v";
	pinctrl-0 = <&mmc2_pins_default>;
	pinctrl-1 = <&mmc2_pins_default>;
	pinctrl-2 = <&mmc2_pins_default>;
	pinctrl-3 = <&mmc2_pins_hs200 &mmc2_iodelay_hs200_conf>;
};

Best regards,
Romain


> 
> Regards,
> 
> Tony


