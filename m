Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 702734FDC28
	for <lists+linux-omap@lfdr.de>; Tue, 12 Apr 2022 13:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbiDLKPI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Apr 2022 06:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378718AbiDLKKm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Apr 2022 06:10:42 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896E274DF5
        for <linux-omap@vger.kernel.org>; Tue, 12 Apr 2022 02:13:28 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id k23so36011690ejd.3
        for <linux-omap@vger.kernel.org>; Tue, 12 Apr 2022 02:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yK5rZUlo+Qu8Vr63ASF6q86sB6zW5JP7vsuzhJR3eVc=;
        b=lmXZTs2K+2tRa0UmcbAasTeAdeVgzVziPiPYGvS35+jrA9uKZqrpyb/0OysglfY5YM
         AUMdikNz5Z6WS2mBjo7JU3GfuMhfv2bVGqB1jvy7VrnRJJuhJbbrzn4XnD10Ws0zvgNT
         sFLOczyzE4dygl0Y/ePK4EC2ln2xQUdH6eO2g9WTlkd21ha6gBXZxxAmGyZ4LIQCv8Mo
         WW8RehH0Cl3Rp0mVQnIa5JM0JBhzpvY1iJ8DvKneaBAbTeA6CBFz0yrLO0Q4xUaxKe6u
         /iqAB/+Czfk53dKlz6tLTpgA8jmU2aUvaenhZwMVOEwu32iRPmp1nv2vC1MkNWjDNP5h
         e+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yK5rZUlo+Qu8Vr63ASF6q86sB6zW5JP7vsuzhJR3eVc=;
        b=Vaj2JW2OmZjLVK324glYrL9LqWIgjraRm+LeFCt0z+nh2Ef2HRthmptjKjopUUKXVf
         Bu2xGOMET6oNgVBcWxdZcEnur69JNcn/oYaO2avRlMpN+boj6dkvqudtalzky62hj/yR
         2c8hbpxjCIu8heRrLW8VSliFdVPUsFzKykc37fJ69cbY4m0igGeTyE82xCilcRb51oO1
         glSqtmSrxTHugL3X+beCuyEMppt6aH0O9I2UTjNzLmfeIdnndp3jsb4WS5UcdW962dvg
         HC76JZuVkB4C8Ac9nnwh/K/29UMo2kFl6/ziSlqtb7LGXrEuDqrCOBRRlrQojmrOkxmn
         VCTg==
X-Gm-Message-State: AOAM531HhFeJ3OrIPlAx6pmbLqEF0n1OxBxzLUaWTMQ34wtT4hJnhnxG
        f6TSRhtW2fBNj0TbnfJmS8vsog==
X-Google-Smtp-Source: ABdhPJwbAn/DzuNdxkK9Dvoo1O3GoNpPlVlm1epOQ2omSmaM860v4djbBOuBqktXPaEFq92jQkLxGg==
X-Received: by 2002:a17:906:7944:b0:6da:b834:2f3e with SMTP id l4-20020a170906794400b006dab8342f3emr34509730ejo.353.1649754807099;
        Tue, 12 Apr 2022 02:13:27 -0700 (PDT)
Received: from [192.168.0.194] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id o22-20020a170906289600b006e44a0c1105sm13020603ejd.46.2022.04.12.02.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 02:13:26 -0700 (PDT)
Message-ID: <10b08e08-1daa-23c4-8648-d19f0fb3c46e@linaro.org>
Date:   Tue, 12 Apr 2022 11:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: timer: Update TI timer to yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20220411111858.16814-1-tony@atomide.com>
 <3f3ec103-a7d8-b56d-afff-94a0379dffec@linaro.org>
 <YlVCEIPFQjFs+kwM@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YlVCEIPFQjFs+kwM@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/04/2022 11:10, Tony Lindgren wrote:
>> Apart from what Grygorii said, it would be useful if you add "if:then:"
>> case constraining it per implementation (as I understood from commit msg
>> only some use double mapping).
>>
>> This looks like:
>> https://elixir.bootlin.com/linux/v5.18-rc2/source/Documentation/devicetree/bindings/clock/samsung,exynos7885-clock.yaml#L53
> 
> Yes I tried, but see the above. The compatible property is the same for
> single mapped and dual mapped timers on the same SoC for omap4/5.

But all on others this is single mapped? Then at least reduce them to
one item inside allOf:if:then. The omap4/5 will accept both - one and
two items.

Best regards,
Krzysztof
