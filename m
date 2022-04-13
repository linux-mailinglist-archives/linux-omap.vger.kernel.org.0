Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCF74FF75E
	for <lists+linux-omap@lfdr.de>; Wed, 13 Apr 2022 15:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbiDMNHW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Apr 2022 09:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbiDMNHV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Apr 2022 09:07:21 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D5C2FE4A
        for <linux-omap@vger.kernel.org>; Wed, 13 Apr 2022 06:05:00 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id k23so3833800ejd.3
        for <linux-omap@vger.kernel.org>; Wed, 13 Apr 2022 06:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=jVWSCk1/VKYg1ru1BSawO7JWuW1g2f78k2SPtwtYxzM=;
        b=bts10QH0JSWBe2V7AJgHw4qjXFZBtENfGekc2KrKoKHjqXDPNCndGpMUkhHgy7XVQb
         6M1qc+lnhyPJEgz1Qnc2ZTJm0wlLubrCanfnfeEX27QoVrI6FN7dI4XHr0XyjacoTNsN
         2iKlDKGPv8EvkryymE4kMLpVBpExOZVmxxPtEY0yb/256n6wOAo9CLKiCEeeEMu5/ULn
         8BMQl1UOvigQmCc/nVoxfCENYirXfc82zd3670fi3UrL5ZvVxjUsftojb7J17ua536Zz
         ph5lFj0wO3wWs+zqldyY1nRSDhfDosJEMGXg9yFwfatulSHTuw7Ip5pBoT/kSL/JNnF3
         0LpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=jVWSCk1/VKYg1ru1BSawO7JWuW1g2f78k2SPtwtYxzM=;
        b=IzVQDuDHck5qqQoSxzCL/ai8WqU9U+ur3RgxyeElcCbrLHgQon3Xdg/7MGD0ikI2Uh
         NKc2AGTX+1N/GBmQNult3hScxBIlD3lXNYBi5UsNdkNxDdJ1TxEJruoLAAtuKaIlsKVp
         CS4hrXOr7Ne4RgxeJJ7dKRuJqXsrMoHELBdLnAwjlGL0xnVs7zJN5Uq+57OOb+GMvzbI
         Z3xVeGS+vNNoiHXS+mQFTh5MRLLJ0hTZfahheyxe2/L4Dx9RZnIxIl5ULed13Yzaellz
         j8wWhtLdnWDFU1rQUzoOBclUMc81NW5M1Qe1LG0b5orw6Vls73+OTh34YBXJAyXdSCPL
         zB9A==
X-Gm-Message-State: AOAM530OviLx0AUCtBBsIlS2lcdrBxbOd8SZLLOYRc+10YTC7MPRR1v6
        NKByfIMFqVL19txaqjepw3t0MRcexBvnv95q
X-Google-Smtp-Source: ABdhPJyEP1jE0PHtwq+VxHUU/UZtA71ai6ZPUrV4OW242fMygMItK8oEk0TeE5fT/Zqz+8H0r9NiRw==
X-Received: by 2002:a17:907:7fa9:b0:6e8:c0e1:5741 with SMTP id qk41-20020a1709077fa900b006e8c0e15741mr4380743ejc.159.1649855098959;
        Wed, 13 Apr 2022 06:04:58 -0700 (PDT)
Received: from [192.168.0.204] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006b2511ea97dsm14062558ejc.42.2022.04.13.06.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 06:04:58 -0700 (PDT)
Message-ID: <e6e376a6-b604-4a36-bfed-641d905ebec6@linaro.org>
Date:   Wed, 13 Apr 2022 15:04:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 0/2] memory: omap-gpmc: Allow module build
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     linux-omap@vger.kernel.org, nm@ti.com,
        linux-kernel@vger.kernel.org, kishon@ti.com, tony@atomide.com,
        miquel.raynal@bootlin.com, vigneshr@ti.com
References: <20220411095516.24754-1-rogerq@kernel.org>
 <164984299612.34759.11981181842672620752.b4-ty@linaro.org>
 <20428012-f164-c03b-fcc5-d3d8df812aff@linaro.org>
 <ed2167af-fc9f-1f52-e8e2-c0881f5d53c6@linaro.org>
 <7b38a717-ffce-0f06-1a77-6d2a114c7e11@kernel.org>
 <68d16fbb-4250-73bd-b55e-a14db91abe8f@linaro.org>
 <fdafb49b-9349-087b-f483-4da888193683@kernel.org>
 <f2b7b48f-906e-3445-3861-dcdd4f6551e3@linaro.org>
 <605268c7-9d0f-83d5-d7e6-850dabb380f0@kernel.org>
 <06852353-9ca1-6f61-7447-b5f1d64ead25@linaro.org>
 <4681b00e-7f89-d9c4-6361-b781ced72656@kernel.org>
 <897a05fd-a568-9d33-dc20-5de4e5d2188f@linaro.org>
In-Reply-To: <897a05fd-a568-9d33-dc20-5de4e5d2188f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 13/04/2022 15:00, Krzysztof Kozlowski wrote:
> I understand that. You can still test 8-12 popular ones on a regular
> Ubuntu machine (there are like 10 or 12 cross compile toolchains now in
> standard Ubuntu repos).
> 
> Another way is to put your patches on Github and ask kbuild folks to
> test your trees. I think this was the repo (but double check):
> https://github.com/fengguang/lkp-tests

I think this is correct one:
https://github.com/intel/lkp-tests.git


Best regards,
Krzysztof
