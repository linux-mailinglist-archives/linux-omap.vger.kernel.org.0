Return-Path: <linux-omap+bounces-3219-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78865A1BB41
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 18:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51363188A1D7
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 17:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6CC1A4AA1;
	Fri, 24 Jan 2025 17:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYnrBJUs"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B913170A1A;
	Fri, 24 Jan 2025 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737738914; cv=none; b=UbKe0wipHxWIxUCuYSknngRqHLr0Ld3viZhIavgUN9AvQeEXla+rDKbJqZMveE0XqXL/tFezSkdObnUCfpcpxMOzgAWld1lH6yidhvXzkQzH1IREJOHAlka1/sdfl07TIp1JT+8aasPxR3Vj5NTmKxO6RddJeSlak0opre+A9wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737738914; c=relaxed/simple;
	bh=yV0/2JG6K1PtePd1HgCu8wBbcYVcnHaneyWi9lJezcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cet+35WUvYHPj99on3VYg9YDaBuKRIhwaBNn5wdvqdpBRS4+2WZwqhS453lZVlz9WKYl76305gVkkjZa7Ac8IIiU9TuZbVrEzu1xithkkR5nG8sHVIOM+JgGHHutKDf24XlGPW/easxXmOsXjRfDafOCCvjSt8aSo383Dy867QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYnrBJUs; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-844e9b83aaaso177773939f.3;
        Fri, 24 Jan 2025 09:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737738912; x=1738343712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7VIMZzme3IHV9iQs1l1VdHcL7Q4eudKwQ9+LWw8z6M=;
        b=DYnrBJUsDKJkWvD1+HCzTk2qkMiB3S7dxNSEveNg6L0OLUSU7SnQui2V3M/DfWN9CH
         DsLkW7FCBv18x2QM4iXdJJ7hh/+jhlZaKLkBgKHGQ7yVGCObQBwN8+Bn1gyrra2yv0EP
         F04cx0TKzmef35D9YOCjszmwHGBJ7T+WWqpLeyNCm2/66cy2n3WWp1gyI7nq37//4LLq
         96e1ZyuWyoJrFAm4zTqIT0TK6wfo5JRHySuCMs/s0eVkICpqiXFG2SpUuq+yc27rNj6w
         KpPWL31V2f/ON4QJkwM0WP3foIOF4QubRZqyfRVi+PVlLYfr4gaZ07Nw2zlLdBpjxS5t
         9VfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737738912; x=1738343712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r7VIMZzme3IHV9iQs1l1VdHcL7Q4eudKwQ9+LWw8z6M=;
        b=upm4cx2qswgXZ3OmzM8OZdFCFSO0f2JxkXMj5jKvGTa0VGnBfS4MZj6qkb8uV7MF8x
         EVNSvOoJq/4pGHPOPs+ph6SiF6Zo+HzmPESTUuPyqOET7MUFx/bPGHCfywZGLMjWCmIW
         JkbMUeVqkaDJAy3QcjVnvLGw163ngtX+JeId73yspqnVT6leSPnUNzJwIcZxDlPOaVMw
         WEAr2VWh4oWcXW2IY9InhNE50ZWlVs18mpRdvl8xqAfu0b4wumDikKG1hYkiwHSjoXC3
         Ye6reKJeYnt25TGlcZy23NF8PHDnNisrkkQmuuPWDEZJp0B4Q0bIvwYVxGLJBXaU/GHt
         5pAw==
X-Forwarded-Encrypted: i=1; AJvYcCU1uJAxZadPgTRv4lmL1xANvtOMYGc7Q68JRB9Iy2g+WdGQmN0++3wB2UUnsgNawlBlRrxCIHax6StE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz0BYMGap7OFDcZd4HbPXn6+TEImNm/kUUKCsGUS7g1p/fN8Lz
	7MFphMlQZMo8V+EWyhbOTpQ6XrGTOoWGjTR/PpZ9GU+I8akuIERH
X-Gm-Gg: ASbGnct5TmZ8cmZVr6k7ABogrJMq2APh/YpePe1GAZbkexFNkWxsD7fbEya1NP4phlI
	m8c7gXBTyD4cxO2HO00FFANo64nFDeDwj4+I5tX7tvdJa/7ENlAx96dI0qCa3Y2tARe6r/WXLAQ
	PBDhAjVmJJaGZSrD3y1vHGoqGA3kcPQ0sXkYAGIm/5IBsDpLog7wCgjcw/2r5lLM9yq4AaJxKsw
	Tu046f6fMJTsIc98tcmzxl3bhOLZHKckEKux/HGWDOOxm1g3gNaAoMzj9+JjdK6hj2uw8c6HJJg
	mQA7A+EnH0Y2KLsg5ISBr4z6AYjC74Js736OwDI0ffOCFTGvi39E
X-Google-Smtp-Source: AGHT+IEvgiIo1Ln9ZzOZ3CuFUX1rhyHnd8TO0znQBcOk6PCidaMWjf0mB10VaiWWkMPNxhz5JArhqA==
X-Received: by 2002:a05:6602:418a:b0:84a:7906:21e3 with SMTP id ca18e2360f4ac-851b623c48bmr2632053439f.7.1737738911765;
        Fri, 24 Jan 2025 09:15:11 -0800 (PST)
Received: from ?IPV6:2604:2d80:d295:4400:151:c3a9:e2c7:8a92? ([2604:2d80:d295:4400:151:c3a9:e2c7:8a92])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec1da4ba29sm725513173.70.2025.01.24.09.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 09:15:11 -0800 (PST)
Message-ID: <31717d89-432c-4b77-a974-99f7e6b97f97@gmail.com>
Date: Fri, 24 Jan 2025 11:15:10 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sdhci-omap: additional PM issue since 5.16
To: Romain Naour <romain.naour@smile.fr>, linux-omap@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
References: <1c5f72c4-3d55-4d62-b690-8c68b76a15d2@gmail.com>
 <f6732c49-a5b1-4a13-b9f6-c2d552b5e7e8@smile.fr>
Content-Language: en-US
From: David Owens <daowens01@gmail.com>
In-Reply-To: <f6732c49-a5b1-4a13-b9f6-c2d552b5e7e8@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Romain

On 1/24/25 04:36, Romain Naour wrote:
> Hello David,
>
> Le 23/01/2025 à 23:09, David Owens a écrit :
>> Hello,
>>
>> I have a AM574x system and encountered an eMMC regression when upgrading from 5.15 to 6.1.38.  The eMMC is using mmc-hs200 powered at 1.8v.  Reads from /dev/mmcblk1boot0 will return expected data except when a delay of several seconds is inserted between reads.  With a delay between reads, the read will occasionally (~50% of the time) return garbage data.  Using hexdump, I was able to determine that the "bad" data is actually coming from /dev/mmcblk1, not /dev/mmcblk1boot0.  The same thing happens when reading from /dev/mmcblk1boot1.
>>
>> Much like a previous report in the linux-omap mailing list [1], I too was able to correct the regression by reverting the commit "mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM" [2].  Unlike the previous report, applying the sdhci-omap patch [3] did not resolve my issue.  Only reverting the original commit allowed for reliable reads from /dev/mmcblk1boot0.  I also don't see the same I/O errors mentioned in the previous posting.  Reads always succeed and return the correct amount of data, its just from the wrong device.
> Interesting, can you share a test script to reproduce your issue?

Here is a test script I've been running on my devices.  A failure is typically
detected after a minute or two.  I include the eMMC part type in the output as
we've used a couple different parts in production, all claiming to be compatible
and I'm starting to wonder if the failure is a combination of the aggressive
PM _and_ specific emmc parts.  The offset used in hexdump was just a place in
both mmcblk1 and mmcblk1boot0 that was non-zero.  The issue happens using any
offset.

#!/bin/bash

echo "Kernel:    $(uname -r)"
echo "eMMC part: $(dmesg | grep 'mmcblk1: mmc1:0001' | awk '{print $5}')"
BLK1=$(hexdump -C /dev/mmcblk1 -s 0x3fc000 -n 10 | head -n 1)
BOOT=$(hexdump -C /dev/mmcblk1boot0 -s 0x3fc000 -n 10 | head -n 1)

echo "/dev/mmcblk1:      ${BLK1}"
echo "/dev/mmcblk1boot0: ${BOOT}"

while [[ "$BLK1" != "$BOOT" ]]; do
    sleep 20
    BOOT=$(hexdump -C /dev/mmcblk1boot0 -s 0x3fc000 -n 10 | head -n 1)
    echo "/dev/mmcblk1boot0: ${BOOT}"
done

echo "/dev/mmcblk1boot0 read failure"

>
> Why 6.1.38? nowadays the 6.1.x stable is 6.1.127 already.
> Can you test with the latest stable release?

Good question.  I can certainly update to .127 but at the time we were shipping
units we were on .38 so that's where I've been doing all my testing.  I'll let
you know how running under .127 compares.

>
> I believe this issue could be reproduced on the beaglebone-ai board (I don't
> have it).
>
> [1] https://www.beagleboard.org/boards/beaglebone-ai

Thanks for the suggestion, I'll see if I can dig one up.

>
> Best regards,
> Romain
>
>
>> [1] https://lore.kernel.org/all/2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr/
>>
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3edf588e7fe00e90d1dc7fb9e599861b2c2cf442
>>
>> [3] https://lore.kernel.org/linux-omap/20240315234444.816978-1-romain.naour@smile.fr/T/#u
>>
>> Regards,
>>
>> Dave
>>
>>

