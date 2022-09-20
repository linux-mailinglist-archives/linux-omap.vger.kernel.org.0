Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7C25BDE46
	for <lists+linux-omap@lfdr.de>; Tue, 20 Sep 2022 09:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiITHdT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Sep 2022 03:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiITHdS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Sep 2022 03:33:18 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7947A5FAFF
        for <linux-omap@vger.kernel.org>; Tue, 20 Sep 2022 00:33:17 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a10so2008682ljq.0
        for <linux-omap@vger.kernel.org>; Tue, 20 Sep 2022 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=PPl4mpHHpnRstvj9PRcbnaluXmvv7htKw/1jIOn3Ff4=;
        b=wbqVz5N0/fG0DlYdxK26xJ1g4MjRPTmojsGv9T++41W2N/vfL/DIefDUwnru1Nx2z3
         QOw61PZlDwyKlphqlniGHOEaIQ63R2HdRwO8ZgetJvB6WBZl2yXADIBa6GDG8JjL7Vz0
         Rb8MdkVrTp5yxVeMbhCEkJZUXSX7m42QCv+M1tY0yunUfTw5cH7f2PhXF93hhB1/tFXm
         9HFNbDgGcxAZjo9pd9Q1SywauKAUuuVk6du/PJfATDtV0ioveU7yrvMRU9LzyvBc1rkQ
         eHJ75UmfWq8K5JZGyta7QuUX6YLtq84LJs4YzlYzRATEBT1FQ3LihNx0HcyM/+IFH+uS
         XuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=PPl4mpHHpnRstvj9PRcbnaluXmvv7htKw/1jIOn3Ff4=;
        b=30UPY4H8RYJuDXcKFLB+ViW9XYCBTjVEcC8O4ZpqaEHgk62bE0anYleOOtrAbmShqj
         2nFUHLQ0sDJPVvxxTSzI4wuOCn9u6Ri7nUA2Ubt02mQwKDKmuMCrMl6rkuS/SrypeL9F
         gNBPUl9onrx1amxUiFZqJA2pBMWaC2dHybYCmCWPbm3/ylkdFxYZESfbeeFGcSeJpIkI
         /+ml5PWhVmVCw+24tJuaxUrDRIr3QR95lPh8iyVJEL5cTDfHpSxJwd7tTmsT8R+w0Q0L
         d3VUJjjiDRp45/orbhjN0jvYiWTB7qoZoffBO6ve6KyME6rT/KRds/vxTxaZBwH5tkIt
         49Sw==
X-Gm-Message-State: ACrzQf0Odg7RJ79UryMvqOiu7KPj1LS5cv7F0Xg+B3jy7nmUMrfKqbNl
        g9/Y9fkCIKyzqva0BR7IxbVrYA==
X-Google-Smtp-Source: AMsMyM7cLpvAM7G86NTRFt7n+ogv3pvaor+5hOBpggjJ8POwyvQfXQqCkZgVZLq1iUzj5nW2bYUZvw==
X-Received: by 2002:a05:651c:1787:b0:261:c1ff:4407 with SMTP id bn7-20020a05651c178700b00261c1ff4407mr6325720ljb.257.1663659195867;
        Tue, 20 Sep 2022 00:33:15 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v10-20020a2ea60a000000b0026ad753448fsm122448ljp.85.2022.09.20.00.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 00:33:14 -0700 (PDT)
Message-ID: <79cfab3d-6b86-8876-cde2-59e43610431a@linaro.org>
Date:   Tue, 20 Sep 2022 09:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 1/3] memory: omap-gpmc: allow shared wait pins
Content-Language: en-US
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Cc:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
 <20220916120749.2517727-2-benedikt.niedermayr@siemens.com>
 <5d4d9412-6445-f3a3-0f86-6c41a37dca70@linaro.org>
 <7c13efa554d12324d402690753c27a8c0e803867.camel@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7c13efa554d12324d402690753c27a8c0e803867.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19/09/2022 14:37, Niedermayr, BENEDIKT wrote:
>>
>> And how do you handle shared pin when the original owner unbinds?
> So first of all this code only keeps track of the wait_pin allocation from within the gpmc. If any other driver/code
> allocated this pin than the evaluation gpiochip_request_own_desc() would fail since the pin hasn't been requested by the gpmc itself.
> The testbit() only checks if this pin has been allocated by the gpmc itself. If yes, then the waitpin can be treated as shared wait pin. If no,
> then another driver allocated the pin before and we return an error.
> 
> The gpmc must be able to release the wait_pin in the wait_pin_alloc_mask, that's true. The only section where the waitpin_desc is released 
> can be found further down in this function:
> 
> err_cs:
> 	gpiochip_free_own_desc(waitpin_desc);
> 
> You're right. I must add the relase logic here as well.

You wrote quite a lot but that was not explanation of how do you handle
unbind... Last sentence was enough.

Best regards,
Krzysztof
