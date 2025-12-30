Return-Path: <linux-omap+bounces-5299-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C064CEA626
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 19:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FBF9303212C
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 18:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D3F322B80;
	Tue, 30 Dec 2025 18:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQ7L0AlA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375B42F1FDE
	for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 18:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767117709; cv=none; b=gSy2XmhEVDx996I1/9M3GAqM77alrz819zMWVJndESXbSx7FXQtv/jVU9pq41NKhct+xEvQadCeP//Tif506o4I1sqH16k6zS4LJctPzI8kRM2WOdbjuyO/oEUO39G5PTXT3lHnsjpMke1V7UaFZtOY+GlpnA4WziwgNk6pRuiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767117709; c=relaxed/simple;
	bh=qIiSEzgVDcgVsCIxFZLM6FM2Y/nR3K6GRD6w/1fsALc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0C/Hpdi/dXcjif/1iSYykGH63kDMhTmnDsm4SL9JXiVZzPkOTosJ9nT6yKZJPu4wGR7fluO4UpjMYenE3OJ4QWHMpAtTqz7VGFpCv5rxcm33E8/dS+kBzC2of2jL7PEMK2GvFXya7slhDHMLc7X+BqDvT9EVXAnhFBAJrKJSxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQ7L0AlA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0f3f74587so144511715ad.2
        for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 10:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767117708; x=1767722508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVU3dXZRNTzLxPhtD/PYUGsaxMaUV+wBqLq4ZJcCdKY=;
        b=IQ7L0AlAv22F4ogaVElNdEUWNs1agUXnlD1CJgV1FI2Lmi6NUCFt7f0htzoJ1aoAyS
         +R+a3WDMo2E7l/n+jNhP4//QNrtftfBxDLdSJ6K6ydbrZge4sl7f35S1HzrOCbzbkOBw
         tJu8jOoLU8vaRDCEE0svGx+66a/FhgJWDHzSMtOsw1jjkrKePhhpKCMvhcMuTtdLuEle
         9LcpJ+PKTgxufNARGKlRgtLRCUSUHQ0XVC7CH0+OIdkPzAKDz0oc5SqZtdgv7qnfeSpU
         fXSFL3e4hFZwzyOWHyPn32SFFLpPqkCULdKvJsxCoKB+h4APmuRtCFFWq+KjCbQYX0tj
         igyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767117708; x=1767722508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVU3dXZRNTzLxPhtD/PYUGsaxMaUV+wBqLq4ZJcCdKY=;
        b=gxIiK+p+aifxBh8HxKnInFpIQHCFw6w8Vk5N2tjJb65xhEe+ePcSYRjj0IrCOZfkzl
         n1l7ljWABDGl0fpaflLy8moxbYqar2cqqxtip7pK3K9x5HTjdLYtqYW5onFk/1V6EdVl
         5XpT8377cQf5dvoycjeFacQ1PStCE3cF+YwtakgZe0CGEbSqIMNm1ifH5Rv76tBo3Lmb
         ePGbCT3O/1BV3CpbGBSCfOqHSbrkEiwfn6LskU9Mu9pvziptyjEQ51C0rVaOZsudHz3q
         Xy5ymxf8RH7a1twVbFrIidnAgd1z1CC+wkowee45k7yYXwT22qXh9FJB2IU1pa5tQliV
         QImA==
X-Forwarded-Encrypted: i=1; AJvYcCXsc3hX3zTH+jOwLJfNBj6iaWD27/W0zqBt9Uakc9xnlZce3KcOizE9rT/A1snb3mE/BAwMWzd5Ycik@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7EhpOr9CjC89pZKm4PRG8aFH71gBh72Wf2Tr+lvu7MDQcnKpU
	A4H4iTY6y8+cg2A1iswmn8NeY68b1T9dlBh+YJqWq09GNKP91odFjpKS
X-Gm-Gg: AY/fxX5jcCOKB4gE1uUVQFcRMCdtZ4GbXGM/5HM4jjTi+brwgJ2UytXa7104x+J3+ne
	7/KF325T4uhP4X3o5s6rThPxPNkSxWgOi1BdfCHVBMslDvKu2aKNBh35KSEj5i8z2tXqOHMftAT
	K7/EHznQCDjafpYhB83ZWlMrxm0N9/9i8ghMuq6fVTxJfXiat0MuChus9wY0gLDhV+unrZu6Yvh
	K2i+axdRPvmyX8TG26GGT7tLWtJH+qVsoJE1hGdPzu6r9N0shYuvqqZ3rkSw9JhxHQfr35bqSp1
	wZGPrP5LwB1YhCj7U7/i+gqn00vqYevFXCpGIVZ+KOvvExvJJYmx9sqveZh9r23p9QusvlVnpSq
	MdVSxftQYtmhMBtmgAPrlf6UWZCqpi05urZ/CN3PwVPYdmX3q+2mpmBwEh8EMiRc8h1+y2Cs5CF
	nREKwZV9w0khKhDdgM96WQwBwjKL0ExFBQ+e6ETO9BQgzSyAu+vcYTYgIhN7dm
X-Google-Smtp-Source: AGHT+IFCY5D2OrgQbO8T1ac5XgJ7Dh5PRosYfy4bjpWjfeV/DmYMVgVyyX6wvp70OFg3Iu7Fy2RfYQ==
X-Received: by 2002:a17:903:38cd:b0:2a3:6b54:5d42 with SMTP id d9443c01a7336-2a36b545df5mr162573995ad.59.1767117707570;
        Tue, 30 Dec 2025 10:01:47 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:d742:b62c:dcc9:47cd? ([2601:1c0:5780:9200:d742:b62c:dcc9:47cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d2c6sm301374495ad.49.2025.12.30.10.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 10:01:47 -0800 (PST)
Message-ID: <081b59e8-e74b-4af6-bd31-00ebb4e12e5c@gmail.com>
Date: Tue, 30 Dec 2025 10:01:46 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org,
 deller@gmx.de, gregkh@linuxfoundation.org
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-4-chintanlike@gmail.com>
 <aVO5X0NKSdkH6Ab5@smile.fi.intel.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <aVO5X0NKSdkH6Ab5@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/30/25 03:37, Andy Shevchenko wrote:
> On Mon, Dec 29, 2025 at 09:28:21PM -0800, Chintan Patel wrote:
>> omapfb provides several sysfs interfaces for framebuffer configuration
>> and debugging, but these are not required for the core driver.
>>
>> Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
>> optional by using dev_of_fbinfo() to obtain the backing device at runtime.
>> When FB_DEVICE is disabled, sysfs operations are skipped while the code
>> still builds and is type-checked.
> 
> ...
> 
>> +		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);
> 
> Still the same issue I pointed out in v2 review.
> 
>>   		int t;
>> +
>> +		if (!dev)
>> +			continue;
> 
> ...
> 
>> +		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);
>> +
>> +		if (!dev)
>> +			continue;
> 
> Ditto.
Sorry about that. I had actually made your suggested changes but somehow 
I mistakenly send old patches instead of updated one. I will send 
updated one. Should I send v4 or v3 is fine?




