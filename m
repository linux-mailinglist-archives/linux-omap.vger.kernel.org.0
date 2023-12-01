Return-Path: <linux-omap+bounces-89-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB7D800CFB
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 15:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 766E7281A55
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 14:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A473D975;
	Fri,  1 Dec 2023 14:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="afVsPJ/e"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E562410F1
	for <linux-omap@vger.kernel.org>; Fri,  1 Dec 2023 06:17:50 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50bd52e1435so1735605e87.2
        for <linux-omap@vger.kernel.org>; Fri, 01 Dec 2023 06:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701440269; x=1702045069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dS/VbPECbYH+oSA/PSIJz8GFSptb5QIDmEdIGI/hnl4=;
        b=afVsPJ/eeQ+2jgDEpVuFlHj9e2GvcyDWEz1OmhKXTPZrn6B8b+GmFV+Yf+DgFFvedr
         3kDNEb2qQfoj7F5+CGC2veQ312WtC1pU12IJKN6Ky6ILg8YzIXhuD+xCKCS3Ck5ZVKLk
         VOUq6KPhMs89rgR6zNaZd6ttr8I3Te49rI7Fas7k6xHcwfWQ19xfvA+NhikZ9VYWiv5l
         UKz6+CwWCeT8DhSBuNtyatj9gzTvuqNCCKGgvP0fKOaxB6RHk2mouk8+MtpK688vsF/X
         5Kt7s+fdbTUdIvOdqqtA5lymI3nCeHK8FfhhhJg2OVnUyO15o2M/pXPJvtZWWhuDZSNT
         Lxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701440269; x=1702045069;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dS/VbPECbYH+oSA/PSIJz8GFSptb5QIDmEdIGI/hnl4=;
        b=DbAuRc1BFZ+VSf+iqVP8Sujt2xBhaKZkQ8h4S3VGI/5e6ObFA5Ki5n4urY7CLvVx0/
         d2o4q7sOCIIHCQuj/ObYu1JexPSaynNhxx14DRq8mVvRF2NTJI5Sw9wbIWTpB9SzKpWS
         avnpYn4gG8tsH/CPFzBvbCKph+2s2wPdOfBB/58XaU2JP1YAJcO6WXsf41sO6/Y3Dqkf
         tzgRRVP+V4y4PHcqwI9Gk/+P/e4/I5zJn1ptsVNlWKKKJ95JyCp7Q9cAzCpYkErE9cp7
         SALWkKVbzZb4yMZMQEnPrrLa2A5J/7Nl5V3iPB1Ljsl9YAsq7uT2DhTVaebnQqIu3psr
         1aTA==
X-Gm-Message-State: AOJu0Yxi/flSGAaRLZYyxcOYcYMooHeRL/EHTosD4TJXv1cnf06e3BBg
	qyTqJjFUlYEj/xEl8A2KOKmplw==
X-Google-Smtp-Source: AGHT+IGhfzqW22MczkjnR+L75DDw1xhlpjFPn9mwiqVbJaxXJY/AuNzngmeZcGKs64QZ8PkobdKQ+Q==
X-Received: by 2002:a05:6512:1149:b0:50b:de2c:3d1f with SMTP id m9-20020a056512114900b0050bde2c3d1fmr350496lfg.15.1701440268922;
        Fri, 01 Dec 2023 06:17:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id g18-20020a05600c311200b0040b42df75fcsm5551309wmo.39.2023.12.01.06.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 06:17:48 -0800 (PST)
Message-ID: <7aaea1e4-b7bd-47e4-a6e6-32b8195ea1bf@linaro.org>
Date: Fri, 1 Dec 2023 15:17:46 +0100
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
 <7361082a-f271-4ef4-9dad-06ee7445c749@linaro.org>
 <20231128214116.22dfff1e@akair>
 <221ba6a3-c4c2-40cd-b1d8-8170af78c784@linaro.org>
 <20231201150937.3631ee99@akair>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231201150937.3631ee99@akair>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/12/2023 15:09, Andreas Kemnade wrote:
> Am Wed, 29 Nov 2023 09:15:57 +0100
> schrieb Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:
> 
>> On 28/11/2023 21:41, Andreas Kemnade wrote:
>>> Am Tue, 28 Nov 2023 09:41:23 +0100
>>> schrieb Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:  
>>>>> If the interface clock is not below a ti,clksel then we have reg.
>>>>>    
>>>>
>>>> This should be expressed in the bindings. It's fine to make the reg
>>>> optional (skip the description, it's confusing), but the ti,clksel
>>>> should reference this schema and enforce it on the children.
>>>>  
>>> Well there are other compatibles below ti,clksel, too, so should we
>>> rather add them when the other .txt files are converted?  
>>
>> This binding should already be referenced by ti,clksel. When the other
>> are ready, you will change additionalProperties from object to false.
>>
> I played around with it:
> 
> --- a/Documentation/devicetree/bindings/clock/ti/ti,clksel.yaml
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,clksel.yaml
> @@ -33,6 +33,11 @@ properties:
>      const: 2
>      description: The CLKSEL register and bit offset
>  
> +patternProperties:
> +  "-ick$":
> +    $ref: /schemas/clock/ti/ti,interface-clock.yaml#
> +    type: object
> +
>  required:
>    - compatible
>    - reg
> 
>  
> That generates warnings, which look more serious than just a
> non-converted compatible, so lowering the overall "signal-noise-ratio".
> 
> e.g.
> from schema $id:
> http://devicetree.org/schemas/clock/ti/ti,clksel.yaml#
> /home/andi/linux-dtbs/arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb:
> clock@c40: clock-rm-ick: 'ti,index-starts-at-one', 'ti,max-div' do not
> match any of the regexes: 'pinctrl-[0-9]+'
> 
> I think we should rather postpone such referencing.

Are you sure in such case that your binding is correct? The warnings
suggest that not, therefore please do not postpone.

Best regards,
Krzysztof


