Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 366E2637813
	for <lists+linux-omap@lfdr.de>; Thu, 24 Nov 2022 12:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbiKXLxh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Nov 2022 06:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbiKXLxh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Nov 2022 06:53:37 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77D39DB92
        for <linux-omap@vger.kernel.org>; Thu, 24 Nov 2022 03:53:35 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id be13so2207310lfb.4
        for <linux-omap@vger.kernel.org>; Thu, 24 Nov 2022 03:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPVcl2Eug+5uraZ8m6qhcz30LIzsGZsRRGgxjK4JKkQ=;
        b=UZ3xC41EWV1GfOOrF46u4ZqOAdpreJnnihRyvCq8lvAqy3OFuTuVlphajy3OQrkiKM
         yiWfG2OuD6zm9ZjFA07vazCpZaK5NpnZMDEYzyytqdYG5SEypvLiFctsgb1jewHKxlp4
         YBGw8p3QrzUwOiWsTJPdkx47dyRQ+La9dGB4Gij9g8jMcqbKRhL+3QIJ2wIcF90IVycf
         XyD7EMcpP59Ka5k5ZW0TnO55nPFiLNrVh3hgiQQRXVZVo014j/QLabcpfSXD+gv20FWl
         IieUtv7CjjftVyWTQJdejuAWiJkPoX7nLzKVfs28Ku6yEsYhC3EafaqNPoyYGc5WSXNo
         ZNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QPVcl2Eug+5uraZ8m6qhcz30LIzsGZsRRGgxjK4JKkQ=;
        b=AV8kCnNOL2l3vS2TEgt8cul6wSBeiQnwGl5S1X/2WcZUS2q792senngb7Gvmy6RM9m
         QQqwJneATkckVIDLpU+YbjLYOLNnXXOY8LwnQG6tzNwDy3WyKSO8kH6lGCV7DvgmGUJR
         Yl4XH93C/SPXfSFEXZ5GGc/yYKfMitz50YucffXe6JlcWlaR/lmxZcUDPgOFdF0Aw1y7
         vFQzCylCPBIcETqHudLwb9LpQAKguIcLhpqtBP3xLKUNiqjB4W8gUBCURaDJHT5rjx5y
         5ugJ6eSZOTFB80PKNsYEysDfSdzWtO70RgXSJAFnju111zt31MRrTQplL4tdAyrYVz2/
         RALA==
X-Gm-Message-State: ANoB5pmqdW0uk6vUU+d8DaCmHfyZJHdv636ModfpS1sbtBeSddXcWnCC
        T2vqITbNBUR3/dikG34rOBvIAA==
X-Google-Smtp-Source: AA0mqf7BswiRU15d2KnipL8ZZJdBMrUwqe10ADV8X/LEEDqryOG+RLgGnMJu4AYr+KJcmL9hOBAkTQ==
X-Received: by 2002:a19:6b0b:0:b0:4a2:44dc:b70c with SMTP id d11-20020a196b0b000000b004a244dcb70cmr9943677lfa.360.1669290814310;
        Thu, 24 Nov 2022 03:53:34 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id be34-20020a056512252200b004978e51b691sm97186lfb.266.2022.11.24.03.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 03:53:33 -0800 (PST)
Message-ID: <0a3b491c-7b91-4732-e280-3e49d9da01c6@linaro.org>
Date:   Thu, 24 Nov 2022 12:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: omap: add phytec pcm-049 som and
 pcm-959 dev board
Content-Language: en-US
To:     Colin Foster <colin.foster@in-advantage.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        soc@kernel.org, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20221123233209.1854806-1-colin.foster@in-advantage.com>
 <20221123233209.1854806-2-colin.foster@in-advantage.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123233209.1854806-2-colin.foster@in-advantage.com>
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

On 24/11/2022 00:32, Colin Foster wrote:
> Add documentation for additional OMAP SOMs and development platforms,
> provided by Phytec as the PCM-049 SOM and the PCM-959 development kit.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
> 
> v1->v2


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Would be nice to convert the file to DT Schema.

Best regards,
Krzysztof

