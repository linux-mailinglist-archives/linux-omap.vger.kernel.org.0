Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2E436111F2
	for <lists+linux-omap@lfdr.de>; Fri, 28 Oct 2022 14:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbiJ1MyE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 Oct 2022 08:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbiJ1MyD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 28 Oct 2022 08:54:03 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7B71D587B
        for <linux-omap@vger.kernel.org>; Fri, 28 Oct 2022 05:54:02 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id d13so3317255qko.5
        for <linux-omap@vger.kernel.org>; Fri, 28 Oct 2022 05:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kEeSrSRoauh4yP6EtE63olcINHeLEQ9QpJOqvMuL25U=;
        b=wUtro+1EZHfw5B4/3J09EsyjapRcGWtQS0GdIy4KCwofTMwvNKVwHQxOy/QQ76U7V/
         AAKvUUlVm78Hv/OhIIk3FbNSN7dWrqCeTrxWkGU1/FRjw6P0WCzzgr4FjwXVNp3xpI4X
         e5983iUNbXyLkFkxxUKsJ95UeyQi8Kw0emxlhx1H60GnVKfNGLkdRPHswa9ASbBpYvG3
         Q79egLiYv1wbaEAHfc/nSPckRbO+Nq0MQ6LuvAnnKtOn2qAASPaU/7HW2OAxXUk8ca1W
         E0cHwqyNQwp47j2xFNSHiW67S/UfUZ8QGm54z4umvYUHr1VXealuahR1SIarbTjafu84
         Qg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEeSrSRoauh4yP6EtE63olcINHeLEQ9QpJOqvMuL25U=;
        b=U18qUhDjvPcrvIWXzBdZQOy99a+0vnNHaUs2YRa/gPe2fKHJ5+jcusebNfTYTsEQY/
         k9X7l9Symvk54ytYfc68jClJ277AcmWAQMBsOf7yYSuJBQuqvZ+oHO9uJEmhZLzkJO2x
         1Z6eIDN/Upo4n6LLt2otZ3HDm9w46o06eMFEYu93nPK5L3mNbbZYMCOkQLiKhnl7M3zV
         W4mr/CyWGMdzA0qlxbOeoI6sU+jkKZlvOXL6IcK5WxjnxDlPDEpTD8sSY6q2WMPPE+Yw
         FGR2F2f2pOqpWoaiHbuSl3fhPsyqBeAUXq2iuWqEoLhu5xE0c73xdu5CEMTrNEyezt0R
         o0Qg==
X-Gm-Message-State: ACrzQf3YhWLVVuqDMta5UOG1TXGg/7PwKeWZYysu2jGVlPB3d3eQPvA3
        mQiYgSbR+iVzUYJzlketUZJ2bA==
X-Google-Smtp-Source: AMsMyM6C/1c9UBXeRkD69IYMnNOe1rCNATWrDwGIPoBN/c1AuHDUKAi80WQb5qcIwppBiCVSl/3eiQ==
X-Received: by 2002:a05:620a:318b:b0:6ef:1a8e:bb3b with SMTP id bi11-20020a05620a318b00b006ef1a8ebb3bmr27849682qkb.248.1666961641869;
        Fri, 28 Oct 2022 05:54:01 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id k26-20020ac8605a000000b0039a55f78792sm2302072qtm.89.2022.10.28.05.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 05:54:01 -0700 (PDT)
Message-ID: <4555c84a-4c3d-031d-4961-d4a46a1fdd50@linaro.org>
Date:   Fri, 28 Oct 2022 08:53:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 0/2] gpmc wait pin additions
Content-Language: en-US
To:     Roger Quadros <rogerq@kernel.org>,
        "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     robh+dt@kernel.org, tony@atomide.com
References: <20221021081612.591613-1-benedikt.niedermayr@siemens.com>
 <b80c95e5-6615-25b1-93b5-2db52b7d5ebe@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b80c95e5-6615-25b1-93b5-2db52b7d5ebe@kernel.org>
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

On 28/10/2022 07:56, Roger Quadros wrote:
> Hello Benedikt,
> 
> On 21/10/2022 11:16, B. Niedermayr wrote:
>> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>
>> Currently it is not possible to configure the WAIT0PINPOLARITY and
>> WAIT1PINPOLARITY bits of the GPMC_CONFIG register directly via
>> device tree properties.
>>
>> It is also not possible to use the same wait-pin for different
>> cs-regions.
>>
>> While the current implementation may fullfill most usecases, it may not
>> be sufficient for more complex setups (e.g. FPGA/ASIC interfaces), where
>> more complex interfacing options where possible.
>>
>> For example interfacing an ASIC which offers multiple cs-regions but
>> only one waitpin the current driver and dt-bindings are not sufficient.
>>
>> While using the same waitpin for different cs-regions worked for older
>> kernels (4.14) the omap-gpmc.c driver refused to probe (-EBUSY) with
>> newer kernels (>5.10).
> 
> This series does not apply on v6.0 nor on v6.1-rc1.
> Could you please rebase on v6.1-rc1 and send? Thanks!

I am still kind of expecting your review of these. Shall I not?

Best regards,
Krzysztof

