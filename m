Return-Path: <linux-omap+bounces-427-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F32DD84028A
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jan 2024 11:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF822282418
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jan 2024 10:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B0355E68;
	Mon, 29 Jan 2024 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="G/j4XcKR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051965730C
	for <linux-omap@vger.kernel.org>; Mon, 29 Jan 2024 10:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706523116; cv=none; b=dAmBV/LxcxY2U29zlfPO8r+ki0nxoMjTHMf1F9hphzx0bTpGwSq42vZJR7oBPfT29/sAM1iWz1sOpfOlU2KREPbjdxy7yeU8HYvc7M5UTmihMQUu2tNgxpdX/2H+IYHoblKhTvNIeNXu9Yi+uYDx9ogg5kDbMFo2Hv8jc1DugdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706523116; c=relaxed/simple;
	bh=N78ZhtmLcfNIUx/9WohdcGTZAeqEvSO6Ulq+ZZt1j/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FgunTXVsRJpe9eUccuRCKs30a1ZO5jTABvzThfN/jHBq6AszmQpzgVgpge6zXXJBES0pbJaBMFCCwYfjL3xIrG7Eezy4lgBFf27lY5/yuvi/kA5gOWXz7ir2NxwmVnj366FGFCB8XssJjPLUojHYiS+SNG/Uxn/atSyDVuzwnOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=G/j4XcKR; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33ae4eb360aso1351807f8f.0
        for <linux-omap@vger.kernel.org>; Mon, 29 Jan 2024 02:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706523111; x=1707127911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAd0Vi53ACSQ24sIRWWbJ6KnU/+J1YHg5DIp4BWGyTo=;
        b=G/j4XcKRlfU8nydRhMAIftEYNDP46d1HmCm47JIfm6qAsbPifmX+W/saiWL84H6hk8
         NSfie3V/g6GzVsfAOuVwh8buX0GpY9QSlPlDRIefp3fWHQJ8CceOu5RHApikWKJPiVII
         1eMCumLAmlHclk5B3cKDze58Nr4KMdSiqhC5cpaxUb420SMyQCeA1Zc3n4E0ggn3/edi
         I9zGd0lyJuSp0dB8MCJBtuikrQp5vZwo3BfrxLkVyXXJoOpXCCEBdMJK/Q0soyo3tbkj
         jvliyX/786C3nw9Vvu4O7NxV5WrecaUfPUUBcjPll4DP19pFhJkixC3TfD7uaoM4f7aX
         VCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706523111; x=1707127911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AAd0Vi53ACSQ24sIRWWbJ6KnU/+J1YHg5DIp4BWGyTo=;
        b=UVHf5FE37GCfQbkF1TItIDW8K8QFMu8m4Jylm2v5Nm6mJLmeTbX566e/812iXccwt7
         7QxTSrGUSIB9+1JRHnYl/bITJWOwJULr8giHN/vA/oztipwt3skTFNFYp8mnlcEVQsG+
         Y7+9FYjUCdKyaIgGQTfQx/B7HZ66cOnM3GPjUru4R3sfz2D8NN3+1VMZXPQ0tz4Fee9/
         JNoJKJ+cqFsNCCeRjwc2riP8aOua1jpOCXk3g9qsWNHWfzgiT5t5jGbztiwX6gTS3nnT
         tLK8BCVBdZZyS3oxOOjbtQZf5TAsUiHTZXLMq6iwRieClJQLORtN7kDPrDenUmkE/PZo
         7IJw==
X-Gm-Message-State: AOJu0Yz67or8zDmdNz9EWloAyqF4vDUTr2C90I6UCbOosbherbbcUvwM
	/fTMfxwURFjWChtegCvsiw1IKZhyQplJKhm2u2x4mEsDRD3s0NA5sEkdERqoQN2pIlz19pIhjAs
	O
X-Google-Smtp-Source: AGHT+IF27usIHVRE4+d0NCiBkbUNbF8jbFOW/l/5MqE6Tvc7lMU4gx9PavFfHeZ0vasNOkeXDp8q3w==
X-Received: by 2002:adf:faca:0:b0:339:358d:8611 with SMTP id a10-20020adffaca000000b00339358d8611mr3896474wrs.36.1706523110989;
        Mon, 29 Jan 2024 02:11:50 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31? (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id t18-20020adfe112000000b0033ade19da41sm6948536wrz.76.2024.01.29.02.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 02:11:50 -0800 (PST)
Message-ID: <d09925b3-83e6-4c52-878f-4c1db7670543@smile.fr>
Date: Mon, 29 Jan 2024 11:11:50 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sdhci-omap: issues with PM features since 5.16
Content-Language: fr, en-US
To: Tony Lindgren <tony@atomide.com>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, Nishanth Menon <nm@ti.com>
References: <2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr>
 <20240127044851.GW5185@atomide.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240127044851.GW5185@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Le 27/01/2024 à 05:48, Tony Lindgren a écrit :
> Hi,
> 
> * Romain Naour <romain.naour@smile.fr> [240126 20:53]:
>> Hello,
>>
>> I'm upgrading the kernel from 5.10.168 to 6.1.69 (both from TI tree) on a custom
>> board based on a AM574x SoC and I noticed a regression on the sdhci-omap driver.
>>
>> The emmc was working on the 5.10 kernel using mmc-hs200 powered at 1,8v (mmc2).
> 
> Is this limited to emmc or does it also happen with the micro-sd or wlan possibly?

I can't test with a wlan device but I noticed the same issue on micro-sd (the
mmc0 interface in my first post is a micro-sd)

> 
> If the issue is emmc related, do you have mmc-pwrseq-emmc configured in the dts?
> 
>> I'm able to reproduce on the IDK574x evaluation board (where the emmc is powered
>> at 3v3) with vanilla kernels.
> 
> OK, looks like only am5729-beagleboneai.dts has configured mmc-pwrseq-emmc.
> 
>> I had to revert all commits related to "PM runtime functions" [1] and "card
>> power off and enable aggressive PM" [2] from kernel 5.16 to use the emmc again
>> on both boards.
> 
> OK, this sounds like power sequence related when the emmc gets idled.

It seems mmc0 ios infos are lost at some point, just after the kernel boot they
are correct:

cat /sys/kernel/debug/mmc0/ios
clock:		50000000 Hz
vdd:		21 (3.3 ~ 3.4 V)
bus mode:	2 (push-pull)
chip select:	0 (don't care)
power mode:	2 (on)
bus width:	2 (4 bits)
timing spec:	2 (sd high-speed)
signal voltage:	0 (3.30 V)
driver type:	0 (driver type B)

And without notice, ios became wrong:

cat /sys/kernel/debug/mmc0/ios
clock:		0 Hz
vdd:		0 (invalid)
bus mode:	2 (push-pull)
chip select:	0 (don't care)
power mode:	0 (off)
bus width:	0 (1 bits)
timing spec:	0 (legacy)
signal voltage:	0 (3.30 V)
driver type:	0 (driver type B)

# cat /sys/bus/mmc/devices/mmc0:1234/type
SD

Best regards,
Romain


> 
> Regards,
> 
> Tony
> 
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f433e8aac6b94218394c6e7b80bb89e4e79c9549
>> [2]
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3edf588e7fe00e90d1dc7fb9e599861b2c2cf442
> 


