Return-Path: <linux-omap+bounces-327-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EA18330DC
	for <lists+linux-omap@lfdr.de>; Fri, 19 Jan 2024 23:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF2871F22A6C
	for <lists+linux-omap@lfdr.de>; Fri, 19 Jan 2024 22:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898A356B82;
	Fri, 19 Jan 2024 22:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="vG77VDH7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E83D56456
	for <linux-omap@vger.kernel.org>; Fri, 19 Jan 2024 22:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705704442; cv=none; b=a8BOzzvSxohtgKDo2GAl/6AdGx+TY2edKtyRKR4PBtTdnmRk1TaFaoWzAdS1j5GXgI0S5iFiozDlz/bEuxmoaX/nH9L6J3CfHUMfJO8PXr7VvHqLR7w5i5Qj0PfNqTmuJ2DWDBg7Yy3qeQCARQkBryMf1E+M98CzpUH5C9Vr9WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705704442; c=relaxed/simple;
	bh=ZMvFfI2OQSmCcEbb7pEOP5Ool4GnYUcAyzQukj4ml4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mEOGdl2a7DKcZefy+dLxLLbUIRN90mjKs0a7X9gGDwKOjAk7CjXvQkpkdQdbv/jMZa2YRu+Pvu/59aN8v0CUGODdRt3BYrFGR002sPpTiBbfpAj5IFPXIrzYPO+F+shooqybhPeM3rBcndjQ4pLqQOgPG7ghUoMY3fMd8AzehQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=vG77VDH7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33921b95dddso536819f8f.1
        for <linux-omap@vger.kernel.org>; Fri, 19 Jan 2024 14:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705704436; x=1706309236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0LetFgEJw/9z2sCz2NvPbPCXDWpfKrOkYkzDKcRwnEA=;
        b=vG77VDH7YZmzFm13lTKevzl+HQXCfnVIc1wySl7iTkDJUKst/SQB/G9h4+KtilbVN3
         gtnmK+V3xY1UfSU83fvDtj/p7zqMCR7hBJAjchcriRIPxNsa6TyzkbTVn3dB+b+IyaIX
         uR6X9qjIogRK3nilwSm7TrOF5XxusaMVi9XW4xKXv87zEEg6/6nqukr16DwDSYwCg7rV
         kMRXvntuEsRqO99LkHqAhS2lwjp3V1BW3gwAiP1fyCc9FdW/VwYKzMvbholdPagRN1Zu
         NnvPo28ElKAKm+ZF4zgSre8k4ET0rxIR7oyizorHpXwfg9dLledURkvpJ8vIihuYosdb
         g78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705704436; x=1706309236;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0LetFgEJw/9z2sCz2NvPbPCXDWpfKrOkYkzDKcRwnEA=;
        b=mQeq0sZw6MQh5kDJ3nSmEd6PusQQfFV/os9DUMF+bWs49IsH3/VkRG85BeSP//E31t
         0HtXzaG2lGg7A0aeCDq4mBGUCnO65ffcsSIShyMP4h6YRGrP7fckfZRFnU6qaNKFnPwO
         fFRDtxycuAakLZn/aHqDeAHoZpjzzLYxU3vH1IfpwfUZcOfk4dyIZ5ml/RgBEkU3vPtx
         5h+nGBCrZEt1D3WLD9WeMZJLDvWi2c5JGpW7coIzPCPycopD8L9Ke+hC9OOakUpiw7c7
         1qene6Nx/ruI5QiDlcTeAN/uxqdTjgssdEguCmQnTJ7ge/mXUKoWakSw7oEzLnHLqYlN
         /uTQ==
X-Gm-Message-State: AOJu0YwK7FjObfJWj3Fn+WiYMW1iIVqc93ZpXy96metXH5YnXUwPIjTS
	3hYePUmyMvw4V4tblWPvFC0h8iydzFC6ZpbrRNpFWdXYColWIs8S1xwo2Ba4pEkju6Oaq8NyC1T
	z
X-Google-Smtp-Source: AGHT+IE9uwPAujPpIXVsRfqgwORIXmPCuKDlHPLKjDO3RbbdI9LjdAj/+PgdvvdyCx3uBn1vNoD2IA==
X-Received: by 2002:a1c:6a04:0:b0:40d:310c:b445 with SMTP id f4-20020a1c6a04000000b0040d310cb445mr299724wmc.176.1705704436024;
        Fri, 19 Jan 2024 14:47:16 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31? (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id fa26-20020a05600c519a00b0040e89ff10f5sm9672128wmb.1.2024.01.19.14.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 14:47:15 -0800 (PST)
Message-ID: <48779ec2-4319-4254-9747-e2cc024a87b2@smile.fr>
Date: Fri, 19 Jan 2024 23:47:15 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: ti-sysc: Fix error handling for
 sysc_check_active_timer() again
Content-Language: fr, en-US
To: Andreas Kemnade <andreas@kemnade.info>
Cc: tony@atomide.com, linux-omap@vger.kernel.org,
 Romain Naour <romain.naour@skf.com>
References: <20231222163710.215362-1-romain.naour@smile.fr>
 <20231223234102.556eaa07@aktux>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20231223234102.556eaa07@aktux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Andreas,

Le 23/12/2023 à 23:41, Andreas Kemnade a écrit :
> Hi,
> 
> On Fri, 22 Dec 2023 17:37:10 +0100
> Romain Naour <romain.naour@smile.fr> wrote:
> 
>> From: Romain Naour <romain.naour@skf.com>
>>
>> sysc_check_active_timer() has been introduced by 6cfcd5563b4f
>> ("clocksource/drivers/timer-ti-dm: Fix suspend and resume for am3 and am4")
>> and initially returned -EBUSY to ignore timers tagged with no-reset
>> and no-idle.
>>
>> But the return code has been updated from -EBUSY to -ENXIO by
>> 65fb73676112 ("bus: ti-sysc: suppress err msg for timers used as clockevent/source")
>> and introduced a regression fixed by 06a089ef6449
>> ("bus: ti-sysc: Fix error handling for sysc_check_active_timer()")
>> since sysc_probe() was still checking for -EBUSY.
>>
>> Finally the sysc_check_active_timer() return code was reverted
>> back to -EBUSY by a12315d6d270
>> ("bus: ti-sysc: Make omap3 gpt12 quirk handling SoC specific") except
>> for SOC_3430.
>>
>> Now sysc_check_active_timer() may return ENXIO for SOC_3430 and
>> EBUSY for all other SoC.
>>
>> But sysc_probe() still check for -ENXIO leading to the following
>> errors in dmesg on AM57xx:
>>
>> ti-sysc: probe of 4ae18000.target-module failed with error -16 (timer1_target)
>> ti-sysc: probe of 4882c000.target-module failed with error -16 (timer15_target)
>> ti-sysc: probe of 4882e000.target-module failed with error -16 (timer6_target)
>>
>> Fix this by checking for both error code...
>>
> Well, fix what? As long as -EBUSY comes form sysc_check_active_timer(), there
> is no problem besides the noise. So clearly state what you want to fix,
> so is it only the noise.
> Of course I would also like the noise to be gone. I also stumbled across this.
> Bringing this to discussion is of course good.

I'm working on a custom board and such "noise" makes difficult to know if the
issue come from the board hardware, the SoC, the devicetree, the TI driver or
the kernel itself.

> 
> Changing it to -ENXIO has side effects as more lines are executed and the
> device is touched although it might be already in use by dmtimer_systimer.

The previous fix [1] doesn't say anything about the -EBUSY case and seems to
forgot updating the error handling for sysc_check_active_timer() (similar to [2])

> 
> As far as I understand things: there are broken timers, timers used by clocksource
> and timers generally useable. And we return -ENXIO for the broken ones... The
> main issue here is that this needs more documentation/comments.
> I might of course be wrong...

I get it now, the last commit [1] actually revert the commit [3] (removing the
error message) by adding back -EBUSY as intended initially [4] for all TI SoC
except for SOC_3430.

sysc_check_active_timer() returning -EBUSY affect 3 timers (timer1 (clockevent),
timer15, timer16) used on AM57xx [5].

ti-sysc: probe of 4ae18000.target-module failed with error -16 (timer1_target)
ti-sysc: probe of 4882c000.target-module failed with error -16 (timer15_target)
ti-sysc: probe of 4882e000.target-module failed with error -16 (timer6_target)

I'm agree, this issue deserve more documentation/comments and it would be better
to avoid such noise.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a12315d6d27093392b6c634e1d35a59f1d1f7a59

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=e0b603c89a931790dc54b9d6b14b3ec45a82a888

[3]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=65fb73676112f6fd107c5e542b2cbcfb206fe881

[4]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=6cfcd5563b4fadbf49ba8fa481978e5e86d30322

[5]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm/boot/dts/dra7.dtsi?h=v6.1.73#n1331

Best regards,
Romain

> 
> Regards,
> Andreas


