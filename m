Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B41AB6D0681
	for <lists+linux-omap@lfdr.de>; Thu, 30 Mar 2023 15:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbjC3NZJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Mar 2023 09:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231768AbjC3NZI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Mar 2023 09:25:08 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C30C3AB4
        for <linux-omap@vger.kernel.org>; Thu, 30 Mar 2023 06:25:06 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id h11so17529364lfu.8
        for <linux-omap@vger.kernel.org>; Thu, 30 Mar 2023 06:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680182704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vamf5kTgDNdKzz6HGmlLA86d1f7m0MPf22N0o5NBHqs=;
        b=LWYaAJaesg12CROJSeu6SmIsd9Cnwt0dZNfgRuW1JVqY2vKVh8maubz6Ivx4wQHw3G
         VvYBFilk4kvb3BcSiCEN30NlWtIqTNM3qyKuvSGtXXUZl9OPge0hZGl8FmTu64Nk+kAB
         ZfavTpRXjWNIOfPpRhO7njG5i5Mhf1qi34ZOlN4otq0G8lgKKsoZfeW/lvM3w9kUim8g
         Ds/MNSsAggtoYqa0JUcEEMLU/bbcHpipFxGHmiWcTHlF7wwnKKzFhgb+g5/MqZP++7LC
         DyV+HAEXgy2OBJUVuUjNbigaGgLz1G33rLP2kW6i1k40ZmC48+k3Z0piuKN9EoOHXoES
         /Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680182704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vamf5kTgDNdKzz6HGmlLA86d1f7m0MPf22N0o5NBHqs=;
        b=jpfm9/zJMqMbj0WUcERSvvIFgoEhKi3CEebNWq1vH77KtXx7XQB1IVdNhZ2hwANmwv
         iHfRCZMGKfpt8w76kCcUGJ/Li6XTRkFiUy96EzVTNxJxaKr4Wneif8AsMQqi63crLxJt
         kcD5IcyLF7vFd3ry9p8fOU2Qv/GE8Ef5EMLdYFi5M0IQ41mG5tK5btWD+iDxIH5J3N7Q
         fiasAR+scDzZu2hKRGjnQAPTIyc4SICu56v+GCh25j0wDJE3byimgevOpRWjCN99ZsoP
         HtXnTt7crRLnhE2KThpOuLllQyGrw7F2gGjzUUeydU73oxAeTu+zUIj95rcdNQzLIGWc
         teow==
X-Gm-Message-State: AAQBX9cQr5hdwNsf8Bwttkgr32FpvyvRPnqRCMbsfGJLL/k8ulA1kyZt
        xyFvYILE95Y0qn+7QwMQU4WiCA==
X-Google-Smtp-Source: AKy350ZstmrnX5OvLzEs6qY0FGeShHuv1Ab5LCXqzRLhINJc2/KswIw/SZ+2X9brHeo8yaG+TtzeFw==
X-Received: by 2002:a19:f60e:0:b0:4e2:337d:65d3 with SMTP id x14-20020a19f60e000000b004e2337d65d3mr7237141lfe.40.1680182704648;
        Thu, 30 Mar 2023 06:25:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b25-20020ac24119000000b004db266f3978sm5878875lfi.174.2023.03.30.06.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 06:25:04 -0700 (PDT)
Message-ID: <2a83a097-fa76-b93b-bd95-09c815b0f5f8@linaro.org>
Date:   Thu, 30 Mar 2023 15:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] dt-bindings: omap: Convert omap.txt to yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Andrew Davis <afd@ti.com>
References: <20230329222246.3292766-1-andreas@kemnade.info>
 <20230330113918.GS7501@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330113918.GS7501@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/03/2023 13:39, Tony Lindgren wrote:
> * Andreas Kemnade <andreas@kemnade.info> [230329 22:22]:
>> From: Andrew Davis <afd@ti.com>
>>
>> Convert omap.txt to yaml.
>>  Documentation/devicetree/bindings/arm/ti.yaml | 157 ++++++++++++++++++
>>  1 file changed, 157 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/ti.yaml
> 
> Great, can we also drop the old txt file or is more changes needed before
> we can do that?

Yeah, conversion is always a move (remove + add). Half of the process is
missing here.

Best regards,
Krzysztof

