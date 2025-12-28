Return-Path: <linux-omap+bounces-5268-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BF6CE48AB
	for <lists+linux-omap@lfdr.de>; Sun, 28 Dec 2025 04:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B320A300B994
	for <lists+linux-omap@lfdr.de>; Sun, 28 Dec 2025 03:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED8920E6E2;
	Sun, 28 Dec 2025 03:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxtdmndS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6E31EEE6
	for <linux-omap@vger.kernel.org>; Sun, 28 Dec 2025 03:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766892966; cv=none; b=usoFR4UF9/KZEPnKAv7mfDB/rmAjStybwPGvEUUiuWV1XB42VEyYvuFqHG+NuySD8faNvwBm/MHariaCmLxbZdHFRv6loe6alMBfPPG9+GePeyl7cfMura90ibGeYUkpCkH6Y9jbanZov7L43wEWh9HQyKADoyRcMJBJ9646wkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766892966; c=relaxed/simple;
	bh=7y9+JG1YQScaKpsvlkoSJnucnQXf3X7/A1e5+m7XKHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uelQz2dNY6bjm8qq+XCTpCiET2mibkqEEqi4mhLr1M8szgv6NPRh/hDqlmNTUNQlY6GVROPp0QCvso93pwLtdHop5gvlP7p87vdk+cqerFjekFYgV/KY0grSAKLFGHa4XPQKfebOF3SdP/BGsQd8A+KvyO2pyE2gq73YwLzdIEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxtdmndS; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso8220695b3a.3
        for <linux-omap@vger.kernel.org>; Sat, 27 Dec 2025 19:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766892964; x=1767497764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GYMWvgynMfX2fSBNVCofj8NHTkRdY3lznnd4Y2OMfk=;
        b=HxtdmndS1Noqr2WeL7zWCJ/WqexmSiZ+Mgm/vU8W/AYYcdCEHhhLnn7rBoVPgCIgBq
         S8wf2TgjHslZZuq5rKD24OpxbYa5wEeS/nUgl3Rg2eUTUISkTDKicrB2oNI4Gguz2Nqr
         e/a1CiS7NV02dyvz+ALCFSy75+mYulsNB4XMDVjqq5q+KfbmOKF4cqLjXjQMZUUMGQ42
         eF0faNdCeYsIHNwhW7IoHU+zHPn6r3+hc7x/5aSZS8LhEQkNHWQCY/gg/xb24ljuGshY
         FyzSSrf6B43PgvRcBE4GZ2JimG98QpQvzl/ATly1TWt8dkku20TxyqHdKSdlcU+1qYTJ
         2eXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766892964; x=1767497764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GYMWvgynMfX2fSBNVCofj8NHTkRdY3lznnd4Y2OMfk=;
        b=EWuWWC3tPwNBvpTEJ6gmmzUGQjo/RcHB8NOZ5jjaBhCZwa+G6jFz/BkAcUTu5PoGB9
         cMI0sVGyiUUMji4LdfAGmRJm1YBL0++rKBS+qXAMtzYVcPKV0FU8Eof3VN+dOn9c7Fvl
         oR9GHOINJUAooB6jUWYHaozO/Kj6BmVKhpzBX9DisnYph/ps43jM6cnHXOWlIVQ3Rp2N
         PlZXk0rcmczTmn8gu4dgsY9CHrgmnjl++NLYJGdolH4TflxmrXuCpHNsFf+mRxPPzW3w
         heyyScxET1ciQvQI4sjFoH/ErMW+kKitJRsQeTK+8Nph0vPmjL/UNKLjBYGMIF55rztl
         uy1g==
X-Forwarded-Encrypted: i=1; AJvYcCWrGck2F1VkoNEpkcXMVLFGHcDS13ld8oEp4NE5N7scnbi8M48x+J36klbLcx8Lt3h7LX/bw86WVt0c@vger.kernel.org
X-Gm-Message-State: AOJu0YzcJDuHUtd8qO/zsbC8zOH+ceRPlyaR1Amdcak9Pwh9vErY98wi
	p6pdgha1U7QMvCkK6Xb5edoRbXTjo9+v0Tecta4n873+c5V8deQHvt2v6vs9RUQi
X-Gm-Gg: AY/fxX6oehiZKuJNtCnHryycNGHrZ93A9QDEeTRrcv5jup08g7iSt9Ddh285wbrOM56
	1dCcr0mHsohjc/AdDQXABJ4wtKx2bOEf35qx1+x/cA3XwI7FFHypp62D5/zuczD6LQ/uD31JFl2
	37pz6P4jI9Y0YGYBiuhWAMY8aiZtES5tOJjwr7h5a5PJX4m+VrQDaxw1PlYLPmB9I6W+9mZuimX
	UE+TKYYw1li9VabF1dZGIuwRZt68pNP/GbXscsL7g/26jMCZDvNMy87kPGbs27hUqFUx9/JwZ9g
	HZ3gYnVQB/32KVBzGL4i85KX7a4gtJc12PP1L3bEZfiVGM+pv24QdoXHY6C4YC4eaY3xyRMY919
	wdM4cGXF0MGprR4/g88UK8s+vwP0atfn4PzFXnuqJr/eBliLDOUVDdSyjAWiNZpQhAPAS4xXw2P
	tbRxyWinaexAbqSHKUnmlxZ4Rhr04unZxy5sF/4Ne9Y+wNlw8XzLDPXeZSnFBH8e1LFpFYcBY=
X-Google-Smtp-Source: AGHT+IHTWL3q8c+FeXaSOBHPaw/cADChxlI8DiI1o2Cg5IPCvZurA0tG1OaDi1zTnHTBCrTFoMuu6w==
X-Received: by 2002:a05:6a00:6caa:b0:7e8:450c:61c2 with SMTP id d2e1a72fcca58-7ff66679603mr21673397b3a.50.1766892964131;
        Sat, 27 Dec 2025 19:36:04 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:a91e:86e3:6d78:53d4? ([2601:1c0:5780:9200:a91e:86e3:6d78:53d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797aadsm25834180b3a.61.2025.12.27.19.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 19:36:03 -0800 (PST)
Message-ID: <ec86f093-8fe8-4fc8-b330-dc7ee8a01de9@gmail.com>
Date: Sat, 27 Dec 2025 19:36:03 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] staging: fbtft: Make FB_DEVICE dependency optional
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org,
 deller@gmx.de, gregkh@linuxfoundation.org
References: <20251219054320.447281-1-chintanlike@gmail.com>
 <20251219054320.447281-3-chintanlike@gmail.com>
 <CAHp75VeLF8nd-JiPFnxJ2H43ZS=oYgW4=BTZjR_GuUuj03gyRg@mail.gmail.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <CAHp75VeLF8nd-JiPFnxJ2H43ZS=oYgW4=BTZjR_GuUuj03gyRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andy,

On 12/27/25 06:19, Andy Shevchenko wrote:
> On Fri, Dec 19, 2025 at 7:43 AM Chintan Patel <chintanlike@gmail.com> wrote:
>>
>> fbtft provides sysfs interfaces for debugging and gamma configuration,
>> but these are not required for the core driver.
>>
>> Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
>> optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
>> sysfs operations are skipped while the code remains buildable and
>> type-checked.
> 
>> v2:
>> - Replace CONFIG_FB_DEVICE ifdefs with runtime checks
>> - Use dev_of_fbinfo() to guard sysfs creation and removal
> 
> The place for the change log is either a cover letter, or...
> 
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Suggested-by: Helge Deller <deller@gmx.de>
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>> ---
> 
> ...a comment block here. It's not so important to be in the Git
> history since we have a lore.kernel.org archive.

Thank you for suggestion! Will move to coverletter.

>>   drivers/staging/fbtft/Kconfig       |  5 ++++-
>>   drivers/staging/fbtft/fbtft-sysfs.c | 18 ++++++++++++++----
> 
> ...
> 
>>   void fbtft_sysfs_init(struct fbtft_par *par)
>>   {
>> -       device_create_file(par->info->dev, &debug_device_attr);
>> +       struct device *dev = dev_of_fbinfo(par->info);
>> +
>> +       if (!dev)
>> +               return;
> 
> 
> The better way is to decouple the definition and the assignment in the
> cases when it's followed by a conditional (validation check). In this
> case any new code added in between doesn't affect readability and
> maintenance efforts.
> 
>         struct device *dev;
> 
>         dev = dev_of_fbinfo(par->info);
>         if (!dev)
>                 return;
> 
>> +       device_create_file(dev, &debug_device_attr);
>>          if (par->gamma.curves && par->fbtftops.set_gamma)
>> -               device_create_file(par->info->dev, &gamma_device_attrs[0]);
>> +               device_create_file(dev, &gamma_device_attrs[0]);
>>   }
> 
> Ditto for the rest.

Will do v3 and re-send. Thanks for reviews!



