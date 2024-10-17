Return-Path: <linux-omap+bounces-2448-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A9C9A2B74
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 19:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B77A1F23195
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 17:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A7A1DFE10;
	Thu, 17 Oct 2024 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dX26kejy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AC51DF978
	for <linux-omap@vger.kernel.org>; Thu, 17 Oct 2024 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729187636; cv=none; b=jg2FNeyFfEIVSIJCn+12X2XTX4jyuk9nlIfvV3Poq3o72SIHCsPkgOZx8yFHRZGtG02Yy2i858rMgA+VhxtBBcqrA9QF1IyabUtGMZ4k8BPSIAXo94ZTJlvFfBHjwAU6qD1POmOXQI/E0dezpGWyqo2CJqnnyrAQb9U6gkbboDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729187636; c=relaxed/simple;
	bh=GF5Qo9DhkPse5Mx5TYP1+75YoCNUfAkqZFVDx4Xpj68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dtIJeHO4iFo8kyM5dEVs5OlpAStPIIVpptOElWJmTtQUnEPbxoyvnW7iNay9FqkiWVas/ydHTQJbYV6vMFISRZPe70tRpefmLlX+lpEZqPYbBvgWD0MsaXpSpAA7j8oyiZm/QCGlOLXwE1qdt85LY86SauQ2fS7BMOzy0WgwPlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dX26kejy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c9978a221so15788495ad.1
        for <linux-omap@vger.kernel.org>; Thu, 17 Oct 2024 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729187631; x=1729792431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=02oeOFeK7jtYuCzX8W9dU5PdVKq3pbuOMiR05+cTM30=;
        b=dX26kejyLWT2M5iuxTFq0nqK/Ji9BbU+OhgLZIkplsU8mVJ5Vo284KLS4XuwvD0dFD
         kkjppWkIrtXhzxMcIAjbSiE23PSTVZKTfMD7wluQACF7YvafXJCyee1fD05F0fsbFLxU
         mvFEE5L3p76RMktM7uiiWHYn22L/Fg1EBIuAQNfvo+9GRrqq1dxNo6m5VyA/HRGekH7I
         0SU3za0KMoJgtL5Pph1XbiDZgzB7mR+Np+ciMynU9AgD7HkDYVWRlCVSq6oIICBA+VPc
         NC0LfYEmKjumAeTXupXzBJr5ASVYNB9L31bxyzSLn/nweW/Z7Iw5x9vxab0ueCLGNNNA
         L03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729187631; x=1729792431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=02oeOFeK7jtYuCzX8W9dU5PdVKq3pbuOMiR05+cTM30=;
        b=aKHfW60AcI5GPM5TjGpVEAsnVjNp4ObmuUOX1r5wbEHXT2L7ZgPVy80xeA9G//W16j
         ubG9fI3TSWuq/a9+bwF/eRJSjSw0OG1UQFeMOA5OXo4UtY3bNLO7IlXH/RK0e0RzYPNJ
         NL/lOZZwfecSlxLsgTsAedLs1oYBSf1URVLT1QllkFDqE5AKSRV0AdA45ZbKMKzTXdyr
         k/jvPK7A2YwQyPH6q9dnvcaE0/ZuI8bYf2qW5FqhVlFrxiLJIueWWMk5kOtZ/G5khzIp
         tktrWF912UhYsgRE9NAPmVldhoRfTquhZu+236xdfD//l2/5w+mJklfT3l+FMSBiagWo
         k8dg==
X-Forwarded-Encrypted: i=1; AJvYcCVJBEktN0h/SZ9JaGK4fqCPxsO+mPuQDxZ+cFLh64O/eoEG7kf8MjZk9zEg2DfxHJaj7bSgefD0hRa2@vger.kernel.org
X-Gm-Message-State: AOJu0YwIO5Etxn6u6IJFJiWw5PFslO8JfpaBaWirHV/nt5C/fl2+AsEQ
	92kK7fbzArOLLFn+OyqfzvnBOEm7lAKte2VuFAmCL/i524itks7ffOxPUrxuZJQ=
X-Google-Smtp-Source: AGHT+IGyA7u1b10iGVQrb28N/d5XTMtA2jAsrnF1YFrxdnEHtsgbGORXNhMnwGLviCOX5FjE3mCQ7A==
X-Received: by 2002:a17:903:22cb:b0:20c:9821:699d with SMTP id d9443c01a7336-20d27f41966mr130474815ad.51.1729187630791;
        Thu, 17 Oct 2024 10:53:50 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f9d321sm47037755ad.68.2024.10.17.10.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 10:53:50 -0700 (PDT)
Message-ID: <5b6e9f3f-36e7-4b0f-8698-15a419095558@linaro.org>
Date: Thu, 17 Oct 2024 14:53:45 -0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <CAFEAcA_-eTfF8tVaLk4yLgWMSA1+KjPBYyS3EjMQNC+59hT0Aw@mail.gmail.com>
 <CAFEAcA95QmpcsrgCj5uE-Ng8ahNir3MuVEHWBCvjb3UwBbOFRA@mail.gmail.com>
 <ec0e8a75-c59f-41b3-b559-43c057fca8fd@roeck-us.net>
 <CAFEAcA9AZS1dGaLG85zZE8U0d7AcrLgKXNbhxkCoP+PLmbFn2g@mail.gmail.com>
 <cf7c8f57-22d5-4a40-bd87-0f15f5457d48@roeck-us.net>
 <CAFEAcA98=2OdT9ykg5ibDuVLtSXuq4g0PLmSbxkYmt1SyKe9iQ@mail.gmail.com>
 <c354e331-39c4-4520-9a69-b62a8ecdddbc@roeck-us.net>
 <CAFEAcA-NreDmpCoFgrTJ5dEto5jQbjRg1eCfqg9Ns8VwQ9-Qzw@mail.gmail.com>
 <2e8046a2-c229-4ed5-add1-d31f437325b9@roeck-us.net>
 <CAFEAcA9AfH7cTO8TYSh9E+FnYN8SbTLDkXW8W5Jwi9Kfcddr6g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9AfH7cTO8TYSh9E+FnYN8SbTLDkXW8W5Jwi9Kfcddr6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/24 13:07, Peter Maydell wrote:
> On Thu, 17 Oct 2024 at 16:29, Guenter Roeck <linux@roeck-us.net> wrote:


>>> By the way, it looks to me like QEMU has a regression
>>> somewhere where we can't boot that sx1 test for the SD
>>> card version -- it hangs during kernel boot waiting for
>>> the MMC card. (An elderly QEMU binary I have boots OK.)
>>> I'm looking into what's happened there.
>>>
>>
>> Yes, you are correct. I did a quick check; the problem started with v9.1.
>> v9.0 boots fine.
> 
> It's an issue with commit 1ab08790bb75e4 -- when we did a refactor
> of the SD card emulation we didn't notice that the omap mmc
> controller was also using the sd_cmd_type_t enum and relied
> on the values of that enum matching the meanings of the
> different values of the controller's MMC_CMD register Type field.
> I'm just testing a patch.

Doh indeed I missed that use in omap_mmc_command()...

Thanks for the quick analysis!

Phil.


