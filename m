Return-Path: <linux-omap+bounces-2645-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF7C9C2C08
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 12:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BC08282BFA
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 11:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD0D1547E2;
	Sat,  9 Nov 2024 11:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IK37qql/"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1447233D7D;
	Sat,  9 Nov 2024 10:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731149999; cv=none; b=qlDbo6jpMq5Cj9YkU+jdj6rGUfsfgUKg5+9eOZn5ftfS/6sm6eiUaYXnP0TGjuDX/ogmXcOuZuEd/tem4bq4KK+VFiKRPEXVdSR5I2QHIzb9r/CUQ1ppvedDYfEC95zR7C5L3n8GurR7nefTtFdO7+MvIwsNAPbBf85i500pvTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731149999; c=relaxed/simple;
	bh=jk6rHlRRfUzrbYgf6VIEwAwXUaMTbUPj5VvnKJwWE+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjKZUzxUBU4KZc6B52nhvNrVD50uVsPEtNddveVuZqAXIJX1pPi5rR/R0wSWkEMuo7qbNbII26RfYdwWjsUHNHV7uD2+tlOhajDJmEEz09bEXWQ4QwP8TOcuzGYJHAfXiHphUTyq+avCGvAbkphkjb2f24QMRPpCXPn0EORRE6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IK37qql/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA982C4CED4;
	Sat,  9 Nov 2024 10:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731149999;
	bh=jk6rHlRRfUzrbYgf6VIEwAwXUaMTbUPj5VvnKJwWE+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IK37qql/W0qlfxy2DnjH8czJHBkvaqH3RMrQObHpHDFtpwj++jM0xWbHEHewMWqZz
	 Ast3DvEnD3vGn3iTpjKMLicVSAEwl91QKDbJ0JvkFC+PY5QL4g+IJ7ql4hLitTJ8ox
	 OriQPE+o9L9/VVTK7OXkweTOmI6cqxTl8qt9lrRgQwd8dpkpiv06qyjuoegkkJZdy2
	 eFcsFTn0onjIo4Ef3Z0a5OTw5rvtmgfGxa3VwkDUX8T64/J8lMgcifQU1SrS0bj3Nv
	 w60BuL/6w+06gcr2NdbSojhbnswQD1naO5nrHWbngNgP0+SIZfjbQ9/GW6y61ov/vH
	 pktSu9RKNO/xQ==
Message-ID: <145ee4ab-14e9-41c6-bedb-b2af55ae9f43@kernel.org>
Date: Sat, 9 Nov 2024 12:59:54 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: ti/omap: gta04: fix pm issues caused by spi
 module
To: Andreas Kemnade <andreas@kemnade.info>
Cc: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hns@goldelico.com, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 aaro.koskinen@iki.fi, khilman@baylibre.com, stable@vger.kernel.org
References: <20241107225100.1803943-1-andreas@kemnade.info>
 <b26c1fa8-b3b7-4aa9-bc78-793ddfa3bc6b@kernel.org>
 <20241108184118.5ee8114c@akair>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241108184118.5ee8114c@akair>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/11/2024 19:41, Andreas Kemnade wrote:
> Am Fri, 8 Nov 2024 14:42:14 +0200
> schrieb Roger Quadros <rogerq@kernel.org>:
> 
>>> diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
>>> index 3661340009e7a..11f8af34498b1 100644
>>> --- a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
>>> +++ b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
>>> @@ -612,19 +612,23 @@ &i2c3 {
>>>  };
>>>  
>>>  &mcspi1 {
>>> -	status = "disabled";  
>>
>> But according to commit a622310f7f01 ("ARM: dts: gta04: fix excess dma channel usage"),
>> these mcspi modules are not used. So it doesn't make sense to enable them even if it
>> seems to solve the power management issue?
>>
> They are not used, if they are just disabled, kernel does not touch
> them, so if it is there, the kernel can handle
> pm. At least as long as it is not under ti,sysc.
> 
> There are probably cleaner solutions for this, but for a CC: stable I
> would prefer something less invasive.
> 
> I can try a ti-sysc based fix in parallel.
> 
>> Does bootloader leave the mcspi modules in a unwanted state?
> 
> Or at least something related to them. 
> As said, for the blamed patch I checked only for CM_IDLEST1_CORE
> and CM_FCLKEN1_CORE.
> 
>> Would it make sense for the bus driver to explicitly turn off all modules?
> 
> Hmm, not very clear what you mean. AFAIK everything below ti-sysc gets
> turned off if a disable is in the child node. Explicitly disabling such
> stuff in the dtsi and enable it in the board dts sound sane
> to me at first glance. I think it is a common pattern. The question is
> whether that causes confusion with not ti-sysc stuff. Well, having
> status=okay everywhere in the dts should not harm.
> But as said for a regression fix some overhaul affecting every device 
> is out of scope.

McSPI modules have Revision, Syconfig and Sysstatus registers.
Is it because we are missing the ti-sysc representation for it
that the module power is not being correctly handled in Linux
if module is kept disabled?

-- 
cheers,
-roger

