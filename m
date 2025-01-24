Return-Path: <linux-omap+bounces-3220-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E413A1BC70
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 19:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02BFA16F986
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 18:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258A41D90B1;
	Fri, 24 Jan 2025 18:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjjCY5sO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAA7146A9B;
	Fri, 24 Jan 2025 18:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737744580; cv=none; b=dU30HdIhJsQFy0oSb1Acd0tuQfvN2tSU4VGZ201VXbTUJyKRHMm5pjsnpX/FAR6Xr9g+iiKP3djJYOjQsx7Sr/K6B1NU8GQ1NkjbHMMhBbnl958BeT3/AGWmkUIoeSXh6kwrifxFcwjG5mV8ju01iwjAtGIb/uW66gj4y/R+/sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737744580; c=relaxed/simple;
	bh=qLYtBEK6oPrQb/Cj+RVMdcgkNQAZvoMp4WU9pX1SPxA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pfyu3PrwydqMn9EFldGuHt2LEmTxHNv8xN++NhmmYKwwPg8LZU3IzaOR5NZ2m2wIe0oOscbiRoD9F/A/dZjx4GL4YfqKShGYNPMAKNyLsLtKzsydgqPbj4kghklwOtZUtBTWR7C2c7rY0ELdSRIuuJQWGsVRMOhv0erelqvzFRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjjCY5sO; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3cfb0ed6ef8so10144335ab.0;
        Fri, 24 Jan 2025 10:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737744578; x=1738349378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RueX3PxQSyBdNr0B0NXCNxa2JwrzhwR66iWug7ouYbo=;
        b=bjjCY5sOd462g0ySnsNsbxk9+PBBTxJAkQdC9Ro/s+TghGnu1QTjIN0dRnfZyUHZiB
         pBXUIBnhQH/ChjIqXmlXstt7Jf8C2hFORVyf+o8aLXWiBGl6NaObFCvOghwyoQ3qaofa
         i0YUQ0HIfdcid6C9KxtMvLams5aSJNrwxMtqLWHjHupgZcRhxaAK090ReNiAFyO0LkPV
         3KfGzaHvxdvlgPkNw1kyHtEY89OqzD1jG+0y0YqrJrkape2+OMUId3oSpwr4DX75A3TB
         XrxZs+ZjdfB19QivjMtgOF/ZAB5U3TgXGXzCNHmJLKvWl/yhWczoLzr3LLfPNYPFxBSi
         yW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737744578; x=1738349378;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RueX3PxQSyBdNr0B0NXCNxa2JwrzhwR66iWug7ouYbo=;
        b=JebKGLCjadf1f4fyMV1fiHU328KJA5/sCOdhJbBUiVYGy/gcmrkStH2wHGcr5ZHZiP
         CVpSojGrv1nAhlV/LDA//E9rd0WxNz5rrstXiB49NgM8+uKhOnuv55LmrjUjJaU1i9wi
         hb4TZDbtvSv3rswf4JXmdQ8aDhL6nI8Iovn1Aoza4A48ZaR69ZxHdd9OynrS0mhtalCA
         tZmNgaVBqEq+RIeGELbsRvXg7T/cKDYt+fRyM8c7BXseN54KT+/384oqaFKcpKbixR47
         3B4P2J5pWhi/8agyP90lM439KGXrclE2ui2r6MEheFdMJv3uYCoboS93FLwPMZ05cYWT
         Oz6A==
X-Forwarded-Encrypted: i=1; AJvYcCWA8rFBCLBIoKoqXcsHmj/OKWCacgCOhm9EdnL1DQC2cHrodzyzdWCPX9yqKOjdWdntiaxOlWdpnmK4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh6CjfUOseQYqm/O4liXV+3u8mh7csJV2qcVDIr7UfvmdttLbx
	P5RURPgynNEOEqYD0JPeXUZcdMw8IAND27mrRzNlF3tbbX96It9D9AiTLQ==
X-Gm-Gg: ASbGnctEEsPcEPeM6B8piYMBM3B3KTz0kJ50FcdQ/acyru4nymHHUVPGvoTkZP1c9zr
	c/qglBg0fKyLUplbEh2bFk4+4xEgVI7ko3e4R29Gj5enpH1A5P0HneCVgw6LgqQHAe2Vep/jLnM
	2kwIIVoiVEtA5u3p+L+3iavNFOciv55JeULToRONWjnFQC/sntRNoDkxrZE6v3y3wdgzmEm0R87
	Xkp7A3b4iwijVtMXPwDyIbK4eSUCrdHR3x11fvJWIC6Taqpyn5kt5W6I2Dc3IHP6MuqEfW3RBjf
	8G72VjiYS/rAdLoiknzdfcev4ZbiQ+BKeJFktV1sSytUD6prMY/Z
X-Google-Smtp-Source: AGHT+IEYcJDZ9+R5NfF9XfaFVzCoqL7ziof6kCa2CHFI4u5vYmlWOPj1MPSYEuHI4OrUtC+wQl5N2Q==
X-Received: by 2002:a92:d4c9:0:b0:3cf:b059:9dd9 with SMTP id e9e14a558f8ab-3cfc7a564ccmr26683595ab.9.1737744578060;
        Fri, 24 Jan 2025 10:49:38 -0800 (PST)
Received: from ?IPV6:2604:2d80:d295:4400:151:c3a9:e2c7:8a92? ([2604:2d80:d295:4400:151:c3a9:e2c7:8a92])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec1da3354bsm776400173.50.2025.01.24.10.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 10:49:37 -0800 (PST)
Message-ID: <9168d127-06a7-46e6-a7a2-f2e60032a50e@gmail.com>
Date: Fri, 24 Jan 2025 12:49:36 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sdhci-omap: additional PM issue since 5.16
From: David <daowens01@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, linux-omap@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
References: <1c5f72c4-3d55-4d62-b690-8c68b76a15d2@gmail.com>
 <f6732c49-a5b1-4a13-b9f6-c2d552b5e7e8@smile.fr>
 <31717d89-432c-4b77-a974-99f7e6b97f97@gmail.com>
Content-Language: en-US
In-Reply-To: <31717d89-432c-4b77-a974-99f7e6b97f97@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 1/24/25 11:15, David Owens wrote:
> Hi Romain
>
> On 1/24/25 04:36, Romain Naour wrote:
>> Hello David,
>>
>> Le 23/01/2025 à 23:09, David Owens a écrit :
>>> Hello,
>>>
>>> I have a AM574x system and encountered an eMMC regression when upgrading from 5.15 to 6.1.38.  The eMMC is using mmc-hs200 powered at 1.8v.  Reads from /dev/mmcblk1boot0 will return expected data except when a delay of several seconds is inserted between reads.  With a delay between reads, the read will occasionally (~50% of the time) return garbage data.  Using hexdump, I was able to determine that the "bad" data is actually coming from /dev/mmcblk1, not /dev/mmcblk1boot0.  The same thing happens when reading from /dev/mmcblk1boot1.
>>>
>>> Much like a previous report in the linux-omap mailing list [1], I too was able to correct the regression by reverting the commit "mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM" [2].  Unlike the previous report, applying the sdhci-omap patch [3] did not resolve my issue.  Only reverting the original commit allowed for reliable reads from /dev/mmcblk1boot0.  I also don't see the same I/O errors mentioned in the previous posting.  Reads always succeed and return the correct amount of data, its just from the wrong device.
>> Interesting, can you share a test script to reproduce your issue?
> Here is a test script I've been running on my devices.  A failure is typically
> detected after a minute or two.  I include the eMMC part type in the output as
> we've used a couple different parts in production, all claiming to be compatible
> and I'm starting to wonder if the failure is a combination of the aggressive
> PM _and_ specific emmc parts.  The offset used in hexdump was just a place in
> both mmcblk1 and mmcblk1boot0 that was non-zero.  The issue happens using any
> offset.
>
> #!/bin/bash
>
> echo "Kernel:    $(uname -r)"
> echo "eMMC part: $(dmesg | grep 'mmcblk1: mmc1:0001' | awk '{print $5}')"
> BLK1=$(hexdump -C /dev/mmcblk1 -s 0x3fc000 -n 10 | head -n 1)
> BOOT=$(hexdump -C /dev/mmcblk1boot0 -s 0x3fc000 -n 10 | head -n 1)
>
> echo "/dev/mmcblk1:      ${BLK1}"
> echo "/dev/mmcblk1boot0: ${BOOT}"
>
> while [[ "$BLK1" != "$BOOT" ]]; do
>     sleep 20
>     BOOT=$(hexdump -C /dev/mmcblk1boot0 -s 0x3fc000 -n 10 | head -n 1)
>     echo "/dev/mmcblk1boot0: ${BOOT}"
> done
>
> echo "/dev/mmcblk1boot0 read failure"
>
>> Why 6.1.38? nowadays the 6.1.x stable is 6.1.127 already.
>> Can you test with the latest stable release?
> Good question.  I can certainly update to .127 but at the time we were shipping
> units we were on .38 so that's where I've been doing all my testing.  I'll let
> you know how running under .127 compares.

Testing with 6.1.127 shows the same behavior.

>> I believe this issue could be reproduced on the beaglebone-ai board (I don't
>> have it).
>>
>> [1] https://www.beagleboard.org/boards/beaglebone-ai
> Thanks for the suggestion, I'll see if I can dig one up.
>
>> Best regards,
>> Romain
>>
>>
>>> [1] https://lore.kernel.org/all/2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr/
>>>
>>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3edf588e7fe00e90d1dc7fb9e599861b2c2cf442
>>>
>>> [3] https://lore.kernel.org/linux-omap/20240315234444.816978-1-romain.naour@smile.fr/T/#u
>>>
>>> Regards,
>>>
>>> Dave
>>>
Thanks,

Dave


