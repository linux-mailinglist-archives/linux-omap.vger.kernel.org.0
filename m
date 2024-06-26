Return-Path: <linux-omap+bounces-1603-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E6C918A0D
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 19:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CD8A285DA4
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 17:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803DA18FDD0;
	Wed, 26 Jun 2024 17:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdUVmVg3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7450A18FDC2;
	Wed, 26 Jun 2024 17:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719422808; cv=none; b=CXimqca5vaRHCZHsdLd1dWFO/TuE0JlycpdUM6IzZWSGq1hsyV1QFuhIJnNk7wW1EOpJnb63uD9aRHuh3OpXVC1HaHmS406tR1JYADoDoDEvg1pQzko3BkJL6vQSvwWXIYmEnxbJ6om7+lurWj5Ky0ke7AqfyCYA5+hgsql7FHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719422808; c=relaxed/simple;
	bh=UfVULBsUPsiESbCKcjmUM7T+z9/cgFWMHOmskyB8oRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tiGX7pIxlsQyGuPdBHNPgVH4etryvSKAn2IgDInlqexQ3714o+tlQWJnnzBI4uvbsYNiVwkuQnEbW3gY5uvNr3AgwCl5PHl/llnLBfRXXldWAavLNO6yHF/8DfDGsG2tgPtAa0o9SzAaabXARK8/pT9IFM/6EZ1OrUz7exBaxGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdUVmVg3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-424ad991c1cso11957185e9.1;
        Wed, 26 Jun 2024 10:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719422805; x=1720027605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2eWvakV/SmwEdHBsMILQHJAV8O018vkciNVSeghp/wY=;
        b=UdUVmVg3kUxEZSUKjh5bS53rnezeidgdFF7wwzSIRxK3OitZESTPVB3QGqn5OmNAfj
         1oIysSlcg7c6Zc4+E3hDB8Lk1ynGThMTUgl0P+yNZKYHrSTC6/QchBnY0A94aIdQGp5Y
         5pJ5KIW4faXmWiHpF4N3l6x8s5lDIe7yX2gsCYHYZReYms48flp3lB1YUpo9bJIATxss
         Zrbejef1Yu4SxgC3JWwfmSAbrEpBB8pF7Hd5FFWr8BX/9/I81qUu5LtY1yFdx2EQ0P3K
         +uC329W2j94ZMpUWyESKSwqp/2c+OcqRoET3uoXgtPa04egIe7kpO5vuYQJ0ZqBqb5HN
         2Hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719422805; x=1720027605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2eWvakV/SmwEdHBsMILQHJAV8O018vkciNVSeghp/wY=;
        b=Lpbg5HkC/gEFjCHjbehWV+oazCPQl389QjSVPsKp/wHlNpkls7/9EyHtsnkd6tPk5j
         etF0fb6cCv+YIo2UJoIGGASoXBfJqxBjkgyxizOtbVNGXGz7bVhl7CmLGoNHDOvgBWgx
         hbpv9aDRZD2xA9AVAJloWTkX43aHJQZQvCfovQlSVXPOtaRCaaMKokxvd3GlZxt34UzA
         RVxuLm8uvGXbmXaB/RjClyCCcsdOrzk1gkHJAqh9O4YFY5D7fDKPyn0+7hOpub+v5aMC
         aMfqWExPzb1ZMJFtXJiN00XGaQeltpoLd4QjNuaPirvR0UTP78xB7WlMEq58Wh4gO9Ta
         ajQw==
X-Forwarded-Encrypted: i=1; AJvYcCV3ioDgxwJX2/+OanILAiHGhO7bZuOXMW8+qk8N0G0h7OHrVu+8Bc21Wgf5cTtHKTI9psgxxPmcWamcR355EDEW0QIG050mqpS3BAaYUFA1mM2rC0FfC24/pqSKtAixjGSoNqpptRSFhbie2HiWoXPlu+ktbKDUddSPysS+jXlqt22Sod9WovrDSw==
X-Gm-Message-State: AOJu0Yw3XFyvrmW0dRXq+utJPX7pZTlMpcqi84MOUsPYKM+e4D52CQAG
	VPOWdVocJSryDRFW1gKdFFqGkOsBa1K0KYW4bj644u7AemL3zH4OvgpILDQo
X-Google-Smtp-Source: AGHT+IFgVZndCVwzt9PNZPRHcAgriQt8qHU8OONg75lIR71l+VeajG5nazqVX74457cGFcDm/bVB5g==
X-Received: by 2002:a05:600c:4f07:b0:421:dd8c:35a3 with SMTP id 5b1f17b1804b1-4248cc586d0mr90589425e9.26.1719422804534;
        Wed, 26 Jun 2024 10:26:44 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c84245fbsm32799745e9.38.2024.06.26.10.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 10:26:44 -0700 (PDT)
Message-ID: <5bfebb11-eee1-4c1e-bb2a-7c3b27d2af7b@gmail.com>
Date: Wed, 26 Jun 2024 19:26:42 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mfd: omap-usb-tll: use struct_size to allocate tll
To: Lee Jones <lee@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20240620-omap-usb-tll-counted_by-v1-0-77797834bb9a@gmail.com>
 <20240620-omap-usb-tll-counted_by-v1-2-77797834bb9a@gmail.com>
 <20240626152603.GB2504017@google.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240626152603.GB2504017@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2024 17:26, Lee Jones wrote:
> On Thu, 20 Jun 2024, Javier Carrasco wrote:
> 
>> Use the struct_size macro to calculate the size of the tll, which
>> includes a trailing flexible array.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>>
>> ---
>> The memory allocation used to be carried out in two steps:
>>
>> tll = devm_kzalloc(dev, sizeof(struct usbtll_omap), GFP_KERNEL);
>> tll->ch_clk = devm_kzalloc(dev, sizeof(struct clk *) * tll->nch,
>>                            GFP_KERNEL);
>>
>> Until commit 16c2004d9e4d ("mfd: omap-usb-tll: Allocate driver data at once")
>> turned that into the current allocation:
>>
>> tll = devm_kzalloc(dev, sizeof(*tll) + sizeof(tll->ch_clk[nch]),
>>                    GFP_KERNEL);
>>
>> That has surprised me at first glance because I would have expected
>> sizeof(tll->ch_clk[nch]) to return the size of a single pointer, not
>> being equivalent to 'sizeof(struct clk *) * nch'.
>>
>> I might be missing/misunderstanding something here because the commit
>> is not new, and the error should be noticeable. Moreover, I don't have
>> real hardware to test it. Hence why I didn't mark this patch as a fix.
>>
>> I would be pleased to get feedback about this (why it is right as it is,
>> or if that is actually a bug).
> 
> You don't need this H/W to test this our for yourself.
> 
> Mock-up the structs in a user-space C-program and print out the sizes.
> 
> Please report them all to justify the patch.
> 

Values obviously depend on the architecture, but in general:

1.- Before commit 16c2004d9e4d:
 1.1. tll = devm_kzalloc(dev, sizeof(struct usbtll_omap), GFP_KERNEL);

   -> sizeof(struct usbtll_omap) = N

 1.2 tll->ch_clk = devm_kzalloc(dev, sizeof(struct clk *) * tll->nch,
                           GFP_KERNEL);

   -> sizeof(struct clk *) * tll->nch = M * nch

Total = N + M * nch,
where M is the size of a single pointer.


2.- After commit 16c2004d9e4d:
 tll = devm_kzalloc(dev, sizeof(*tll) + sizeof(tll->ch_clk[nch]),
                    GFP_KERNEL);
   -> sizeof(*tll) = N
   -> sizeof(tll->ch_clk[nch]) = sizeof(struct clk *) = M

Total = N + M
Therefore, it only allocates memory for a single pointer.


3.- struct_size (this patch):
sizeof(*tll) + nch * sizeof(struct clk *) = N + nch * M

What I meant with not having real hardware is that I could not replicate
the whole code with all their structures to get exact sizes, which don't
leave room for discussion or misunderstandings.

Best regards,
Javier Carrasco

>> ---
>>  drivers/mfd/omap-usb-tll.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
>> index a091e5b0f21d..5f25ac514ff2 100644
>> --- a/drivers/mfd/omap-usb-tll.c
>> +++ b/drivers/mfd/omap-usb-tll.c
>> @@ -230,8 +230,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
>>  		break;
>>  	}
>>  
>> -	tll = devm_kzalloc(dev, sizeof(*tll) + sizeof(tll->ch_clk[nch]),
>> -			   GFP_KERNEL);
>> +	tll = devm_kzalloc(dev, struct_size(tll, ch_clk, nch), GFP_KERNEL);
>>  	if (!tll) {
>>  		pm_runtime_put_sync(dev);
>>  		pm_runtime_disable(dev);
>>
>> -- 
>> 2.40.1
>>
> 


