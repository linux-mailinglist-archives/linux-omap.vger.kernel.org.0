Return-Path: <linux-omap+bounces-2705-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4989D1176
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2024 14:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E899B2722C
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2024 13:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B5119C560;
	Mon, 18 Nov 2024 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmPCodLv"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED8B1E49B;
	Mon, 18 Nov 2024 13:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731935334; cv=none; b=Rg/zXkykzoWhu4AV1Jd7VRPwEys5rsnD9DPBWsg7lmNuzEdjUesci0R7NGON650NWPElr8mTVB6Is3w6FmvOIKzgtw4J+n8KmfEiME/TQsWFXjGatFKWWi+kZujmQev/uslfXbYNOVHKSZTXogn3kqThkuwPMBSUvfxrBoYcwTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731935334; c=relaxed/simple;
	bh=HzQVcMEu/w6/YCCfncF8ljt72py1cVuCfnwesEoiDQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uP/VF1UeujbgY23Kz1OhpcAVZ1V23bChfSzkS5XB8ZsfalXq+7dEYwlkneR7wDIRDA3dHEHM6Dn26f9xqpgSaL8XT2XyIBmQPSiwOaZ/JfjgMB7Exq+oG+Z16CMdafcYyiiURJeRBd620zF99pePNhoUx1gtgiEsxUzDKcDaodI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmPCodLv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79442C4CED0;
	Mon, 18 Nov 2024 13:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731935334;
	bh=HzQVcMEu/w6/YCCfncF8ljt72py1cVuCfnwesEoiDQo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HmPCodLvAM2mfqSr9Okjuq8iZqMlsiEye0sO/guWVcBWVoZs+sPvA5CiAw6bog4X0
	 mh6l47DWBglsNNtT5g5w8SHLxo5rqFOHT0s9P/271Ee4EERKYSGdBJQeOXG+/mRLdr
	 pG7EP9eILymffWjECadMwxXpa5xDADRbLgpYClIco/wSCrvMEo8yqJ0u3/wBADZf2e
	 qc09Oh2k90EL64rXSJNMVn3OCKzaprPdNyyoIyQiWupl56RnZCITFuBtEfW5pgf6jg
	 MtEAV5U6St4kmMNfV0YI1Ac7NSNEpGtbbspyDrzipyCcnaQBXQT8Gt6tZc/iHmVzOY
	 3IF/mC5uwWtwg==
Message-ID: <d1679678-8996-4484-bcf4-d4eaa6f009a4@kernel.org>
Date: Mon, 18 Nov 2024 15:08:48 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: ti/omap: gta04: fix pm issues caused by spi
 module
To: Andreas Kemnade <andreas@kemnade.info>, Tony Lindgren <tony@atomide.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hns@goldelico.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, aaro.koskinen@iki.fi, khilman@baylibre.com,
 stable@vger.kernel.org
References: <20241107225100.1803943-1-andreas@kemnade.info>
 <b26c1fa8-b3b7-4aa9-bc78-793ddfa3bc6b@kernel.org>
 <20241108184118.5ee8114c@akair> <20241111150953.GA23206@atomide.com>
 <20241111193117.5a5f5ecb@akair> <20241111234604.66a9691b@akair>
 <20241116212734.30f5d35b@akair>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241116212734.30f5d35b@akair>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/11/2024 22:27, Andreas Kemnade wrote:
> Am Mon, 11 Nov 2024 23:46:04 +0100
> schrieb Andreas Kemnade <andreas@kemnade.info>:
> 
>> Am Mon, 11 Nov 2024 19:31:17 +0100
>> schrieb Andreas Kemnade <andreas@kemnade.info>:
>>
>>> Am Mon, 11 Nov 2024 17:09:53 +0200
>>> schrieb Tony Lindgren <tony@atomide.com>:
>>>   
>>>> * Andreas Kemnade <andreas@kemnade.info> [241108 17:41]:    
>>>>> They are not used, if they are just disabled, kernel does not touch
>>>>> them, so if it is there, the kernel can handle
>>>>> pm. At least as long as it is not under ti,sysc.
>>>>>
>>>>> There are probably cleaner solutions for this, but for a CC: stable I
>>>>> would prefer something less invasive.      
>>>>
>>>> For unused devices, it's best to configure things to use ti-sysc, and
>>>> then set status disabled (or reserved) for the child devices only. This
>>>> way the parent interconnect target module is PM runtime managed by
>>>> Linux, and it's power domain gets properly idled for the unused devices
>>>> too.
>>>>     
>>> Hmm, we also have omap_hwmod_setup_all() which is still called if
>>> without device nodes being available.
>>>
>>> Converting mcspi to ti-sysc is more than 100 lines. So it does not
>>> qualify for stable.
>>>   
>>>>> I can try a ti-sysc based fix in parallel.      
>>>>
>>>> Yeah that should be trivial hopefully :)
>>>>     
>>> I played around, got pm issues too, tried to force-enable things (via
>>> power/control),
>>> watched CM_IDLEST1_CORE and CM_FCLKEN1_CORE, they behave. Bits are set
>>> or reset.
>>>
>>> but not CM_IDLEST_CKGEN, it is 0x209 instead of 0x1.
>>>
>>> I test from initramfs, so no mmc activity involved
>>>
>>> removing status = "disabled" from mcspi3 solves things.
>>> With and without ti-sysc conversion. removing status = "disabled" from
>>> mcspi4 seems not to help.
>>>
>>> That all cannot be... I will retry tomorrow.
>>>   
>> well, I tried a bit further:
>> I build the omap spi driver as module.
>> and booted With mcspi3 not disabled and no module autoload.
>>
>> without module loaded: pm bad, same as with mcspi3 disabled
>> with module loaded: core pm ok
>> with module loaded and unloaded: core pm ok.
>>
>> so at least a trace.
>>
> ok, I am a bit further.
> mcspi is per default in slave mode, setting it to master solves issues.
> And that happens when the driver is probed because its default is
> master.
> Having the pins muxed as mode 7 also helps or selecting a pulldown for
> cs. (cs is active high per default!)
> switching to pullup does not harm once the spi module is off, but having
> active cs seems to prevent idling despite CM_IDLEST1_CORE
> not showing it.
> 
> History: u-boot muxes McSPI3, because it can be available on an
> optionally fitted pin header. But there is no user known (would need
> a dtb overlay anyways). So I will rather mux to mode 7.

I'm sorry I didn't fully understand the problem.

So, u-boot configures pinmux for McSPI3 and enables McSPI3 as well
but fails to disable it properly?
And because McSPI3 is in slave mode and CS is active it fails to
transition to idle in Linux?

So isn't this a u-boot issue?

-- 
cheers,
-roger


