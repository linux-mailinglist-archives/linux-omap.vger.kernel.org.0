Return-Path: <linux-omap+bounces-2692-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB2F9C8F2A
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 17:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF9371F23469
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 16:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE749150997;
	Thu, 14 Nov 2024 16:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="QCgR3nzG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BC43FB0E
	for <linux-omap@vger.kernel.org>; Thu, 14 Nov 2024 16:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731600392; cv=none; b=eYFjipq5KLppH7B/BNBmQcQ4o7e73uDcmz7Co5AxBFDddMIKZpQxDeP4DRW5fxX7F29KqFL4IcqoaffQbtrsQXovqVnS/FpVmf7aKl0zKczs5BOKSTyufA9kRBlCylHc+teYDolOvuZR31qhejqLv5Z5TRs9uD09mUaagzuiCUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731600392; c=relaxed/simple;
	bh=ywFggH7DHjF/wt5XHrh2nb1enocjSba/y9NwbJjGawM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BdikJvD2QhSSl0LCiq0HQRHXfqv6m90NDEZQVXwNBPQkkeNov+7QjWnqtdeOwbVaaoHOjTtcuSDXak8dPRqgHUDZvOzxhO+Xm3Xn/AHsVMn4eqScjtGVFcpCoECSAtG4zRzixJukqzj8pI6nBRXoQ/1Y5jwKkpKQyboRUHz1xJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=QCgR3nzG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43163667f0eso7062005e9.0
        for <linux-omap@vger.kernel.org>; Thu, 14 Nov 2024 08:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1731600389; x=1732205189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5TLZGaea6sK0nDhRbM1AqBwYwcNqZLYrWSOBUJRLlo=;
        b=QCgR3nzGkUZq5bGImbobrDejODY7z2mAK5G2J35UFVIn2hBksmqP9bzPryHsuGJ7kY
         38/iBZywSGyXHrKU0alUlU0P3911ztR/OuqDMdPhM72EFZ1PJ0A4deWOOt4h6rmzR5IZ
         IY5mTzXlKJwiFVDqI+RlBII2g+8NF1vrQLr3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731600389; x=1732205189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e5TLZGaea6sK0nDhRbM1AqBwYwcNqZLYrWSOBUJRLlo=;
        b=UbA61Qjsh4r6kvhKywlZLZJBsiQGBv8h65dMkJSX92QoZXORnvGm321FbAHit9c9+a
         mIwjiS1YWnk11k9mXJ/GTi7Xexyoaes5DeY0I8ICEvhVd3gTnicWOla38m8cqjrc227l
         8cmYkKbdwWD6K8N2BYyiwmFMXUU9pzyfolt8OcUy6QaOSWurZobfpsBxjhramJRPU5i3
         IlXtHi52IDq6PRPpSuh2oH6mnmeMcLwCe0mPxocKvV91pl6gnkQxtLowKrRlOAMosW5f
         JiW2sDLONuYGfHlEQs0JQ5IAgxSByOtc4dTVi+CK5n0F/8WjCQ6ANyKa1Nh1w6EhTBS8
         huEg==
X-Forwarded-Encrypted: i=1; AJvYcCU8q0H/gydoHzF7O17NojuOWtPNnJiymQYujEcL/gDvoTfL/Ml7WvmHAW9dXkRZEvB5xJuciU1Hq/x9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqogc+LFnHMQ06IJfT8JlfH43dgZ2okjSiYDXcvghdwuwJbnzo
	OskE4fUo8SDMmHT44EtpJjqWgXH4DDxWewBOISOb6bq4bMxRFKeKFArTKFwcyiw=
X-Google-Smtp-Source: AGHT+IHiRvA7cvPqYtmkmMJTpiDBV+hOJMvmFWxQg/urdzyZGoSaSsnyLrYY+OtzP3hMqJjyuSbZ4w==
X-Received: by 2002:a05:600c:3ac9:b0:42c:bae0:f065 with SMTP id 5b1f17b1804b1-432da767a0bmr25517525e9.5.1731600388469;
        Thu, 14 Nov 2024 08:06:28 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac1fbf9sm25337705e9.41.2024.11.14.08.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 08:06:28 -0800 (PST)
Message-ID: <fa92518d-396a-4a50-9287-4832a7f5d813@smile.fr>
Date: Thu, 14 Nov 2024 17:06:27 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] ARM: dts: Configure interconnect target module for
 dra7 sata
To: Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org
Cc: =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-pci@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Robin Murphy <robin.murphy@arm.com>
References: <20210126124004.52550-1-tony@atomide.com>
 <20210126124004.52550-8-tony@atomide.com>
 <c583e1bb-f56b-4489-8012-ce742e85f233@smile.fr>
 <45e6b7d4-706e-4f91-b452-4fa80c25b944@kernel.org>
 <2f715724-31c1-4228-b140-55aefb14af5c@smile.fr>
 <7821de41-6f71-4865-9d64-3d5be4602a9b@kernel.org>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <7821de41-6f71-4865-9d64-3d5be4602a9b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 14/11/2024 à 16:08, Roger Quadros a écrit :
> 
> 
> On 14/11/2024 15:50, Romain Naour wrote:
>> Hi Roger, Robin, All,
>>
>> Le 14/11/2024 à 12:02, Roger Quadros a écrit :

[...]

>>
>> Thanks for your reply!
>>
>> It seems l4_cfg can inherit dma-ranges property from ocp node using
>> "dma-ranges;". But then segment@100000 node (0x4a100000) needs "dma-ranges;" too.
>>
>> With the following patch applied, the SATA drive works correctly.
>>
>> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
>> index 1aaffd034c39..3ac770298844 100644
>> --- a/arch/arm/boot/dts/dra7-l4.dtsi
>> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
>> @@ -12,6 +12,7 @@ &l4_cfg {                                             /*
>> 0x4a000000 */
>>         ranges = <0x00000000 0x4a000000 0x100000>,      /* segment 0 */
>>                  <0x00100000 0x4a100000 0x100000>,      /* segment 1 */
>>                  <0x00200000 0x4a200000 0x100000>;      /* segment 2 */
>> +       dma-ranges;
>>
>>         segment@0 {                                     /* 0x4a000000 */
>>                 compatible = "simple-pm-bus";
>> @@ -557,6 +558,7 @@ segment@100000 {                                    /*
>> 0x4a100000 */
>>                          <0x0007e000 0x0017e000 0x001000>,      /* ap 124 */
>>                          <0x00059000 0x00159000 0x001000>,      /* ap 125 */
>>                          <0x0005a000 0x0015a000 0x001000>;      /* ap 126 */
>> +               dma-ranges;
>>
>>                 target-module@2000 {                    /* 0x4a102000, ap 27 3c.0 */
>>                         compatible = "ti,sysc";
>>
>>
>> Sorry, I'm not familliar with property inheritance between devicetree nodes,
>> especially with dma-ranges. Does this change seem correct to you?
> 
> I think this is correct.
> A similar fix [4] was done for PCIe as well.
> 
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=90d4d3f4ea45370d482fa609dbae4d2281b4074f

Thank you for your help, I just sent the patch:

https://lore.kernel.org/linux-omap/20241114155759.1155567-1-romain.naour@smile.fr/T/#u

Best regards,
Romain


> 
>>
>> Best regards,
>> Romain


