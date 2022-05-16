Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96D76528C19
	for <lists+linux-omap@lfdr.de>; Mon, 16 May 2022 19:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244247AbiEPRgg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 May 2022 13:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344324AbiEPRgf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 May 2022 13:36:35 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EEB31F606
        for <linux-omap@vger.kernel.org>; Mon, 16 May 2022 10:36:33 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id o12-20020a1c4d0c000000b00393fbe2973dso11367263wmh.2
        for <linux-omap@vger.kernel.org>; Mon, 16 May 2022 10:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qm/hyYGNx6E0+awyuae5gq8Kj5pYNEmIlldZLbvGEc4=;
        b=E4vlPnYiGHteAmnsuQWiQcvxwJBgAPo0qKeYV9wJEmhGyPB6rjsGn2fRmlJjwhGwrj
         4w0TNDQ+NLUXTUcXFDkskLY95p5r50K1eX1JmUytrMOS37peVh1NxqbjkK51YL5VeIJ+
         e/4A3Pb24pB7f5jg5e1M6M34OgklW6JNo+Kjv9ngrGO26/d+8bBpzJ1cagtbwdn9rQax
         o/+EeTjmm0z4dtjVFN0NNZDEeiGYNo0Ueh6CGLQm6yZy9j1xralOw8tyDJXVX5urq0HM
         QeN9jHLLGmRdugWpAwixvRthnNjXoaIirE6/jOaCBBR+Is3RONv7QsMzyVtjNf1GlnPh
         XCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qm/hyYGNx6E0+awyuae5gq8Kj5pYNEmIlldZLbvGEc4=;
        b=GYUifsgI7ciXyA/+VOkJS7IEOfT7ZZU3khNp0aVzUKZ890NWh84jH6RevTZ2AGJeSo
         ZF44QiX1T6o3WGCNMdJ/0wWnBbLBUeYd1jINCC0s4SDKxE6GrTcet3C+bppd/QJzQgZa
         QBe8pj4efA4t5wt6PjPb7wloUKGpdiYWWR85Z/3hkVFg3TjHvCzQ6rJdY0707S19b8lr
         rXcVktDkyTXlA4NsGeheEfGG8QiLx8kkmp+meBj6yPsJiBIFYqcN8gBuI2nhjTjGJ8k8
         nafTiyX5VS3VwW7ZPW0+qt4Umt+Mrj3+ptQe6J3M/nkTWcAfF8uQKKLcLonFpozWO4QO
         /F9g==
X-Gm-Message-State: AOAM5308fuIGVuOsFlIBusLtBdFgNCLtPIndlA0K2mTMnpryFd7bi396
        Q3pnuX6AQABUDYZOjlIKM8hRvAqYT59wN5QeHKU=
X-Google-Smtp-Source: ABdhPJwvFDrDV8i/Tx3oUWBOP0kcjjLdo5Y72Zm14UOiCrPX2cjHvxbx7uQ7AVB7M1kws1lDB+GS7Q==
X-Received: by 2002:a1c:4456:0:b0:395:b9bf:57 with SMTP id r83-20020a1c4456000000b00395b9bf0057mr25625826wma.21.1652722592176;
        Mon, 16 May 2022 10:36:32 -0700 (PDT)
Received: from [192.168.1.177] ([88.127.185.201])
        by smtp.gmail.com with ESMTPSA id y13-20020a7bc18d000000b003942a244ee4sm6328346wmi.41.2022.05.16.10.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 10:36:31 -0700 (PDT)
Message-ID: <86a9798a-5fe6-7705-ed4e-6f5e798c7994@baylibre.com>
Date:   Mon, 16 May 2022 19:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am625-sk: enable ramoops
Content-Language: en-US
To:     Nishanth Menon <nm@ti.com>
Cc:     linux-omap@vger.kernel.org, vigneshr@ti.com, praneeth@ti.com,
        linux-arm-kernel@lists.infradead.org, khilman@baylibre.com
References: <20220516145408.1000678-1-glaroque@baylibre.com>
 <20220516164853.nai7xbmclvvkywf5@party>
From:   Guillaume LA ROQUE <glaroque@baylibre.com>
In-Reply-To: <20220516164853.nai7xbmclvvkywf5@party>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Le 16/05/2022 à 18:48, Nishanth Menon a écrit :
> On 16:54-20220516, Guillaume La Roque wrote:
>> Enable ramoops features to easily debug some issues
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> ---
>> Changes in v2:
>> - Apply script create-mem_map.py  with args given by Nishanth Menon
>> - Spelling fix
>> ---
>>   arch/arm64/boot/dts/ti/k3-am625-sk.dts | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
>> index 0de4113ccd5d..dfb16c29a000 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
>> @@ -36,6 +36,15 @@ reserved-memory {
>>   		#size-cells = <2>;
>>   		ranges;
>>
>> +		ramoops@0x9ca00000 {
>> +			compatible = "ramoops";
>> +			reg = <0x0 0xe0000000 0x0 0x00100000>;
> I think you intended 0x9ca00000 here?
>
> Static checks should have caught this for you. please run them
> prior to posting?
sorry for that i forgot to run it and update line .

i will fix it .

sorry for noise...

>> +			record-size = <0x8000>;
>> +			console-size = <0x8000>;
>> +			ftrace-size = <0x0>;
>> +			pmsg-size = <0x8000>;
>> +		};
>> +
>>   		secure_tfa_ddr: tfa@9e780000 {
>>   			reg = <0x00 0x9e780000 0x00 0x80000>;
>>   			alignment = <0x1000>;
>> --
>> 2.25.1
>>

