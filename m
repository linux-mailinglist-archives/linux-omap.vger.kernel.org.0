Return-Path: <linux-omap+bounces-605-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83652855EBE
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 11:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5C981C2130F
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 10:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B63E69965;
	Thu, 15 Feb 2024 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YbytBnjY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E5A66B55
	for <linux-omap@vger.kernel.org>; Thu, 15 Feb 2024 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707991593; cv=none; b=IpTQ+bc84r4NHSv49GHMnSK/oWXzxtRDxlKfEVq4jXAjHaeUCC7zaquoLz2Dgg303NdSdHD5gF8vlYLzyZWeVUxDkmYo+NWwimGbno9Y6HHzOZuakg/naAqsqiZC/DTKgFDpMU3ov7T5PzERB0fwEYzigrnNenouP9LgM4dSZCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707991593; c=relaxed/simple;
	bh=6cBLzuR1wjc96i7DmZpnBa9+0HV67FkLgQM9wCAQXuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukGYxOUSVciBpcPy9XzdFW0+Rk9AoBBwlZl2wzJdd17UHV1VTu4WShbu/BJTDshjKNFKfATDhpVz/GLWByhzsnecnWgL6ONZRMsfNaCKJNRx9LgYoXZe0bN6iKF9RZ8AwDbUqulZe/trhhTi6lBNu8kK3iA2IqHoiSpz3wCqA94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YbytBnjY; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a3c1a6c10bbso72655466b.3
        for <linux-omap@vger.kernel.org>; Thu, 15 Feb 2024 02:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707991590; x=1708596390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h7j7BDbf/2XTLgGFB+o6WPYFGjyq3xmN0zRxSIya6Co=;
        b=YbytBnjYvRS+4iYKzmjX/WHcCFTjKmpnZMQO8MTZMoZxGetQuK4H3fpygGQZ7u4lh+
         Kv2z4cEtFhIkaNhmrmLHCBK0sYeiencPHe3yW41NpisZLLh5zqh5/wips1UYRbyAyROP
         qdZE8wp5m4T4O5l/2FnJzvZ9L7mw3fkt/1lnNgpZeVNzbT37H+rxxe+Apb9TjI4MLrfu
         qUW6p0DjBb+KcGyi+Z+RED/czWzk1C/jQW9YBXWLYSW8aMV29sC05gmBsJTQgTMwaswA
         Q9yZIIUgIgRbcaqVyEENPzgSgMK9Ruu3dlMonx2q11lqfv+KEKDowsI+3HJbXHVryPha
         Wxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707991590; x=1708596390;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7j7BDbf/2XTLgGFB+o6WPYFGjyq3xmN0zRxSIya6Co=;
        b=Icr9NgGx+rlwWsayREh3NaUdnJf/pO0HyzsQiMawbWqZE9iu3UyUp8MY6W1Y3rE0KY
         AM7MfvKbHRd+TZwCrCe7XDhyWnJKiNIp3t8Yf97FAxKsaq4K1lfsy8K90hZ/nIBFbFFU
         tluV0nRU9hGSHNWxzeJF9xRz0Wbb3YAlSLKlZtQj8SuJEj7PE7X+oGNz6U14mIITQaRX
         VkhDkUcRwnEGkiiygSnhk/Y1dohShwtCWLwMBlXqWMA2BNFSOmdq7JzzCZAY8DrT1YBK
         bSgoMz0CSL2Rg9fF1JfF2B3WThldhdMyXp8JThiuXiUYIhjkFHWCLQ3avaaI3fXZz3ip
         /Osg==
X-Forwarded-Encrypted: i=1; AJvYcCWTkQSTRb9IfySpU0Ot0PfsVyhxn+XGoOmfrYNPAgGERC0VZqnBEWvOnDaQtXHk4iKxiVjIxNNmKFtQklKlVELO/xK+tLcAV/uoHg==
X-Gm-Message-State: AOJu0Yyctb8xx37oMd0KcGRazaOsva8+bJKvauTK1OgPgEWpuL4wOxGd
	puOl1HBtkNlcRjlAlV0N2/heHepyjgw7SzDBiHWPs8m+z+S55M4m+ThXZ1tWhKk=
X-Google-Smtp-Source: AGHT+IEEM0cWgYXokqInqYrcPLv8UI1GS1w0YRnrANXKcGmmDrdUCqlP6GLPJ0jaV0GEu8jCAinSGQ==
X-Received: by 2002:a17:906:e089:b0:a3c:f531:4514 with SMTP id gh9-20020a170906e08900b00a3cf5314514mr971601ejb.62.1707991589675;
        Thu, 15 Feb 2024 02:06:29 -0800 (PST)
Received: from [192.168.200.206] (83.11.22.32.ipv4.supernova.orange.pl. [83.11.22.32])
        by smtp.gmail.com with ESMTPSA id fj15-20020a1709069c8f00b00a3d26805852sm393944ejc.17.2024.02.15.02.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 02:06:29 -0800 (PST)
Message-ID: <6c27e4ba-34dc-4ba6-95fb-39989d0c2cc3@linaro.org>
Date: Thu, 15 Feb 2024 11:06:27 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
Content-Language: pl-PL, en-GB, en-HK
To: Dmitry Baryshkov <dbaryshkov@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Andreas Kemnade <andreas@kemnade.info>,
 Linus Walleij <linus.walleij@linaro.org>, paul.eggleton@linux.intel.com,
 Andrea Adami <andrea.adami@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Daniel Mack <daniel@zonque.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Stefan Lehner <stefan-lehner@aon.at>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
 <CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
 <CALT56yOT_U9jVkhTP=zZu-32B4pta5zaJocn9695N7ari4cFyQ@mail.gmail.com>
 <be4038e1-a578-4439-a9bf-e936484c64cc@app.fastmail.com>
 <20240215093113.5c58cabe@aktux>
 <7c8a5c5b-a94a-4b87-a043-f1e398b55872@app.fastmail.com>
 <CALT56yPLobsL699K9+DDMBWwi7-iLzaYwuDwV7NmecaTY7Z6Tw@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CALT56yPLobsL699K9+DDMBWwi7-iLzaYwuDwV7NmecaTY7Z6Tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 15.02.2024 o 9:52 AM, Dmitry Baryshkov pisze:
>>>> If we want to actually go there, I think the best option for PCMCIA
>>>> support is likely to replace the entire "soc_common" pcmcia driver
>>>> with a simple drivers/pata/ storage driver and no support for
>>>> other cards.

>>> hmm, main usage for PCMCIA/CF in those devices was often something else,
>>> not storage,

>> Do we still support any non-storage CF devices that someone might
>> actually use? Do you have a specific example in mind? These are
>> the currently supported devices that I see:

> The Bluetooth over the PCMCIA UART worked last time I checked it and
> according to your grep it is still a valid user.

If we want to keep those pda devices in Linux kernel then dropping 
whatever PCMCIA which is not a storage sounds like sane way.

No one is going to use such old PDA as daily tool nowadays. And if they 
want then 6.6 LTS kernel would work better due to WiFi drivers being 
still present.

Bluetooth CF cards are old, v1.x tech. WiFi is 802.11b unless you manage 
to get one of those libertas_cs cards but they were rare even when new 
(I was involved in starting 2.6 driver for it). Camera cards had own 
out-of-tree drivers at that time.

