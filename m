Return-Path: <linux-omap+bounces-590-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B225C854A9C
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 14:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BACB1F26D15
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 13:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5105E535DF;
	Wed, 14 Feb 2024 13:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hG49puOp"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B01053E3C
	for <linux-omap@vger.kernel.org>; Wed, 14 Feb 2024 13:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707917976; cv=none; b=JFX5gtoBtmV+6obQTC0GTOuFENMfM0cgz4A500+s/ZRCcap6XaW/5X2e5ktH/Fgvqq4BaXeKg2K1TDmJUJObtoTrbRbviJsV4UOouqiuLpfgOqoKcrH3vKvC5HiOlTRUBdzUunIYp2DcND4gOP98AKlM5EIUdTn4ej6oSd3K3x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707917976; c=relaxed/simple;
	bh=vaLceIjnqZ4N/SzHDQGj/q2IDCIW+3v+qxPIUsNQZMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g++w0mbjeKnkDHhPL1M88xEm4UzG2Oo3bfDqA4fVxuGISgkeLKZfUtc8uiSacpZ7PsUIPCfvv3Xf5kEJF4N9xnJ+tvRAHy4R9YM6z+rbVpkXWgnBJ7UbG8IOULBS3Unlen67hiE178VOrhKzmnCRg82prbOUESGXKQb11jiYvgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hG49puOp; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so753170266b.0
        for <linux-omap@vger.kernel.org>; Wed, 14 Feb 2024 05:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707917972; x=1708522772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LggHhwi3m1WRsUhddvjIokNLKTx/WSiLR+NxAO/q2io=;
        b=hG49puOpRHZND8eNDOcDN3npqRh7hVIE5YpvPRy0c1EOgGostmbcpuBzBDSZGkjcl7
         YUXbXyqkKFrcbNk2FF3CnM2Z+ZGr7kL+iHJK5UAyI6+lJH/K+7csRA4vuy32UnXzQnvc
         M/G7UjhxkPezl3BTocc8+rfJn0rqzoBACA7fG8mH+K64S95kA0tMBwnecFL6nMM0KSx/
         +0wv3hCZyS/y3yc3AsvhZE5WG4mQ4YRMxS5lxDUVVKwUHhykIO/L4Emo8vE4aAlqyc4Y
         Ckjg5t0WlUE976GqVPI85uTN3OMH5yDwDmlmE4Q3erlRucvTcS7zdiNhCUhyTgmFwrsW
         hrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707917972; x=1708522772;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LggHhwi3m1WRsUhddvjIokNLKTx/WSiLR+NxAO/q2io=;
        b=eZJ5YV4pD2nKSdnLaaV4TGdc4nY/U+8cwLwKdoR12N2vuWnXzA6ZenS256+WpB7x4q
         hSTWQ9DG8QHS87gkEgMzQ3Rh1tZn8QUzOuGMqYrduBym8HuCf7LyuPjJx7FUxCOBFb6Y
         CElABGCtOmsCMFgsGU5fG858XaXidUaNZutNfCWfpGpTaXY2YfDJwXwumhbudFpz68Kz
         kXiVTdMWJ2RRnyk46tLbPhqIkjrC5c6uEB/GBFVKD118RaRkYsDpBUaGmF+QM3/ITmeJ
         YKqjUElvLw21QzsLQUpfLsd4jL4iLRvQUFI/Yr7h6kXmmAy2xs8iaxai7hKEMiXmQ0Vx
         A3Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVKMjI6nkavNUNbhmS9HYLgbI5puCfmi5SCjFdLonIdKQQMV0z8s9FDFLYqShQODUsiOrko8+VCth8X9qse+2XrYuQA8O8HADbkYg==
X-Gm-Message-State: AOJu0YxDC76Za45YW96ZisobtQqwrhpnAdfLGFg8+E9QY9HlXUcnMpK/
	ndY3VzBiY2JvgWC6AVb2eqMeJ1WfjHiNTRaNMYX7Hh2sb/krQBnuagD1lyTxBng=
X-Google-Smtp-Source: AGHT+IG+ZZoCq+Vw0RPwMQXSsDJliPkaaA698cupwHx3vT4Gqm16aJcc9rjorgM/7kx7Bb5/8IxP7w==
X-Received: by 2002:a17:906:5589:b0:a3c:edf6:a735 with SMTP id y9-20020a170906558900b00a3cedf6a735mr1936289ejp.47.1707917972495;
        Wed, 14 Feb 2024 05:39:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0tgkHYOIoiME2Z+tJNPcYcVzP/fojlHePP5zXMs6K2bBngkU0lk4Gmu7Is0ep84jGi534r0JEwwiSwDSKc3QmcDn8TysnM6YcepFmZNjpZArdIXY+AI0pGq4l4XzPbUyQJ5efXI6dJqA+v2Jxt3WZrJ8/3YbxbD2OVug9GwYKPqWNR6UztA9/JadzVO4KJldLOJnxHwa6zQiSGuQ7XGJn3ZJ/Hg9MGJ6JWkx4ox7r2RoABvQsVNtV3SUpGAwhKQCAiiAgH5jW0eVlNlmO/54O8vGHYhno5Msr8h5RjvhKA+RJePKH2JJbWv5QcXIioF2AekpK6MOKZP5dQAUkR72K0MFDiMKzLJEJlMytIQ1RQ4tK0hAkn1p3OZDrPelBEptnr1gRydW/dXWtI9FRs4hZ6VkAunAXWnAq3Z7BcblHqZdHqQ0gnzaRiebGuAflPGTQHXaW9dEk8hvbm56YgDjA8iaTb87h9Az3GntkAPWsNd49DrWxW0rVfa1C3YcpwT5x+mzS7Nr2Rpt6Qths
Received: from [192.168.200.206] (83.11.29.216.ipv4.supernova.orange.pl. [83.11.29.216])
        by smtp.gmail.com with ESMTPSA id tb16-20020a1709078b9000b00a3ce9081547sm2051268ejc.39.2024.02.14.05.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 05:39:32 -0800 (PST)
Message-ID: <4781f6c5-4a0c-4b24-bf8f-5fdc17b074b2@linaro.org>
Date: Wed, 14 Feb 2024 14:39:25 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Dmitry Baryshkov <dbaryshkov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, paul.eggleton@linux.intel.com,
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
Content-Language: pl-PL, en-GB, en-HK
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CALT56yOT_U9jVkhTP=zZu-32B4pta5zaJocn9695N7ari4cFyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 14.02.2024 o 1:26 PM, Dmitry Baryshkov pisze:
>> The thriving world of PostmarketOS only exist because Google was
>> clever to realize devices should have a developer mode.

> There were two projects that worked on reenabling phones and PDAs from
> that era, hack'n'dev and handhelds.org. I think both of them were dead
> when the Zaurus was still alive and kicking.

I left handhelds.org developer community in 2007 due to trademark wars 
when admins wanted to take control of several projects hosted there.

LinuxToGo was created in 2006 and some projects moved there from hh.org 
server.

Most of OpenZaurus/Ångström developers abandoned Zaurus devices in 2008. 
Usually in favour of Nokia 770/n800/n810 tablets.

Both OpenZaurus and Ångström used own hosting in handhelds.org era.

