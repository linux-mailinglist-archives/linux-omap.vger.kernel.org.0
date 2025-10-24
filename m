Return-Path: <linux-omap+bounces-4744-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CC2C045C3
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 07:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AB6D64E1D44
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 05:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556E7245023;
	Fri, 24 Oct 2025 05:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrEj62U+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630E327453
	for <linux-omap@vger.kernel.org>; Fri, 24 Oct 2025 05:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761282435; cv=none; b=ra3xtgHuU/UV7sXwsP6IAkC9q9JGrAVKRe0vuNKGHKmsq0yu362bXPIxy9jNavtSDDGjvSAzUL+YPKOUMv1d1DYlyaJq8rbjdcN7RIXISGkODTlS3mrcqgrRmYSF96Bz5ldTzxVG/wPX1Js9xY7hPuu2tmVa/0/rIrEqgL3QVUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761282435; c=relaxed/simple;
	bh=KOf5eTT11tPiB1wFmIqqQb2LaNMmdMl4equqT2XQSgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c5eN5IW/hEmgtcq55f/QTIszP6Cxp4EH6YoyBxFnszxNesSEcvWQeV0cMc7NcVCdJ+iJFf+GMG7E5BowJ6rQ7Tmlh+oeuC7CKffF0uQ9y5tOlWttDH4mSBmqpFFnuuzYTbySeqrB37W1So2IE2lQMvj1KynQBvPyouZy6d3VzmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrEj62U+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29470bc80ceso17383675ad.1
        for <linux-omap@vger.kernel.org>; Thu, 23 Oct 2025 22:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761282433; x=1761887233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4dG92IcCVVEabZWYsVaYXSiYtILZo3vNbT6RrXxXUAA=;
        b=KrEj62U+wZCAW4o0pOqJ3kxshHA+YGyvNmEmi9+BTecmG32HaeA38Mi/UNkUstlQEQ
         ErApVwqZsVg2gFi36uwH6suFiTqt/F01iuQyCkLQnJK15icYyfhGhKQmX8EXL/mU2q7A
         /tgwmSrUG1O/6x99cqtbjA/Nho3+gSNNwY38qq3q+Sm9pqZyFEVrFBs2An4OPrg8PPvI
         +EBbH6iUVsakG0PoE8FlwkZs5xzqV2LJ1CRhR4luzD4kFT1xGmjJFPUkUwSU+zh/1XM1
         nh0S2sFziglqDoXYYNY7QjpaIcvuw+oMuuNFtC68Bf3whNX4I8E9shCRnxyCiVx2tVay
         UY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761282433; x=1761887233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dG92IcCVVEabZWYsVaYXSiYtILZo3vNbT6RrXxXUAA=;
        b=psS71ITy9G91GvWWTqKFSSnpUH+z/EsGZjWDmPjnVFJWyuzpt9A9RylpYPbGZec4Xc
         lb6jI9DXBI5hrA5g4h7lnR45QX0czfAfnof0mLvCPIqz6tCY9vMyqfhqARrD5XTPwGR/
         5hHiTq7HwzkzSRpQIeq3AuNMCY/NFHL4gxR58qzLbb6n1XaqPQ0sXqs/BLD0mRfyS7tq
         y4F+BUSAgOFrDOoSUfBivFYXSpg1C0uM5kSfTaRYmfvLLPB1HZosXwxgP7IDReMxV4Mv
         G4vfDorPO5GS8JfswjN83sqTQsv5w6YVYN6Qb0S9PuQFsy19g2sIVGRU26dRPMssPdzt
         a6Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVs0NjdlQAzoL1ddhlV2QbsF7ubjzjpUdDePTzWHjcB0kPZhdmAubr9J6id5xjAxC42AVjVzKTvbUY1@vger.kernel.org
X-Gm-Message-State: AOJu0YyU1Iwt769xQRGO/XMQ7M5IsclQXXGxBNwl2TkDBR+tgpqU5EyV
	d4upk/Fvpn/ooKFCCvUKxCIQmWNXbnMz4QT/9vcmOitFYJXSoYFopasU
X-Gm-Gg: ASbGncuhVMZDN6+yIQPbg05KSjSiZRfd7Gyq2oJWbUbmKEAQ5IsIgpRY7d5PURYTvAB
	5xkcm1YLHAcj5zD73+p/+681rLmYysbXCpSxhrfS0P7agw1OjLFyWILCozxKfXQ6l5t+nXaunSW
	qDfjtEc+lj6kjmwca+HMWq96kJPIhTeDIckfMV7xwCxFM5UZzmRIqQheuRbKDuMyZm7mcF2Nh5w
	hJWGlohtQRw/cDMMPrcA/SYOEspEmbLv6gz1AGysyCLjduHzSus4qEF4rOwbhBG3g6FKDPZjJnd
	x70FwrJHWdoCZZvWjbWW8NmbR69WAL3iizaXizK8O9k1/d1qvCP89zBLoU161G4L6e3I9ZnBj/r
	fiU4oeVhcSRSDaUtyGsJhvBQjGI38e8pRhW9PZ8C33NGdf/xvsr2lbxTnS0/nQqEitkFWuGjhig
	5ELEqyY5+OuhEqGnZCI5mmQPNKAv6hzzz0
X-Google-Smtp-Source: AGHT+IGBgs2rmcQIySneHl58HLdSVRyoiObGynjzZrftZshrhpjwRJbzVvC89kZLGHBalw0a0P9C5w==
X-Received: by 2002:a17:903:1ae3:b0:267:cdc1:83e with SMTP id d9443c01a7336-29489e10c88mr17625235ad.15.1761282432595;
        Thu, 23 Oct 2025 22:07:12 -0700 (PDT)
Received: from [192.168.1.5] ([27.7.191.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e9dd105sm40716945ad.24.2025.10.23.22.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 22:07:12 -0700 (PDT)
Message-ID: <cc3ff4ce-1ea5-42a5-810b-c330b1fbb3a4@gmail.com>
Date: Fri, 24 Oct 2025 10:37:06 +0530
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
 <879da8d0-1ea5-4495-90e5-03b55aa91362@gmail.com>
 <CAL_Jsq+ZmvVHvmLYKQD0fn74+9WcnmDVAqC1Q48HFLVN35tuFQ@mail.gmail.com>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <CAL_Jsq+ZmvVHvmLYKQD0fn74+9WcnmDVAqC1Q48HFLVN35tuFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 23-10-2025 23:52, Rob Herring wrote:
> On Thu, Oct 23, 2025 at 10:40 AM Charan Pedumuru
> <charan.pedumuru@gmail.com> wrote:
>>
>>
>>
>> On 20-10-2025 21:28, Rob Herring wrote:
>>> On Mon, Oct 20, 2025 at 10:44 AM Charan Pedumuru
>>> <charan.pedumuru@gmail.com> wrote:
>>>>
>>>>
>>>>
>>>> On 20-10-2025 19:57, Rob Herring wrote:
>>>>> On Sun, Oct 19, 2025 at 01:04:36PM +0000, Charan Pedumuru wrote:
>>>>>> Create a YAML binding for ti,omap2430-sdhci and fix vmmc-supply
>>>>>> property typo for a DTS file.
>>>>>>
>>>>>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>>>>>> ---
>>>>>> Note: The property "ti,needs-special-reset" was not removed from DTS cause it will
>>>>>>       disrupt the compilation for other compatibles as the node &mmc is used for all
>>>>>>       compatibles for some DTS files.
>>>>>
>>>>> I don't understand. AFIACT, "ti,needs-special-reset" is only used for
>>>>> the hsmmc driver/binding. But this series for for the sdhci
>>>>> driver/binding. So shouldn't the property be removed from sdhci nodes
>>>>> (and the binding), but kept for hsmmc nodes?
>>>>
>>>>
>>>> Yes we can remove that property from sdhci , but &mmc node in DTS is common for all mmc drivers and this "ti,needs-special-reset" property is defined there for one board, so even when I remove it from DTSI for sdhci nodes, the DTS file still contains this property in &mmc node which is also common for other mmc drivers, so even if we remove that property for sdhci node, we still need to define it in YAML to resolve dtb_check. The issue here is not removing the property from sdhci node in DTSI file, but to remove it from &mmc node from a DTS file which is common to all mmc drivers.
>>>>
>>>> Here is the DTS node (ti/omap/am5729-beagleboneai.dts) which contain that property and is common for all mmc drivers.
>>>> &mmc2 {
>>>>         status = "okay";
>>>>         vmmc-supply = <&vdd_1v8>;
>>>>         vqmmc-supply = <&vdd_1v8>;
>>>>         bus-width = <8>;
>>>>         ti,non-removable;
>>>>         non-removable;
>>>>         mmc-pwrseq = <&emmc_pwrseq>;
>>>>
>>>>         ti,needs-special-reset;
>>>>         dmas = <&sdma_xbar 47>, <&sdma_xbar 48>;
>>>>         dma-names = "tx", "rx";
>>>>
>>>> };
>>>
>>> I'm pretty sure that's not how &mmc2 works and you are confused. I
>>> would suggest you do a dtb->dts pass and compare the results.
>>
>> So, I can remove ti,needs-special-hs-handling and cap-mmc-dual-data-rate properties from a similar DTS file along with ti,needs-special-reset as these properties are not used for sdhci-omap driver and are no longer in use, I will remove these properties from YAML too, if this is true. Can you confirm this?
> 
> If the properties are not used in drivers or .dts files, then yes they
> don't need to be in the schema.
> 
> I think you just need what you had previously and just drop the
> changes to hsmmc nodes.

Yes, I understood now, thanks for the clarification.

> 
> Rob

-- 
Best Regards,
Charan.


