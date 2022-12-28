Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0EBA65746F
	for <lists+linux-omap@lfdr.de>; Wed, 28 Dec 2022 10:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbiL1JHT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Dec 2022 04:07:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232535AbiL1JHS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Dec 2022 04:07:18 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A36D10F
        for <linux-omap@vger.kernel.org>; Wed, 28 Dec 2022 01:07:16 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id g13so22792788lfv.7
        for <linux-omap@vger.kernel.org>; Wed, 28 Dec 2022 01:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oh65FXjCWAwyP79+/vrzZvQeGGHMxBBP8jJk770rSK8=;
        b=pXOWDmBhmA6HC5EVCNFeArfhGxQe+kMSdPJp/1XqA9ZWx02rTeEGlv1QzAUeWw54rb
         Pe4UksIILEv78JeARhLL6iR4d/KfK7pVsXveKAzHUXTIzswkWidgBT6T6uwsDMiVYJJR
         cDf6Qd05db5zsG9aNgef3LSRPGj9/kK48ef/b8ZDrELwUQOq0lHbef/JVJol2hMwIR0b
         F/Ay3jqY4fyh806VruaHb+bNO/TwUJCtGa3dr8W982qHfXU6z0K8MSBKh0DE1fxxfALW
         mGY8O8OAIPL5YIopfl0rx5oeOvM0KJpUbWVpnVDCDzHfzpYqYr8RDxFOayrAF03vRRA2
         VbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oh65FXjCWAwyP79+/vrzZvQeGGHMxBBP8jJk770rSK8=;
        b=VbQ8WLzL0Z1jdJQkLfhBuqJco1UqSzHUjExhobNVhrpRIsZxSlZq0tiDNjesgyuuae
         XeZPh3HCCaezgBbYXCewKG7WwIJM5VCw0wohLDJ5mlCJxPetq6uIzkSYT5p+X3RxbGsV
         xmJDscz+VyPP006XNsfLZV0jZ9eBMGm7FKH4nLTQ0AhkGiw7QTue9zxDqV0kUCirOaiv
         nHLTtZ1s/hw6LGknWp+Q91j7Hcr85ZyQoWwJ3xcMdRMG+NZJibNpi21z4Xz8Tc2IeVuy
         SghyAF3GFzYhNi7UGy50QQejEuQmo2AlslpRy86ljIwEK6E6F/rblx/0v8IzSwPvOtSo
         p9Tg==
X-Gm-Message-State: AFqh2koYrCl6cGwiWXtLxcNRePbfvuzjDf7SzQJNJk8OirTUKLZcaVA2
        t/rH0FDRFjrl05zBNJt/HDW6ow==
X-Google-Smtp-Source: AMrXdXvjAOViEM8pna0LEosao806X0PY7+H/x6mLffTcWoSQnbPPML/6Cl+0YwP8cb3h4eWFo07euQ==
X-Received: by 2002:a05:6512:25a2:b0:4bc:a66e:9aa7 with SMTP id bf34-20020a05651225a200b004bca66e9aa7mr6623846lfb.6.1672218435095;
        Wed, 28 Dec 2022 01:07:15 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v14-20020a056512348e00b00497a61453a9sm2578871lfr.243.2022.12.28.01.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 01:07:14 -0800 (PST)
Message-ID: <c4046ed8-f84c-f1d7-2687-7e5c00b1304b@linaro.org>
Date:   Wed, 28 Dec 2022 10:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: ARM: dts: n900: switch accelerometer to iio driver
To:     "Sicelo A. Mhlongo" <absicsz@gmail.com>, linux-omap@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tony@atomide.com,
        devicetree@vger.kernel.org
References: <20221227223841.2990847-1-absicsz@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221227223841.2990847-1-absicsz@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/12/2022 23:38, Sicelo A. Mhlongo wrote:
> [PATCH] ARM: dts: n900: switch accelerometer to iio driver

That's not correct placement of title. This should be in the subject.

> 
> The lis302dl accelerometer is now supported by an iio driver, so the N900 can
> work with modern iio-based userspace. This patch provides the required dts
> changes for the switch

You miss the actual patch here...

Best regards,
Krzysztof

