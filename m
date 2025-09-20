Return-Path: <linux-omap+bounces-4644-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7EEB8C08B
	for <lists+linux-omap@lfdr.de>; Sat, 20 Sep 2025 08:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BEAD1B25CC8
	for <lists+linux-omap@lfdr.de>; Sat, 20 Sep 2025 06:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8680235355;
	Sat, 20 Sep 2025 06:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hag0sJYP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA77223DD6
	for <linux-omap@vger.kernel.org>; Sat, 20 Sep 2025 06:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758349297; cv=none; b=OHPQSSWkCqzClORWalkp3TYJ3AC6Lz8daTiLLj4NriSLh95/cJ5ues70//I/N0CHCmSQYDlYnziUCtbwbpkNLp9CHrBxXpLHJA0lNRiSrx0Tz8xqaeQL2XIjbY1M0wFNgPAIgKTII/VYOjcSpRvLSnzVjXRg4uSq+jGwz3hLZqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758349297; c=relaxed/simple;
	bh=2CS7puWReal692Afu/64ZmVU6Duki90EiB37CO+lLJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrYMGckfWJQdx4RzoH/hR44xuPG4mPyhzEYCyXc2nzdT9NSaeTdc8SAN7lDVMjMdHv1yn69pexcg2766dWP4CcenuqwDSj3q19TXLiWFTbCQ0W8vMdQAxYaLB9TggXwZ9ly5qqifnWLZG9TdX+fVtVhth/I70yhv44kW7cIhKtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hag0sJYP; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so2846321b3a.0
        for <linux-omap@vger.kernel.org>; Fri, 19 Sep 2025 23:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758349295; x=1758954095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cIvPS4JbRoaIqIYD1oAUKVTexrUyLyhHhsTO9zcUnAI=;
        b=Hag0sJYPpfTuN2OmpH5nNjDTCQd46YHuCl+s3IQ6MgvbO3ZgDVCWhCJlPUUsdDuq23
         AcOfiXofZwbx50gySiZIf6NYOyk7+xTImP0lvq2NRK3CVkjoYaiAoMBNS3rFnuUa9IIF
         aO7EpsefpZG3XXVGYkn7RrXFHWYeD5OI7r+0w2eodlE5GK1xGiKQ6eETNimcfrNr6F2/
         IXrx/EWNzCOzIeLxoCOfsXCDzmOUwawTlWZNxp7zSIvrQlN6Wc5aaIOL6vnE0o3Y3X5v
         36kHsPVCenVqY+Oddxuix/lsYdrxyQ9ANOXF2GGPmmKj7Z+nXH30kyOuiw0D2sLlm53j
         Hk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758349295; x=1758954095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cIvPS4JbRoaIqIYD1oAUKVTexrUyLyhHhsTO9zcUnAI=;
        b=ex9VqXAUuQEIK5unk+BD4WWALD7RrnksXzssZmRUzlktIIGL/1TzUDIgGWUy5eEkuM
         7veLm9sN/7Cr5FhWBdvWP8YXaM3BuFLCXtNRQLPp78SFcZcTIDXTQCPgLzdyurC+hPXU
         mX0/y0m2ZRhfp2utf1q7Hl2FDa9eAvLZRq94EyQMdjF7MqrtIRTF6j4FOKIQ18owXKkE
         O1nvgQGTeZfxTPMUCFJDHLGhBJiXhikop/XynUd4jvz9JExA3qbh3K76hxsllNRgGKWL
         4coLXMeDX+fAnHqkGn70t9KQgM+zPwgjJ+HScerUdHKPwpZ07hhO3/3tfHY5OpS3hBWF
         JR0A==
X-Forwarded-Encrypted: i=1; AJvYcCUnPRgbNJhxwUP4LkDZVQtOECQn3wvMG9NXfIP9w6KZ71OHlOxIhCZnFhhWFsz0HWzS5zOZF4AtE45m@vger.kernel.org
X-Gm-Message-State: AOJu0YxA8NHlQkmu64s8WhoYwIlBoaXhXtkCi5Sens1YNZ9JPGoMgTuC
	g0AWlKZkgrsC07vn3ju91yqTHT/IbiHUV2AV5bf+9u5G9mPblA/7P6Dm
X-Gm-Gg: ASbGncs8BLpkydTKvRBtAor8M1yre0KloiRPq7fFfG/UY6WaktfBkij+jMs3oH43P9w
	IxImlvLJ8+WpjwG83fwa893uaLa7o73wuunlVKs/ESRFUnA/QhQpKsdlvLqPwxrDrScsqUqU+kZ
	D3oeOVMi7HUnVCiZAxXCMrClV13W1t91PCQFVoSdvjCRMrvtQusCl9KB5tsKSwZBq86Wvm6WYj3
	QcwuK1TVwZaxn0d5QEkkitpfvZsbfN/elJF6akFRCLepkf8HXwehmQz3DZYI3cLl5QnGI27tyL2
	t36zYmf05z0bnfw9Ylx5e1nzxzztQHGrute2vnRGhXHIgdBMiio+qrTT+R/LgocO0G4Tsg7aeYM
	IhM14vGu4g/N3g6xeCEa0XJUwfhOSs34BCl/9hWiiiDVquIOmC07TzABDYDc=
X-Google-Smtp-Source: AGHT+IHGElTkmUUaEf0dyfyafF631v013uwqxUws1ECPfB3/tiTo1tIEbGI9id9D93IB5vks4u+lfw==
X-Received: by 2002:aa7:88cc:0:b0:77c:64d8:3afd with SMTP id d2e1a72fcca58-77e4ecbcb3fmr6469774b3a.28.1758349295059;
        Fri, 19 Sep 2025 23:21:35 -0700 (PDT)
Received: from [192.168.1.7] ([223.181.113.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77e20bf07c4sm4550315b3a.70.2025.09.19.23.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 23:21:34 -0700 (PDT)
Message-ID: <7cddfccc-864d-4fa8-812f-8c273fe1a626@gmail.com>
Date: Sat, 20 Sep 2025 11:51:27 +0530
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm: dts: ti: omap: Drop unnecessary or unused
 properties
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>,
 Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20250908-ti-sdhci-omap-v2-0-72927890482f@gmail.com>
 <20250908-ti-sdhci-omap-v2-1-72927890482f@gmail.com>
 <20250909-uptight-fluorescent-markhor-4639db@kuoka>
 <501a4e0a-2d6e-4a57-9006-91413bd2ebb4@gmail.com>
 <20250914222348.GA2080538-robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20250914222348.GA2080538-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15-09-2025 03:53, Rob Herring wrote:
> On Sun, Sep 14, 2025 at 12:19:15AM +0530, Charan Pedumuru wrote:
>>
>>
>> On 09-09-2025 12:50, Krzysztof Kozlowski wrote:
>>> On Mon, Sep 08, 2025 at 04:17:12PM +0000, Charan Pedumuru wrote:
>>>> Remove unnecessary properties like ti,needs-special-reset,
>>>> ti,needs-special-hs-handling and cap-mmc-dual-data-rate from the DTS
>>>> files as there is no user of them.
>>>
>>> No user? That's not true:
>>>
>>> git grep ti,needs-special-reset
>>
>> Should I remove ti,needs-special-reset property for the compatibles 
>> "ti,am335-sdhci" and "ti,am437-sdhci" instead of removing for all mmc 
>> nodes? ti,needs-special-hs-handling and cap-mmc-dual-data-rate were 
>> defined for board specific, so these two properties should be defined 
>> in the YAML file to resolve dtb_check errors or can I remove those 
>> properties for those boards too?
> 
> If those 2 compatibles don't use the omap_hsmmc driver then, yes I think 
> you can remove the properties from those nodes. Otherwise, shrug. Ask 
> the TI folks if you can't figure it out.

Those compatibles use sdhci-omap driver not omap_hsmmc driver, then I will remove those properties for the nodes with those compatibles. For the properties which are board specific, I won't remove them.

> 
> Rob

-- 
Best Regards,
Charan.


