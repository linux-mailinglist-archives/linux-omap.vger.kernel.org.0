Return-Path: <linux-omap+bounces-2444-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FA69A24AB
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 16:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C95EAB24DA8
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 14:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950DB1DE4CB;
	Thu, 17 Oct 2024 14:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGWkSBu1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390FB1DE4C5
	for <linux-omap@vger.kernel.org>; Thu, 17 Oct 2024 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729174346; cv=none; b=tvznNw4P3y0O7iwT3KTOE9Uw67xxiVOflwiGnqpCDU4O+Gcmy1Oepj51kREQdnQ6x88hu03y0mj+7/qkt93uj/pgVCLkq7ZP+pncJNaX4lNwCs6LwhuFj/nNR3fFidnjJgUtYHN7E45kHOppAf9Un8nSozdTqHPA27XgVrZD2L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729174346; c=relaxed/simple;
	bh=+CLHgFYbqBb0Bqgyob72RKVhcC6EPR+NcTtPmEIeA2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJFfp2KrqQXsH7Lp884kswjCnDpoM7XEaguklNLqNQtixnqaz/rN5PiHeKybXzvi7YQNkdBH5YjeMoR3ENECtC2LOROqOthuXcaxSxgmdOFrw8nRf/rzgdXKsOhCuvQz9p2wcNnxdMUvWJyT3yZqXjTI5AkybUePsGsXd0qDuUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGWkSBu1; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so660969b3a.1
        for <linux-omap@vger.kernel.org>; Thu, 17 Oct 2024 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729174340; x=1729779140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+f9IatUT5ct/NXnC0zBGj2T2UAUFwow8yn6R9NJqUEE=;
        b=nGWkSBu1dFMBBi1WFDDqnm280yVgxvfK1ATsAE7QLsXFa+UP2wmtoUhxgW1pTsisF4
         ssQ8srEgQCpCpRozSh5136tTmWvHd/2uf+DOknjjYTH+twrJmjOxEYIK97fQ8VHcwDvP
         5hlRll/n2HoTCADDguRoBP9TdHrLW/t0/jcU1Lb0Cd7lpG+UNPIXTguuZdTGhZLnlETz
         4lQbdYOhHkt1PMdD3jnEvSnUl03kNne3aK5cufQr8KipdtzGNx61kEoRDQfS0VpEN+yf
         /6wdiZJm4834l7XoY9A9vtQ0nBFGMQZj6djo+Bxl8SPTq51CKWkOEViQW7OYNEDkhJ3g
         s/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729174340; x=1729779140;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+f9IatUT5ct/NXnC0zBGj2T2UAUFwow8yn6R9NJqUEE=;
        b=RUxSJsQdKSAFwCeBnomZj3tuT+95+V/4dos2r5g3NXwVPn9BMYVcEU3MdGNmncvFHz
         1aa/LJEkZ9JHcb473JYFW7Kd8iXGyflVmSChkUic/dMX5X8nFLUmga7qu1XNJM3/AQ5Q
         O5BrPyOKpxMh/Ytc8UGxr0YXT4dloijlKt506G9Lk/qmi3RnkmhM6fYD75abSc8lvBHz
         MKAmOpSrrsheZv2Okx+ptKAEQtw10IHJH+nH3fQz8hW0DaXM9RHCUD8CWkW6ynegiDX+
         BCr3q9uICNtHGKFLnbqpLI+lNa31PxeR3APXaaKt2awP7/gwbeGwcOZ0AXBE3/YUwIcr
         ELdw==
X-Forwarded-Encrypted: i=1; AJvYcCXH5Y3pi6TWR33TqP/UTdqAoWuwiibzqycpcXJRgbnFgVfP5wjAnhMk1597sXBrX2TrPx4mZqBuxwKe@vger.kernel.org
X-Gm-Message-State: AOJu0YyP4I2o6yF90pfWBl9rHG6Sf/JwXbPjRX5NeXdrCSu/X7bJzz3r
	eGBkEoNHGFSY8QBh9cjMl0DN6M7Y3DVtkorolDQAlITe2AlvU/+Z
X-Google-Smtp-Source: AGHT+IGGqNz39xhKtgG8IIh60R1fuNBltlfScdtX9HaCpjpbQi3fdw4gFHWswEUuxKbORSL1UB2x3Q==
X-Received: by 2002:a05:6a00:9159:b0:71e:cf8:d6fa with SMTP id d2e1a72fcca58-71e7da61f1amr9335650b3a.15.1729174340348;
        Thu, 17 Oct 2024 07:12:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77370dfdsm4768096b3a.42.2024.10.17.07.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 07:12:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c354e331-39c4-4520-9a69-b62a8ecdddbc@roeck-us.net>
Date: Thu, 17 Oct 2024 07:12:18 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAFEAcA98=2OdT9ykg5ibDuVLtSXuq4g0PLmSbxkYmt1SyKe9iQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/24 05:42, Peter Maydell wrote:
> On Tue, 15 Oct 2024 at 19:12, Guenter Roeck <linux@roeck-us.net> wrote:
>> Please let me know if https://github.com/groeck/linux-test-downloads.git
>> meets your needs. For now I added 'collie'. I'll add more after it is
>> in a state that is useful for you.
> 
> Yes, that's great, exactly what we need. I've put together a QEMU
> 'functional test' case that downloads the collie rootfs and image
> and checks that they boot. (I'll send the patches for that out
> in a bit.)
> 
> (I've coded the test case to pull the binaries for a specific
> git revision of that repo rather than always-from-head, so
> we're testing always the same thing against head-of-QEMU.)
> 

Sounds good. I now also added information for sx1, so you should
be able to use that as well. Please let me know if you need any
others.

Thanks,
Guenter


