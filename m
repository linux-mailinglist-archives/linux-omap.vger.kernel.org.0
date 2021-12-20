Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D160547AA32
	for <lists+linux-omap@lfdr.de>; Mon, 20 Dec 2021 14:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbhLTNLP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Dec 2021 08:11:15 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36064
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231495AbhLTNLO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 20 Dec 2021 08:11:14 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9726D3FFD3
        for <linux-omap@vger.kernel.org>; Mon, 20 Dec 2021 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640005873;
        bh=UT3yb2on5vb7qi6AxvGOpzfrY6Kkd8z0OP15gMsmiBo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=i7u5cwps9p9j9MrjvbqbI7pcS7y8i+904HYqWHM03b+m14PBsvLjHCVw0Qb3m1DtX
         ncVUHgrntiH7HJhEUNQYt0YtRAMZJuYJjedf+1jRlVKmb17KwQ5MeoYd/+ozqCs5W9
         8St8fP8xLTuOIeiIJ+llgiGHHUPCrdJpuRSqE82ZVwTrC4O8TQbMaErHJ9s1SoQuu6
         noa14ahu3fLDZEHpVRJOcbb37GZkw301qmE7PidM+uf0lwJt48dM1XRF5wxGVnSm8V
         aD3kcvUt6eGncPLIWKuHlmc2V/zT3Wx000rSnU7lQSAYmDr0Zm+NJ0emz7HgfgX4FK
         J7TEI+z6kZTvA==
Received: by mail-lf1-f71.google.com with SMTP id z23-20020a0565120c1700b004258a35caf2so2827773lfu.13
        for <linux-omap@vger.kernel.org>; Mon, 20 Dec 2021 05:11:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UT3yb2on5vb7qi6AxvGOpzfrY6Kkd8z0OP15gMsmiBo=;
        b=TeXiWCloooUHIcFx6eRJGLJ6tC2MyfUGaVIMgNFfThdagy/vlcfZquvEn6KggZvWTI
         41HdJUG51xfXUlokDGIUSBQ3OMc/q6WP3H1Pvw2JcSPuRkxoUuLsBD5UD57ES2QrXs6l
         9G/Vpb8mXL3naeaC0mGOXOMz/woN2XBXns/gR8lQEjkz7Cg4cotQ78m2Fpk/Pc2Cqviv
         TSgV2he5LXZEGt7mr7A7NW1skdVrJq8eFKPA29U5dAXUXBFFPA9zoAkpUp2T6IZj3Cgo
         sDoOOKL1Ntl/rGfcjH2H25vy3fc0SqWKDGqUqSXmedbKUEIpxaW+7jyYbdcOMdHMW7aI
         LBkA==
X-Gm-Message-State: AOAM532IeduUrR+Po8JLfV+WRUSAus2c0sxpRY3iw0CifsfjAmVhCOje
        2wJvHWMWFVg6Wh2yXHpXQkfp0o+ajEPG3ucOUG4K+C8soweFjOY7CZf7C8glifVfRI1AQtavFnw
        4oqoD4jE6Xg+1f1YPb3r7KUEGTiRu9E9sXnLkUZc=
X-Received: by 2002:a19:6912:: with SMTP id e18mr16353503lfc.25.1640005872879;
        Mon, 20 Dec 2021 05:11:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqJEKqWLJ9T71knFziOL/BJNclBCOVZhi6dq6bw62dTj8JNlsRGyrAogEkbajYbYo6uaSPsQ==
X-Received: by 2002:a19:6912:: with SMTP id e18mr16353488lfc.25.1640005872677;
        Mon, 20 Dec 2021 05:11:12 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s10sm153245lfr.45.2021.12.20.05.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 05:11:12 -0800 (PST)
Message-ID: <dbe8868e-3cda-4854-771f-22efcc795de8@canonical.com>
Date:   Mon, 20 Dec 2021 14:11:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 3/4] memory: omap-gpmc: Use a compatible match table
 when checking for NAND controller
Content-Language: en-US
To:     Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc:     robh@kernel.org, kishon@ti.com, nm@ti.com, vigneshr@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20211217102945.17432-1-rogerq@kernel.org>
 <20211217102945.17432-4-rogerq@kernel.org>
 <88ff0e3e-6709-68fc-88cb-f915dfddbe86@canonical.com>
 <76076ff5-22d9-82d8-ba9e-77755e1ac433@kernel.org>
 <691a7ace-f18c-157e-88d2-303213aa0ee8@canonical.com>
 <645e4b90-c866-d8cf-6a1a-fdcc10278124@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <645e4b90-c866-d8cf-6a1a-fdcc10278124@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20/12/2021 12:51, Roger Quadros wrote:
> 
> 
> On 20/12/2021 13:05, Krzysztof Kozlowski wrote:
>> On 20/12/2021 11:53, Roger Quadros wrote:
>>>
>>>
>>> On 17/12/2021 17:21, Krzysztof Kozlowski wrote:
>>>> On 17/12/2021 11:29, Roger Quadros wrote:
>>>>> As more compatibles can be added to the GPMC NAND controller driver
>>>>> use a compatible match table.
>>>>>
>>>>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>>>>> ---
>>>>>  drivers/memory/omap-gpmc.c                   | 8 +++++++-
>>>>>  drivers/mtd/nand/raw/omap2.c                 | 2 +-
>>>>>  include/linux/platform_data/mtd-nand-omap2.h | 5 +++++
>>>>>  3 files changed, 13 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
>>>>> index 624153048182..814ddb45c13d 100644
>>>>> --- a/drivers/memory/omap-gpmc.c
>>>>> +++ b/drivers/memory/omap-gpmc.c
>>>>> @@ -2091,6 +2091,7 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>>>>>  	u32 val;
>>>>>  	struct gpio_desc *waitpin_desc = NULL;
>>>>>  	struct gpmc_device *gpmc = platform_get_drvdata(pdev);
>>>>> +	bool is_nand = false;
>>>>>  
>>>>>  	if (of_property_read_u32(child, "reg", &cs) < 0) {
>>>>>  		dev_err(&pdev->dev, "%pOF has no 'reg' property\n",
>>>>> @@ -2183,7 +2184,12 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>>>>>  		}
>>>>>  	}
>>>>>  
>>>>> -	if (of_device_is_compatible(child, "ti,omap2-nand")) {
>>>>> +#if defined(CONFIG_MTD_NAND_OMAP2)
>>>>
>>>> if (IS_ENABLED()) is preferred. If needed, you could make omap_nand_ids
>>>> symbol visible always (so without ifdef around it), because extern
>>>> structure should not have impact when not defined (if I recall
>>>> correctly...).
>>>>
>>>>> +	if (of_match_node(omap_nand_ids, child))
>>>>> +		is_nand = true;
>>>>> +#endif
>>>>> +
>>>>> +	if (is_nand) {
>>>>>  		/* NAND specific setup */
>>>>>  		val = 8;
>>>>>  		of_property_read_u32(child, "nand-bus-width", &val);
>>>>> diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
>>>>> index b26d4947af02..fff834ee726f 100644
>>>>> --- a/drivers/mtd/nand/raw/omap2.c
>>>>> +++ b/drivers/mtd/nand/raw/omap2.c
>>>>> @@ -2352,7 +2352,7 @@ static int omap_nand_remove(struct platform_device *pdev)
>>>>>  	return ret;
>>>>>  }
>>>>>  
>>>>> -static const struct of_device_id omap_nand_ids[] = {
>>>>> +const struct of_device_id omap_nand_ids[] = {
>>>>>  	{ .compatible = "ti,omap2-nand", },
>>>>>  	{},
>>>>>  };
>>>>
>>>> I think OMAP2 NAND driver can be a module, so this should have
>>>> EXPORT_SYMBOL.
>>>
>>> To make it work in all combinations (e.g. omap_gpmc built in and
>>> nand/raw/omap2.c as module) I had to define omap_nand_ids table as static
>>> in the linux/platform_data/mtd-nand-omap2.h header.
>>>
>>> EXPORT_SYMBOL will of course be not required there. ;)
>>>
>> Which case exactly does it require to be static in the header?
> 
> Maybe there is a better way to do it.
> e.g. If omap_gpmc.c is built-in and nand/raw/omap2.c is not built or built as
> a module, what better way we can use?

Ah, you are right, that is the tricky configuration. It could be a
separate built-in source file which is being selected by OMAP_GPMC and
MTD_NAND_OMAP2, but it would be also an overkill for one-item array.

I guess your solution with header is the easiest.


Best regards,
Krzysztof
