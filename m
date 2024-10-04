Return-Path: <linux-omap+bounces-2307-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5520398FE29
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 09:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1536C283EAC
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 07:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0249313AD2A;
	Fri,  4 Oct 2024 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9XZ/+pN"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D3D13790B;
	Fri,  4 Oct 2024 07:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028507; cv=none; b=O5BL8NDyPF2uve0C5LZrzpHkDyAxQSkY2uQp3aSIFWtNCQ6+rDnQoQwZrfBZr+blWjBjNJU38mq7/Q7n7k5uP7VVCKjepsLDq6LmLWzDIqPDvuBx2qXb+WMg/MmvXljwAGgAdMcY4C19SsOjLCB0kSDy0HtX6LpkW6Oo4rUeGfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028507; c=relaxed/simple;
	bh=1rmn9mgHgl3weh7NzIfLqPn3lhDo4MFolXnng4SzFaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hg7nMfnb8lnFQKmPaWmvF15G5RWWUqC1cdwPebBV0/TkJ5bOABy91Yhn3Ah4LPdyNinDkTlvJKnmLChOsdB8qZVFMbjL22HM25LgcDYG/PM+zfmyj41b1dwqZaaH1oYsvSmDXbW/HZ9H/cOh9imFnwtlZ3JS4Jxqxd9RJez/FrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9XZ/+pN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F96C4CECC;
	Fri,  4 Oct 2024 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728028507;
	bh=1rmn9mgHgl3weh7NzIfLqPn3lhDo4MFolXnng4SzFaU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l9XZ/+pNVkF3L9myb7e8hwq0l3jOHXxFwO6z0LaGfTSbcoIgu9NwpZ0YBO6/n6FbA
	 xUs27AG/fd0zovRdhPGi4YKPGJKET9zBkdxBG8ehrZthl+Px6LPmnjd5GD49P4BdVP
	 ty/0Qu8hcE/1kxqrsVGFX6PNhZze3jc/E4YF3oH8lQfAymLTA6FZTP1SIGNnw0NZ8z
	 zT0PeDnowf7TGE8ddeN3fkwxdIv6mud/HYFoAFZ/ga/UajrEmebXXyUVCw6wowJpdf
	 FE5Z94eWbARGQe8D20MfSRNSbEDwONw3Y02W/8UIbNpThPRoOHXe5ORx8LvEAWquiY
	 SpObda5m08E/A==
Message-ID: <2bf32fb2-6b1d-4527-8ca2-96e21b8a813e@kernel.org>
Date: Fri, 4 Oct 2024 10:55:02 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: omap: omap4-epson-embt2ws: define GPIO
 regulators
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, khilman@baylibre.com,
 devicetree@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 linux-omap@vger.kernel.org
References: <20240930213008.159647-1-andreas@kemnade.info>
 <20240930213008.159647-2-andreas@kemnade.info>
 <3c83c399-708c-41e2-988d-4ccec63c6042@kernel.org>
 <20241004094117.51c8adcd@akair>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241004094117.51c8adcd@akair>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/10/2024 10:41, Andreas Kemnade wrote:
> Am Fri, 4 Oct 2024 10:24:32 +0300
> schrieb Roger Quadros <rogerq@kernel.org>:
> 
>> On 01/10/2024 00:30, Andreas Kemnade wrote:
>>> To properly have things running after cold boot, define
>>> GPIO regulators. Naming is based on board file.
>>>
>>> In the vendor kernel they are enabled in a function
>>> called bt2ws_dcdc_init() if the system is not booted just
>>> to charge the battery.
>>>
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>> ---
>>>  .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 73
>>> +++++++++++++++++++ 1 file changed, 73 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
>>> b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts index
>>> 339e52ba3614..d6b0abba19f6 100644 ---
>>> a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts +++
>>> b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts @@ -29,6 +29,42
>>> @@ backlight-right { power-supply = <&unknown_supply>;
>>>  	};
>>>  
>>> +	cb_v18: cb-v18 {  
>>
>> https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#generic-names-recommendation
>>
>>
>> So regulator@n
>> where n is some index if it can't be address.
>>
> No, no @n. The above link says: "If the node has no reg property, the
> @unit-address must be omitted and the node-name alone differentiates
> the node from other nodes at the same level in the tree." So
> probably regulator-cb-v18.

Yes, I agree.

-- 
cheers,
-roger

