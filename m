Return-Path: <linux-omap+bounces-46-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 441437FB475
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 09:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CADEDB20C95
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 08:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB8519447;
	Tue, 28 Nov 2023 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EjSgOha9"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40E7BC
	for <linux-omap@vger.kernel.org>; Tue, 28 Nov 2023 00:41:26 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54a945861c6so7113076a12.3
        for <linux-omap@vger.kernel.org>; Tue, 28 Nov 2023 00:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701160885; x=1701765685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hykHkDjRhk1WUMG2x6+o4v1sbHZ0XPC/vbAlzmJumls=;
        b=EjSgOha9/reA8mQa9p9YMZQ97DQGz/rQL+eNH/N4DBrf+BCXOUqU3wVPrmWC2nufkF
         ZLD3QhYu1/eBXjAwDOJA2XOY7OtwT4GVS5EsK81U31irkxK3T3E9enPLLLwmarlCx9/Z
         zkqbGKw0PEBQW566Rw2oE2KxtBFfbdTacp/FI78DoA0xzkHyJyld08OJaMnBQ9iDtp1A
         XGnrpQMG608UjG0PYx6E/QTiekONstacu/tOHN5jUpFlQoR77Nfq4t/Yh+nhS6a1TW2v
         LFneXMvIUONiNiRFeMTmWRNN1z9OTWvaQx9RGIZObbzNAKrHEQD9Ne4PtSC/T8PmYSL9
         scPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701160885; x=1701765685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hykHkDjRhk1WUMG2x6+o4v1sbHZ0XPC/vbAlzmJumls=;
        b=LQuoQiPVpwJQwmuODUb0PNvIrA2iJlmK/RpSFdiaIipVty8fuuI8trY7k5aSd4Ljtv
         YAMHucFzVZDqmWw7+jY/7ZqOpN2kq9lUae0bVykNwDXat1ubwkC+K9uz4UN0P3TY2NHR
         YGyNtfDFdoqvAmq8ZsbvQMbGg8Nu+rcV6Q1EBCl1WApvjQmjzd55xcfaQVbgQJchWUld
         YoJOD0Vy/eMrOJYbFKFy2qN5KIcP9e69h+Ql5jK33nwc4iESGmHdlyhN3fXfNgxxsGFE
         j8z39727JKSerDLFeF5NUnIQWEJcnqqolFcQh6pdOldRzHzPGfU44B4Btux6zWCQMkhp
         obVg==
X-Gm-Message-State: AOJu0YwX2gpzfqjY4H3X7c9ITkMOKWvr8T3lrs9saffkc6rpbE1iiHzB
	fo8NEDUtDRvadP8zIxOFo87PrQ==
X-Google-Smtp-Source: AGHT+IEiOTImwiJU09ocHuI5yOd4q6uACBIb30e4NoWqHD1WuLAKRa0vIw2y3EneyPvwYSk5Ar/DRQ==
X-Received: by 2002:a17:906:6d8e:b0:a0e:d3d:5b42 with SMTP id h14-20020a1709066d8e00b00a0e0d3d5b42mr3265071ejt.12.1701160884982;
        Tue, 28 Nov 2023 00:41:24 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id bx1-20020a170906a1c100b009ddf38056f8sm6480942ejb.118.2023.11.28.00.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 00:41:24 -0800 (PST)
Message-ID: <7361082a-f271-4ef4-9dad-06ee7445c749@linaro.org>
Date: Tue, 28 Nov 2023 09:41:23 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert interface.txt to
 json-schema
Content-Language: en-US
To: Andreas Kemnade <andreas@kemnade.info>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, kristo@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20231127202359.145778-1-andreas@kemnade.info>
 <7a62ed8a-b0e3-4881-90d7-b8f5d38e482e@linaro.org>
 <20231128093241.707a4fa0@aktux>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231128093241.707a4fa0@aktux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/11/2023 09:32, Andreas Kemnade wrote:
> On Tue, 28 Nov 2023 09:00:16 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>>> +required:
>>> +  - compatible
>>> +  - clocks
>>> +  - '#clock-cells'  
>>
>> reg is required. Device cannot take "reg" from parent, DTS does not work
>> like this.
> 
> Well, apparently they do... and I am just dealing with status quo and not
> how it should be.
> Look at commit 31fc1c63c2ae4a542e3c7ac572a10a59ece45c24

Who designed clock-controller binding with a device node per each clock?
This is ridiculous (although of course not your fault here)! Looking at
omap3xxx-clocks.dtsi - all its children should be just defined by the
driver, not by DTSI.


> for the reasoning of not having reg.
> 
> 
> well, look at drivers/clk/ti/clk.c
> ti_clk_get_reg_addr();

That's a driver implementation, not bindings, thus confusion.

> 
> ...
> 
>        if (of_property_read_u32_index(node, "reg", index, &val)) {
>                 if (of_property_read_u32_index(node->parent, "reg",
>                                                index, &val)) {
>                         pr_err("%pOFn or parent must have reg[%d]!\n",
>                                node, index);
>                         return -EINVAL;
>                 }
>         }
> 
> 
> We have two usecases here (status quo in dts usage and code):
> If these interface clocks are below a ti,clksel then we are describing 
> multiple bits in the same register and therefore every child of ti,clksel
> would have the same reg.

Regs can have bits, so that could still work.

> If the interface clock is not below a ti,clksel then we have reg.

This should be expressed in the bindings. It's fine to make the reg
optional (skip the description, it's confusing), but the ti,clksel
should reference this schema and enforce it on the children.

Best regards,
Krzysztof


