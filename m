Return-Path: <linux-omap+bounces-4741-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6709C022EB
	for <lists+linux-omap@lfdr.de>; Thu, 23 Oct 2025 17:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDA891AA23B5
	for <lists+linux-omap@lfdr.de>; Thu, 23 Oct 2025 15:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6645833C50F;
	Thu, 23 Oct 2025 15:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoO3daVA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876BC314B9D
	for <linux-omap@vger.kernel.org>; Thu, 23 Oct 2025 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761234046; cv=none; b=jKL5YcpjRwzOGFe8478YPG9xn5xtKCVArMaMGZzauyXiLH07tGXaAudI1zZcWYnOkDtpGLfYgOzrk7LcLs7T7z2DrGZwKXST6M6mi9XWo1yrc83uANV/e4AmWD/qmJdCAnDv1FLRpfUDWw+Cwo8koXmh9ux4oPc1d/usO4g8d08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761234046; c=relaxed/simple;
	bh=wo+q7gVJ0lDPvk3xTlIPPAEgAAs6cPPFBZRIlPTAefI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxgFQkWs/G+FZyrRpQ4VvEycktrcQPAKcGzUJA1ouRrxrMNRaCSQYS7AWi2139rL71lmjTI5QZDDSvGJhBX8FumTlSSA4m0o+k5POf7kgyNhf1effLfqi3N9Qvmir9dSnTAZfyLl3qwCNOWkJWd2+ju899qsUh/w/H7q0cNrxA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoO3daVA; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b6cf257f325so866597a12.2
        for <linux-omap@vger.kernel.org>; Thu, 23 Oct 2025 08:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761234044; x=1761838844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lXJXpPmoDUJ02UXvoOXxjG7CEpQb9FPd/0KUDwpNI4k=;
        b=BoO3daVAWDIewXv5Dr8Qdw/6c/vn/DDn+MdJhJKnXe1cv5cSM8DnCml/O0S+8l+pBp
         9IYxqKArEqk93D4Dt0XEI4CqYEdt4BAXd5Hu4d4JVhpJQ1HtSTsiz03v49P2u7VLidJR
         hy3w9moHuSsdiq/yujrnclIQ5zeNv/uKpfE4rNGoMxQhmksdqsf1/AaQYb8R6ImC6FiP
         ii57HM3zmPP1lbGtdv+OFWznCbNk6QllPDs0JMVBuxkYXQdsFFeoZxcMIxSXHBdh6nRN
         Ti5+r0X77k3ZKAQvklX57wN44w/EbSZvYcRCc+0PLOJbu7wqkgktHi1ONxyWpAwqmzeH
         lBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234044; x=1761838844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lXJXpPmoDUJ02UXvoOXxjG7CEpQb9FPd/0KUDwpNI4k=;
        b=nlHwGjWoBhATW6VntqCHFdpnPnViYaKzthXzJnfyiqwpul3AJuHodvD5cKNBn6V76z
         sADwp5LZGbyYltOu1DeM2Nt6ZD2ZKTli9BoHFcSIHeB6Ua2G7zakrwy835ueVq6qpjLq
         Y1Sgo1HjJClumpVhWVMhQeTRNtrlbo4wuhYcPZeRObQ3kFWoHafb1WfZJi8cRictSIrY
         399qbD8NjOagjmpj+BbOJN6cKChgQr1JV1me4HS2LGAwJBrhOk6WM9naEHvKl/1Qp0Lb
         fNJFmxCumC2TIxx5KpkRFhNJMey/+kFNo3H51eWFYmFG2NBOWyhI4PKLdUlULvmut0On
         ttKA==
X-Forwarded-Encrypted: i=1; AJvYcCWoBZey3ETkoNUOy99wGJJjZNC/f34l5NNpfqTkWr+Ltp5HIUtfx+XltnATfqos/NZ7iLaQka/px1C+@vger.kernel.org
X-Gm-Message-State: AOJu0YwBjH7/2ILf8tpwtCEpzYvVs/KkWgUzg/4Kr4hMMVY02ytEmqPQ
	lh1715eGMmLFEqjr/Kel2CYDfblc9fpt10pji0pwrzEYS6CUDq1Ko4sj
X-Gm-Gg: ASbGnct/8P4x/TwimpbtENIVdRwtuZ9sClD1Q0Ly8Sm6tNAwruhShHIWVtYAAj1CKjR
	u/Jn0KATWhLR1jbwLwNOGfNM7FvyLxGUFPSW0MJathun6C8YVjBq3DDOCsiJCRlWcEDdJja/o60
	61u+lvYoxZgsm4AVl9l5Vl8XCyXMaRrKS4ufb3eY4/0PGp8U/SUNHdZjNKM3I+53NiYPelbmQgB
	kYBvtSqDgtBhCio0CRkUttDx1qkb7yHFGFLO36gZ4HKaevnroeUa4IndhhKsUMHMOIN1IsGW88z
	b1uc7DYMzqXIqaE9rbX0RJ7j632uoN2pmCYjkdWXksLCU0IdNnGBHxrkx8cc4YmsmLC0pBNDVPK
	xPAUKsMQETq/HeQeFjjceF1XYmZ6VRZMqnPVUxIx/r5PtgV5XjgcXLJy/lyvxDpbXI3j+eJcocM
	mgooYXMhf9qrnJdA4yvvEKi9Q5Hqu7kaNU
X-Google-Smtp-Source: AGHT+IFArWijSKHwpar8JwYxB7WZc8vpMdPPlpUQNI5RWkup0YN+rTI2t69HTMgDeXnxkhaW+vdAkg==
X-Received: by 2002:a17:903:3546:b0:267:e097:7a9c with SMTP id d9443c01a7336-290cc6d4ba8mr326690025ad.53.1761234043638;
        Thu, 23 Oct 2025 08:40:43 -0700 (PDT)
Received: from [192.168.1.5] ([27.7.191.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946ddee569sm27029435ad.31.2025.10.23.08.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 08:40:43 -0700 (PDT)
Message-ID: <879da8d0-1ea5-4495-90e5-03b55aa91362@gmail.com>
Date: Thu, 23 Oct 2025 21:10:38 +0530
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] dt-bindings: mmc: ti,omap2430-sdhci: Add json
 schema for the text binding
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>,
 Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20251019-ti-sdhci-omap-v4-0-fdc63aaeb083@gmail.com>
 <20251020142710.GA576827-robh@kernel.org>
 <46aa84cd-63cc-4263-9061-021fa3205b87@gmail.com>
 <CAL_JsqKH2NTvXGPoimpVp=-yvcQgbXSoxKY6AO16WgJHSeOT5A@mail.gmail.com>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <CAL_JsqKH2NTvXGPoimpVp=-yvcQgbXSoxKY6AO16WgJHSeOT5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20-10-2025 21:28, Rob Herring wrote:
> On Mon, Oct 20, 2025 at 10:44 AM Charan Pedumuru
> <charan.pedumuru@gmail.com> wrote:
>>
>>
>>
>> On 20-10-2025 19:57, Rob Herring wrote:
>>> On Sun, Oct 19, 2025 at 01:04:36PM +0000, Charan Pedumuru wrote:
>>>> Create a YAML binding for ti,omap2430-sdhci and fix vmmc-supply
>>>> property typo for a DTS file.
>>>>
>>>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>>>> ---
>>>> Note: The property "ti,needs-special-reset" was not removed from DTS cause it will
>>>>       disrupt the compilation for other compatibles as the node &mmc is used for all
>>>>       compatibles for some DTS files.
>>>
>>> I don't understand. AFIACT, "ti,needs-special-reset" is only used for
>>> the hsmmc driver/binding. But this series for for the sdhci
>>> driver/binding. So shouldn't the property be removed from sdhci nodes
>>> (and the binding), but kept for hsmmc nodes?
>>
>>
>> Yes we can remove that property from sdhci , but &mmc node in DTS is common for all mmc drivers and this "ti,needs-special-reset" property is defined there for one board, so even when I remove it from DTSI for sdhci nodes, the DTS file still contains this property in &mmc node which is also common for other mmc drivers, so even if we remove that property for sdhci node, we still need to define it in YAML to resolve dtb_check. The issue here is not removing the property from sdhci node in DTSI file, but to remove it from &mmc node from a DTS file which is common to all mmc drivers.
>>
>> Here is the DTS node (ti/omap/am5729-beagleboneai.dts) which contain that property and is common for all mmc drivers.
>> &mmc2 {
>>         status = "okay";
>>         vmmc-supply = <&vdd_1v8>;
>>         vqmmc-supply = <&vdd_1v8>;
>>         bus-width = <8>;
>>         ti,non-removable;
>>         non-removable;
>>         mmc-pwrseq = <&emmc_pwrseq>;
>>
>>         ti,needs-special-reset;
>>         dmas = <&sdma_xbar 47>, <&sdma_xbar 48>;
>>         dma-names = "tx", "rx";
>>
>> };
> 
> I'm pretty sure that's not how &mmc2 works and you are confused. I
> would suggest you do a dtb->dts pass and compare the results.

So, I can remove ti,needs-special-hs-handling and cap-mmc-dual-data-rate properties from a similar DTS file along with ti,needs-special-reset as these properties are not used for sdhci-omap driver and are no longer in use, I will remove these properties from YAML too, if this is true. Can you confirm this?

> 
> Rob

-- 
Best Regards,
Charan.


