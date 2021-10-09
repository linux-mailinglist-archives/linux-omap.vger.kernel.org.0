Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7861F427B06
	for <lists+linux-omap@lfdr.de>; Sat,  9 Oct 2021 16:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233858AbhJIO5s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Oct 2021 10:57:48 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48426
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233789AbhJIO5r (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 Oct 2021 10:57:47 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5959D3FFEE
        for <linux-omap@vger.kernel.org>; Sat,  9 Oct 2021 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633791350;
        bh=OR65H5NuMBUvU2gGs2fbaIk23M5ThHLMaMsBl/nMMeE=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=l51lXQWdqHgkK9F20f5bM7ZzoVGipin1ZBQh7NAFkzgULJtPqzgKw6T/XedRlYr56
         DWplnqTZnEZVSYrELBdqFqjxuxNBTZaJiog+lxizfr5DqiSk76YiFFdkXcOWEPnnla
         CZWGxt0jCuq0HNcRZvV6veFmwSmxLs0Swl8oB587Iwqp0fViN4ckDU/8/k0C2FUozm
         H194OlAfs9SPLo2ESNx4IdIixDUgHafjTCPDl863Izl6fVZroPYJasAyHl8Fl+aK02
         8SX5dPyk3noYacD1R83PfYQs76iOuf1wLGesBiYeuvhgLL4H3+4DT0NDKONUl3E/BI
         c0Fx9odF/Wb8w==
Received: by mail-ed1-f71.google.com with SMTP id z6-20020a50cd06000000b003d2c2e38f1fso11798830edi.1
        for <linux-omap@vger.kernel.org>; Sat, 09 Oct 2021 07:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OR65H5NuMBUvU2gGs2fbaIk23M5ThHLMaMsBl/nMMeE=;
        b=EG/z8sas/GfdrHlH4MFl7+tYYWHvMBSrfivPJ5I1ehR/B5zQer7tghu1xkNqK0Ixw6
         ZlXEz2bivisRS8gD3dk98Q20h3zEKHA2PxuL2/tWoGce5RwecVruqiS+Qgjbk9puauEm
         GZDZGTTUP6ZmHXUtYTfEszjMlDA+oA074rIfPIA5ETiCik+3B2N0AdTb6lM7nUDf1Nhp
         VabovVIutxw7v39+mAC2hRmITHuydSRiXJJgyssS28U7nQ7z/613S3Cavw4IFNQ4hXV6
         lubyL1nRuKM9qSZQ/l8BVp/X0kXsBkHtl1MqZY4wMKhCFs8NF83PQfEbUiNRLsS3HSzc
         CIyg==
X-Gm-Message-State: AOAM533hIptQbnSjBAnNks14UJytQBYa6SQaOhIjoMP0eYHmoJKWPaxR
        LF0OEKRY0aFpKBcmh66kVO3gmEdyNRhQhnIdGabfBiVWz3FOfEYwO/LnUqz/eNDqjMhQJTr42E+
        lwrMS9pVDioVLGKH5uAJ+I3eTZs89Pa5pgv4AEWc=
X-Received: by 2002:a17:906:85d1:: with SMTP id i17mr12344764ejy.489.1633791349363;
        Sat, 09 Oct 2021 07:55:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysZic929Uxw8JYpz7WzFewFmKc77x3gZ5rU/zJ0CZ4rD4WUO5T09DI1UO8d+VtTaHPd4U6Pw==
X-Received: by 2002:a17:906:85d1:: with SMTP id i17mr12344735ejy.489.1633791349134;
        Sat, 09 Oct 2021 07:55:49 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id r19sm1303981edt.54.2021.10.09.07.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Oct 2021 07:55:48 -0700 (PDT)
Subject: Re: [PATCH v5 0/8] dt-bindings: memory-controllers: ti,gpmc: Convert
 to yaml
To:     Roger Quadros <rogerq@kernel.org>, tony@atomide.com,
        =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        nsekhar@ti.com, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211007120830.17221-1-rogerq@kernel.org>
 <6b90a6fd-001f-a41a-b69f-2bd3ec8a8e26@canonical.com>
 <e165b6ee-91d3-3a50-3b9d-3f15fa82a101@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <64b65579-7153-1e7d-9866-77ce07fd1df5@canonical.com>
Date:   Sat, 9 Oct 2021 16:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e165b6ee-91d3-3a50-3b9d-3f15fa82a101@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/10/2021 21:10, Roger Quadros wrote:
> Krzysztof,
> 
> On 07/10/2021 20:37, Krzysztof Kozlowski wrote:
>> On 07/10/2021 14:08, Roger Quadros wrote:
>>> Hi,
>>>
>>> This series converts ti,gpmc memory controller and ti,gpmc-nand and
>>> ti,gpmc-onenand MTD controller bindings to yaml.
>>>
>>> cheers,
>>> -roger
>>>
>>
>> Hi,
>>
>> Although you did not mention it here, it looks like you have some
>> dependencies between the patches. Maybe this shall go simply via Rob's tree?
>>
> 
> Rob has acked all the DT binding patches.
> So it is upto you and Miquèl to decide the best way. MTD tree or Memory controller tree
> for the dt-bindings patches.
> 
> The ARM: dts changes should go via Tony's OMAP SoC tree.
> 
> Or if Tony is OK with it then maybe all patches can go via Tony's tree? :)
> 


I reviewed the two memory-controller patches, so feel free to take them
via MTD or OMAP SoC.


Best regards,
Krzysztof
