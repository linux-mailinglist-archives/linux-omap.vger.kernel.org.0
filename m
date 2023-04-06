Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79F616D91C3
	for <lists+linux-omap@lfdr.de>; Thu,  6 Apr 2023 10:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbjDFIgl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 6 Apr 2023 04:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjDFIgk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 6 Apr 2023 04:36:40 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE267A1
        for <linux-omap@vger.kernel.org>; Thu,  6 Apr 2023 01:36:38 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id y4so147532716edo.2
        for <linux-omap@vger.kernel.org>; Thu, 06 Apr 2023 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680770197;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vtF8Lv6Q0CwOFk9dcjRC1QHDijm+JO8RtHr3ocFrp/U=;
        b=mUdLRtCjv0gZVJwa4cOuipMDKrvHL/wwz0bIh3yPXf7bcLnmjjqHTnioSrrKmGl9t7
         tcMPTqOCRSC88mSilMkdUhudKKZ+ol/VDCtpYC+7H8qZfgXciyxYPYJIhf7cfNqpCq4T
         VOFksLUsqDL6G53APniuIZivzV5PH9tbuRi5bj76U4wh4XS+2KfOW1r82NMc03VTF27e
         LJ8xBZVfnIt5sfNN0RL3uj0JQcwTsQwqxBsBJcfeT75updTNE8WxRUmCxUjaLYN7czgU
         YQVylxL+j58hEcp9mMOW5y7TaHMkF8wqobyKhEODWWShJ+ssHJd3JIboMu5E7bSRxb+N
         mZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680770197;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtF8Lv6Q0CwOFk9dcjRC1QHDijm+JO8RtHr3ocFrp/U=;
        b=C4AkvT+ceBs01+xzA4xXKwfxjPb6eqRVYm0BIr4SUekUrOabvKtv54aYUuEHBcCJZh
         SR8LoqFF2CetISTgNDeWki49cqF/h/wcKrnmm0ucPAbFG4NuKQIZhh0Ehn2jkn6WWcSE
         XaOP6cboFHrisN6jVIh/qdZj/L18U6iCGhpu21uPHk6yQ3geoI9byWAgT437KPT+ak50
         IsBkozSku1Cd1JAZThw58u1K03O5xgh1vLyCcqnik4XZF2cup8oj0HxQjTKysCH5/plQ
         O8ZJ5gNLpLxUUwyoCNLzpvX5hmaOWNXBeZxf+wk9BNXUhrY1+5l/eh3GlQ+amRysdt2K
         E3xQ==
X-Gm-Message-State: AAQBX9cqGw4RPoQV70rga9VJCDttKltF0TXGOPjEGtCxnXtBfeB59FXr
        ZPL4Uv7spHiG+x0ogCWf9Rf9Mw==
X-Google-Smtp-Source: AKy350Z7FUD7SIAZiIBu/jYSv5BCmTGOkJAJXaqtoFGEx2S3zZ58gQPrBwj/w5BDccY0fSJ27UuSlw==
X-Received: by 2002:a17:907:7e95:b0:932:f88c:c2ff with SMTP id qb21-20020a1709077e9500b00932f88cc2ffmr6169731ejc.34.1680770197499;
        Thu, 06 Apr 2023 01:36:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id qm8-20020a170907674800b00947ed087a2csm497516ejc.154.2023.04.06.01.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 01:36:37 -0700 (PDT)
Message-ID: <7f43953c-d326-f517-d896-cbb060d8092a@linaro.org>
Date:   Thu, 6 Apr 2023 10:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 1/2] dt-bindings: omap: Convert omap.txt to yaml
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tony@atomide.com, afd@ti.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
References: <20230405161908.4312-1-andreas@kemnade.info>
 <20230405161908.4312-2-andreas@kemnade.info>
 <eb4cf82d-f523-d5af-be18-25c37678a95a@linaro.org>
In-Reply-To: <eb4cf82d-f523-d5af-be18-25c37678a95a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 06/04/2023 10:32, Krzysztof Kozlowski wrote:
> On 05/04/2023 18:19, Andreas Kemnade wrote:
>> From: Andrew Davis <afd@ti.com>
>>
>> Convert omap.txt to yaml.
>>
> 
> 
>> +      - description: TI AM43 SoC based platforms
>> +        items:
>> +          - enum:
>> +              - compulab,am437x-cm-t43
>> +              - ti,am437x-gp-evm
>> +              - ti,am437x-idk-evm
>> +              - ti,am437x-sk-evm
>> +          - pattern: '^ti,am4372[26789]$'
>> +          - const: ti,am43
>> +
>> +      - description: TI AM57 SoC based platforms
>> +        items:
>> +          - enum:
>> +              - beagle,am5729-beagleboneai
>> +              - compulab,cl-som-am57x
>> +              - ti,am5718-idk
>> +              - ti,am5728-idk
>> +              - ti,am5748-idk
>> +          - pattern: '^ti,am57[0124][689]$'
> 
> I don't think my comments were resolved. I asked if it is possible to
> make a board called "ti,am5718-idk" with "ti,am5749" or with "ti,am5708"?

Hm, I cannot find my concern, so maybe it never left my outbox. Anyway,
it looks like you allow here many incorrect patterns and combinations.

> 
> What's more, you dropped several variations and compatibles against
> original binding (all the "dra") and it is not explained in commit msg
> at all.

All changes against original bindings should be explained.

Best regards,
Krzysztof

