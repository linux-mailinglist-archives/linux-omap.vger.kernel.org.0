Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10D8264CE6B
	for <lists+linux-omap@lfdr.de>; Wed, 14 Dec 2022 17:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238950AbiLNQy2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Dec 2022 11:54:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239180AbiLNQyU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Dec 2022 11:54:20 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4892982E
        for <linux-omap@vger.kernel.org>; Wed, 14 Dec 2022 08:54:18 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b3so11470995lfv.2
        for <linux-omap@vger.kernel.org>; Wed, 14 Dec 2022 08:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g4ET78kPouxJtleX0/D8/wwO+/VH2Xj4NPlSa2QjbG8=;
        b=OmvgWeK7sAu2ooEq8jNreKtk9F8WfhtHysaQaeap4iH6HXijrdKKOljTP1kekfIAbA
         ivMUf4VB8UWwd0DsoqP7koxDPpDi11yT9YWlSfPGTCmZ4NbkHHSjEBb9yKZ6weEshXGy
         7l+1ylnLD23leWCXOnmgQf04CASNBXZtlviPkhghJOIqvaZqAVXZKMm5N7hxXgB/MOC/
         wqjJw6xAkbtCLj63wFoBSUDqXtf3Cs51vCYiC69b7hCemFshprecF2fLtFecBoHsr09i
         IGAx0tlBeE8omqaee3myITVduyAueDtD6d76yj52JFuFKn3IxJLjTmtEjnrFzLd7Dq4u
         +4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4ET78kPouxJtleX0/D8/wwO+/VH2Xj4NPlSa2QjbG8=;
        b=D1ON7YZ65J6CoRXPIwrZfoV83IZ2+LsqR7PR4Hjgd75TH0J5Uc3KgowPqkjBP2h14A
         BChiSbYRjo9SW/AJQkbHec0lchm15NpYfz+6ZzxR2FNOufTgRk5DO+ic59+MEe2lmGnG
         ewbVqZ97ZWPwfjuyEOIp9CV0RmvG3Ze5bTFkUOyrWg2n2Yr84z44aSpGleUFZF3olmhy
         5NDFD91OMKsVrWzAD2UuPhuJoTEtARfMUS3kJ1RWHRNnzPLcjs4SdVu+assClewaNtvw
         LXS32+sMav309DxIHETfK6xrR658QxhYo9D4kyQMjIt7U22zn40WlRDUXARDJLsLVpVF
         pxtg==
X-Gm-Message-State: AFqh2kryB6MhpHqg9R2d2U8VAz/CA8vnlSBkAzpV8Ni3IBcx8TrGP8El
        9oDb0YraShwcRoayPZoJmE1nKRrslmxQf2QQ
X-Google-Smtp-Source: AMrXdXtqASp6OIX+87hBDF9GGJ1wVQKIY9LBc+tepjb1mQCkajMrc4FFGfElEhHmybWUHfgbniuOow==
X-Received: by 2002:a05:6512:3d2a:b0:4ba:555f:4795 with SMTP id d42-20020a0565123d2a00b004ba555f4795mr722550lfv.25.1671036856900;
        Wed, 14 Dec 2022 08:54:16 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u30-20020ac25bde000000b004b49025f96dsm871295lfn.187.2022.12.14.08.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 08:54:16 -0800 (PST)
Message-ID: <c7cb3be5-150b-a912-8801-670db63bd4ca@linaro.org>
Date:   Wed, 14 Dec 2022 17:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 RESEND 0/5] ARM: dts: nanobone: Fix missing/incorrect
 features
Content-Language: en-US
To:     Mark Jackson <mpfj@newflow.co.uk>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221130140547.295859-1-mpfj@newflow.co.uk>
 <CAAbcLfgUmiM=6eTQRRdkgLSEQZEcZwnzq0=Ov58S_osru-_V2Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAbcLfgUmiM=6eTQRRdkgLSEQZEcZwnzq0=Ov58S_osru-_V2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 14/12/2022 14:35, Mark Jackson wrote:
> On Wed, 30 Nov 2022 at 14:06, Mark Jackson <mpfj@newflow.co.uk> wrote:
>>
>> This patch series updates the NanoBone DTS file to address various missing or
>> incorrect features.
>>
>> v1 -> v2:
>>   - Move temperature sensor definition under I2C heirarchy
>>
>> Mark Jackson (5):
>>   ARM: dts: am335x-nano: Fix GPIO settings for RTS/CTS pins on UART3 & 4
>>   ARM: dts: am335x-nano: Enable RS485 mode for UART3 & 4
>>   ARM: dts: am335x-nano: Enable I2C temperature sensor
>>   ARM: dts: am335x-nano: Fix GPIO settings for MMC pins
>>   ARM: dts: am335x-nano: Enable USB host
>>
>>  arch/arm/boot/dts/am335x-nano.dts | 32 +++++++++++++++++++++++++------
>>  1 file changed, 26 insertions(+), 6 deletions(-)
>>
>> --
>> 2.34.1
>>
> 
> Any update on this patch ?
> Did it ever get through ?
> Do I need to re-submit for some reason ?

It's a merge window and you sent it just before it started.

Best regards,
Krzysztof

