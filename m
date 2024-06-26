Return-Path: <linux-omap+bounces-1601-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D23918807
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 18:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A26BC282325
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 16:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4059418FC84;
	Wed, 26 Jun 2024 16:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bn6PHjWn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F1118F2DE
	for <linux-omap@vger.kernel.org>; Wed, 26 Jun 2024 16:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719421080; cv=none; b=QL3ytYmb7akpQilohGVieYU+OY/bupg7Qdk+BBzPfBjSMuXLlrl/md2P+d3X8NVhTCl/S4Lop+3bNyB0ImtXTlF8eUCOrx4JaYjYyaOWajZGPQGvFpnMyFMk8mzAAUz8ppjVVYMVbjlNjI6FQWJXjr304MEcLwlgV6kUwLuUgfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719421080; c=relaxed/simple;
	bh=cwbiR09HSkyF4p97NwmCnWrMnCNy1DYvjg9L5WcDQGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IRRl/w+P5yHVYUFyWFHgL1pd8EoFMpJzodhlilOhhw2zmdh1AZmzFOWCkfc0dYNN4hVtn52NZpEwtkfYbU5VPkCUAcZwxNKffX7zE8mz38lh01y0KRSu/lwiWJIfDgTvo2e+VrWScvkubZL5UNoijjgnLDFpwg2mAAOX0c/uKKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bn6PHjWn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42561715d41so3433795e9.0
        for <linux-omap@vger.kernel.org>; Wed, 26 Jun 2024 09:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719421078; x=1720025878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9x5bHX81CYqUsN1PDPOb3SdIqaENR49GjahL/OeKqkI=;
        b=bn6PHjWnHNRWMr742Un8zYO5vKQapP0iuZVfRkBZ7jvTTtVSB7/4EPYC3hELKzBR6x
         bUcI+Btj1hhoms09ceaEHrjkGT2XBz/t2oahwrz00OnRlceS/4VUj4IKJck362+RG6GV
         RTTsRKa5OhjpckKqPF9FdTBT00Y2Vf0OI5MEJHGbgb3GtWhW7CbwrymgVuU7HCymc4mp
         /mDfd2vVAvoPdAiSx+ACZBRtRzKhFC5eetm2Z2wOQ4iaIxvxQz/O16acjWPAEb4eh/3f
         A1oB/nblBpcdsd5tZEKfsqCyIXinNcqUDQGYmzL0PFrl55EQUe6wcLmLD1s+jqVOGDpD
         66ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719421078; x=1720025878;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9x5bHX81CYqUsN1PDPOb3SdIqaENR49GjahL/OeKqkI=;
        b=Gur9N1WECtepOziuMK0jignwChlD/OxSSNuv0xwWSrDN8yDSL+gFgWkxUdR2iFgqhO
         iqKSvgNYZY63Jligb07txS8FC0TyrmDgDwzubXhb5GdzGvG49JUgReju0X/vKuuHE/3O
         LhU4OOUCNZg/F14rhaYYjb60IGIkH3uYU6o6oMWfroTSQjDhQ1qNey8IphU1bUz5irgS
         fBnzgeLU/+foM7xgD1I1kwiGOM/EZNE38WQxqsIdY+Bg4FOw9op4GlPxOXDXAS6sSwSi
         bX8qhOr8uMIAjYjvytUUp7UtRAmc67rSUZjEXZyz1vy2Tq9oxk0xSeNYfu5DkwOU+9hn
         9dMg==
X-Forwarded-Encrypted: i=1; AJvYcCU7Lra5a+BdSq4Sh//6QPdBzXF8SggAqwAUTaN5Ev4gMm5N2GHD/LVHJWDFE028ATNbDRYBAbRU/vdAcNeDg1SfaOQIRMotvI1H+Q==
X-Gm-Message-State: AOJu0YyyJv0vGFNL85whR53e3RoiqDLTqi7FN8F4rilqIYuwo22/IKyS
	ZNck5XOIhwIDI/gvqJqRw9H1sUh6Ne1vddaF1WkBcZO4WF+uBl3a4mbCy9Ilo6E=
X-Google-Smtp-Source: AGHT+IF1AcRSDiN2L6fr7scYAWajrmN8lEz4dyYQ5n3JB2GLj4Xai3YTOPT96I/b7FVdAw5AdMBEmQ==
X-Received: by 2002:a05:600c:1c18:b0:425:35a5:fad4 with SMTP id 5b1f17b1804b1-4256312cc91mr2201675e9.15.1719421077824;
        Wed, 26 Jun 2024 09:57:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c823c271sm31801645e9.9.2024.06.26.09.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 09:57:57 -0700 (PDT)
Message-ID: <2c71aa2e-2039-4941-b8ed-e7b9dd3d6d3a@linaro.org>
Date: Wed, 26 Jun 2024 18:57:55 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: omap am5729-beagleboneai: drop unneeded
 ti,enable-id-detection
To: Robert Nelson <robertcnelson@gmail.com>, "Andrew F. Davis" <afd@ti.com>,
 Roger Quadros <rogerq@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20240615174904.39012-1-krzysztof.kozlowski@linaro.org>
 <dcd6afee-b17d-4633-af7a-4a5dbf68be94@linaro.org>
 <CAOCHtYh8YucHNwV6+S-3vfHvygs=5_UGVwPt6R+i+qBTc3eOTA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAOCHtYh8YucHNwV6+S-3vfHvygs=5_UGVwPt6R+i+qBTc3eOTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/06/2024 18:48, Robert Nelson wrote:
> On Wed, Jun 26, 2024 at 6:34 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 15/06/2024 19:49, Krzysztof Kozlowski wrote:
>>> There is a ti,enable-id-detection property in the Extcon Palmas
>>> (extcon-palmas), but not in the Extcon USB GPIO binding and driver.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202406152004.F2fNnorG-lkp@intel.com/
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Tony,
>>
>> Do you still pick up patches for OMAP? Any comments on this?
> 
> Krzysztof,
> 
> It looks like Tony didn't send his final MAINTAINERS update:
> 
> https://lore.kernel.org/linux-arm-kernel/20240419055249.GE5156@atomide.com/T/

Oh, thanks for letting me know.

> 
> @Andrew F. Davis
> and @Roger Quadros have you guys set up a git tree for omap patches?

I will pick up this patch to my DTS cleanups/fixes, but let me know if
anyone prefers to take it instead.

Best regards,
Krzysztof


