Return-Path: <linux-omap+bounces-2446-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CB79A2691
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 17:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 180AEB21295
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 15:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E161DE8B4;
	Thu, 17 Oct 2024 15:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAl1XiS3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473431DE3DA
	for <linux-omap@vger.kernel.org>; Thu, 17 Oct 2024 15:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729178954; cv=none; b=NP8YJL/Kll4aVnm0wfndOi/ZVVoQRYWq0Wxbk2AEMfo0+b6ydSK+EKCKaU4rFLeBXjVEAh1vMhO0uoUR/m8L0DVYEksCwT3zCF+7xD8iLQuZ0G6aa4BLms4G/RY8KxLQVGfovvHaHSpPwqSe3xrWKV3Xxxks1wJAFGUMbUy7tOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729178954; c=relaxed/simple;
	bh=D4Dwezf9cVgTjztc6WUG4t+1tcSiiGb88iFZR1uYV98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YV8E9cszXkMEDO1KifYMnHLVV+7NqSQXlvrAGKsEvIDyag+/9kBvITxXUt85S1AMhjNMnr9SQl/DFMX+KxtHWU4HuD/Ytpxzxs97Y6jpGyonl502iaR/3zseMnlRCeaoqzgYRwXgrrm/+cTuedVYSj4+xHwKUPhrHSiUtyxjQsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAl1XiS3; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso751468a12.1
        for <linux-omap@vger.kernel.org>; Thu, 17 Oct 2024 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729178948; x=1729783748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KZ0JvDz3nBe6+JNj2gDq0L3Vc6DrKZQHWdXEE6hcI6g=;
        b=lAl1XiS34n5y2Se0mBOSzN+DCRA6OlGkWODezcdNPKgvE+E+W0ayxNu7knnX9vv3LT
         CMcEDIKnp8KjiL0mAA9xWmPi/mc4hl+SzPZi/um8bcSR8ffoS+eZtist9Bg/BMZYTV9K
         +YwWcRVNDeYfFvxx41ZT/AgO5roJ7nXF9nN06MrXWGI+5djr1iz4RHRruM9YIgZSVOdg
         t3AGY7+/CKoJShzF/l1LL2Im/PDE0FTtsxunkhakIzORPjDFwoanPCtv28bVXolBWAoA
         BMmr0Jj6ebAeRms+ou+k488KYKgJg+qR3qSA62jAS6ezYRSgEgtH/XOXp54DtX0aoTqQ
         OzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729178948; x=1729783748;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZ0JvDz3nBe6+JNj2gDq0L3Vc6DrKZQHWdXEE6hcI6g=;
        b=xUjS1D7+AG+Ppbs277KcbKHvmAa9nZbj9JTpAGbIshrOSO/NwMIuPSyyHWNOJwyU/f
         vi6UKWVS0nYXdu8gVkO3l2cXI4xELZya8nJ7symIrodPRicyFEz/AEKZmQZZzlhMcdpO
         Lpokn1K9NB/lkjrvG6opkoq7Hd7xJxwDlND8L0VwEF2rNVTlOuQhAVHoBNktilvaJFk2
         x56LP59HH+B+IbQfn2ZOFTaAMf2VXnneo+jcdG/i++WCRwmbfpTHwF1Sh9A/eq9HJvz4
         a6hqLjPG1SDG9/wxiqjgz46dV97OyUXCq3HhnGtjnoBsfxriMqV/Gg0x0oeP9jwlipQr
         +Xcw==
X-Forwarded-Encrypted: i=1; AJvYcCWRBOlRQnowkAotKVcBK/9xwYTilqrPi916QKqaWK/YbYP4CwD1e8vbY3YtsSubDOTdXXAkIp7qjQyg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Xnsf7Q3OaqcLROsp5LmsG6cXBM+zRPScWo7DOPHXPeKkuKUF
	2VveLAJ7wz9fGnH7RXi/KTx+f8Wmi6llHB0XbYM9fsrnVp6O1GVT
X-Google-Smtp-Source: AGHT+IECzL/hThNuZnochOrHD0c0xPJHBUiO+Mg2caiVBArqfexhGhJrj7H44LKUqTBW/t7aVRJ3Xw==
X-Received: by 2002:a05:6a21:7893:b0:1cf:3f39:c469 with SMTP id adf61e73a8af0-1d91c627e67mr5563910637.2.1729178948428;
        Thu, 17 Oct 2024 08:29:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c71320bsm5115140a12.77.2024.10.17.08.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 08:29:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2e8046a2-c229-4ed5-add1-d31f437325b9@roeck-us.net>
Date: Thu, 17 Oct 2024 08:29:05 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Thomas Huth <thuth@redhat.com>
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAFEAcA-NreDmpCoFgrTJ5dEto5jQbjRg1eCfqg9Ns8VwQ9-Qzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/24 07:29, Peter Maydell wrote:
> On Thu, 17 Oct 2024 at 15:12, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 10/17/24 05:42, Peter Maydell wrote:
>>> On Tue, 15 Oct 2024 at 19:12, Guenter Roeck <linux@roeck-us.net> wrote:
>>>> Please let me know if https://github.com/groeck/linux-test-downloads.git
>>>> meets your needs. For now I added 'collie'. I'll add more after it is
>>>> in a state that is useful for you.
>>>
>>> Yes, that's great, exactly what we need. I've put together a QEMU
>>> 'functional test' case that downloads the collie rootfs and image
>>> and checks that they boot. (I'll send the patches for that out
>>> in a bit.)
>>>
>>> (I've coded the test case to pull the binaries for a specific
>>> git revision of that repo rather than always-from-head, so
>>> we're testing always the same thing against head-of-QEMU.)
>>>
>>
>> Sounds good. I now also added information for sx1, so you should
>> be able to use that as well. Please let me know if you need any
>> others.
> 
> I think sx1 and collie are all we need currently.
> 
> By the way, it looks to me like QEMU has a regression
> somewhere where we can't boot that sx1 test for the SD
> card version -- it hangs during kernel boot waiting for
> the MMC card. (An elderly QEMU binary I have boots OK.)
> I'm looking into what's happened there.
> 

Yes, you are correct. I did a quick check; the problem started with v9.1.
v9.0 boots fine.

I didn't notice since I still use v9.0 in my testing.

Thanks,
Guenter


