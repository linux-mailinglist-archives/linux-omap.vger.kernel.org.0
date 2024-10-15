Return-Path: <linux-omap+bounces-2428-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C35599F4EB
	for <lists+linux-omap@lfdr.de>; Tue, 15 Oct 2024 20:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22D501F22879
	for <lists+linux-omap@lfdr.de>; Tue, 15 Oct 2024 18:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189641B21BA;
	Tue, 15 Oct 2024 18:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aovbXWg2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E582038DC7
	for <linux-omap@vger.kernel.org>; Tue, 15 Oct 2024 18:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015941; cv=none; b=bdLSfya243JekRIbjd7j6q5fxKUk7xskDW2zmK8OaMNF4zz7QuplnN+q5RdeyGrI3NPm+6SBIn4U71HoIhaf80TtGQhHSy9EqBQr6z0bePU/k8EMaMVafS0sJbGLMjK36BajJf9SxytCiGs/2sd/pPrsy2YqIEFF1NwONoBQghg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015941; c=relaxed/simple;
	bh=o3xTGKWw14K+2YCJ350EN3k9Ov8FIsTtbvqG2q9t+Pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pat6e8cig+RogV9r4Ol17Y0VimMzgTm+T3P3T/SKhh7sti7fHnRGmNHGLZ32DpxkrZLwCSjwI0xqtLVr1PuHxBkG6AwdjbQUn7a3dpmN6TCyTPaYHxMHrlZayMAVEkp1mh9s/ls3AdveweFs6YE22/ycvHBgmxHrOTfHzxJ4GUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aovbXWg2; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e2ed2230d8so3284953a91.0
        for <linux-omap@vger.kernel.org>; Tue, 15 Oct 2024 11:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729015939; x=1729620739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=o9gbxtrbkwmYfAu8IPWm7lrkELPbP+4od1knPrQZ4d0=;
        b=aovbXWg2DQfyJPfs40BIUTXTEKje2K+blteXRhORDntBVnZ6TiMrB4TyU5PrupnFdZ
         +XMhoGB/HIrERCrzG8iDuqsZ3s2+fQAQTp4R7vcwr/3H+9TRERWd7loE2vXPa9kaTPrS
         SAm3wCEN/atVH5HoBkvEABRpUmeMED4Byv9Cf/CujwRXiViGTVsoxWrRngnegxis28w9
         iVoXoHvWvPHiziABxqyD5ccVoCNiTt7XvR8roTPB9LTpHoAGqEIqp8Eq4SFnppvP8+01
         OPngNXX9nptet0KpXH99H0aeOqFBQjSfLzwLzIscJgo+oCUyUuUeNxkZYoYLzDyKhRhW
         UBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015939; x=1729620739;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9gbxtrbkwmYfAu8IPWm7lrkELPbP+4od1knPrQZ4d0=;
        b=MTDCA9/pMQZg6bcwfBFiSckl+wI5IiJbR5XYJVsYc1RT6kStZn98tKSKn39hfDFtQy
         ZIkbUAxBnlNttTlayZNqauwEeuN5gP5t6b8UpbLn2ngGI70qt4KsCEfqSnWHqcQAmVUb
         XOZBejdGTcB0Utt78vlHaAGbo3Q1jOAPwm/UwUbidml5nASYiYnjbe3fbfT1dQzjXBNY
         xfBn3ovGOBUqAZxx4wzvLE7OhKgugzFzpwlXRZJI28lmFeXh+2FPWQMdua4Iriyo+qvO
         7MX8/o1RpaInw8E8DU8fEALqBRXicQfm8iNNmuq1YXkIFWZLPyxqFDtMd7g4af5Q3Ch/
         FvzA==
X-Forwarded-Encrypted: i=1; AJvYcCWOSvJPn7D7ev4d/8ptsW+i+LM1LDpos/ajC/hQmnNJwSIkJ+V39j22fXso6eBEfq90t5R4j/IhGck0@vger.kernel.org
X-Gm-Message-State: AOJu0YxBwFXCmYNvCk7dsED4RfaIkV1wxw/FB0249j34QyAEWqDijQb6
	6VL6akFB3xz4U9lU9B5pm66cV1TP4b45OAwEaoyQ/IkV8kUMnw4B
X-Google-Smtp-Source: AGHT+IHvcmO5BATRNEmo8TJ+o91bxbQqNd5G+G0SL9TeJoNgQ8tXH4FgIOx0JejVbSh+yUSv7h6rZw==
X-Received: by 2002:a17:90a:17e2:b0:2c8:65cf:e820 with SMTP id 98e67ed59e1d1-2e3151b7869mr15214998a91.2.1729015939103;
        Tue, 15 Oct 2024 11:12:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1806c1c0sm14926035ad.301.2024.10.15.11.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 11:12:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cf7c8f57-22d5-4a40-bd87-0f15f5457d48@roeck-us.net>
Date: Tue, 15 Oct 2024 11:12:16 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAFEAcA9AZS1dGaLG85zZE8U0d7AcrLgKXNbhxkCoP+PLmbFn2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/24 10:35, Peter Maydell wrote:
> On Tue, 15 Oct 2024 at 18:30, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 10/15/24 10:13, Peter Maydell wrote:
>>> On Fri, 8 Mar 2024 at 15:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> Thanks to everybody for your input on this thread. My
>>>> proposal is to drop from QEMU:
>>>>    * all the PXA2xx machines
>>>>    * all the OMAP2 machines
>>>>    * the cheetah OMAP1 machine
>>>>
>>>> leaving (at least for now) sx1, sx1-v1, collie.
>>>
>>> This has now gone through. I'm now looking for test images
>>> for these remaining boards, so we can keep them from breaking
>>> when we do refactoring and code cleanup/modernization.
>>> Specifically, I'm looking for:
>>>    * QEMU command line
>>>    * all the binary blobs that go with it (hosted somewhere that
>>>      doesn't mind when our CI downloads all the images to run
>>>      its tests...)
>>>    * ideally, exercising the SD card interface if present
>>>
>>> Could the people who are still using/testing these boards
>>> help here ?
>>>
>>
>> You'll find everything at https://github.com/groeck/linux-build-test.git,
>> but give me a couple of days and I'll create explicit information.
> 
> Yeah, I had a look at that but could only find the rootfs
> and got a bit lost trying to figure out what the QEMU
> commandline would end up being :-)
> 

Surprise :-)

>> Is it ok if I create a github repository specifically for this purpose,
>> or does it have to be direct file downloads ?
> 
> A github repo should be OK -- I'm pretty sure we can download
> from there (e.g. we already download some rootfs images from
> your linux-build-test github repo).
> 

Please let me know if https://github.com/groeck/linux-test-downloads.git
meets your needs. For now I added 'collie'. I'll add more after it is
in a state that is useful for you.

Thanks,
Guenter


