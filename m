Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 818E86FDB6B
	for <lists+linux-omap@lfdr.de>; Wed, 10 May 2023 12:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236493AbjEJKNj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 May 2023 06:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236501AbjEJKNg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 May 2023 06:13:36 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C6E2716
        for <linux-omap@vger.kernel.org>; Wed, 10 May 2023 03:13:33 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50bc3a2d333so10695390a12.0
        for <linux-omap@vger.kernel.org>; Wed, 10 May 2023 03:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683713612; x=1686305612;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6jZ+fHuPcf77ZWkOMYSzhjzZYE9ejceZbqeH9Ij4wTc=;
        b=LpdjGUNDVbH61Ed+LBr4UqA+BqyNaV0+axTYqmHGhhk74H7vX8iAN1BZ6AlhAj00eJ
         TElIhZ804g8HLaTa8Q1GJfpcBF3JsGynh1cmg1uXLEXdwKd4TAoiJcZ7tySpv3t8KmlR
         sneAVHKfQSnuF4awNpdgQSCCC6trJ7IbYxcmr0M7i0wP4fggAqOLcc+lvG25rDzzy06j
         CmmsIO9S/mCf6SOYtQUBTAkDNWvVC7L8IR9yfqR4yjFSDn4hEEUnxZVCrxus1ysWRQHl
         hnXPc6as5TwiTfqHED8CQ6ithB4RUhnx830EKiL++lrSpF6glNsN6mOfhw33z1VJtxb9
         7bSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683713612; x=1686305612;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6jZ+fHuPcf77ZWkOMYSzhjzZYE9ejceZbqeH9Ij4wTc=;
        b=cse4lfH4Bv5dt6dpNv0uzDpuJiwZjM45JRtZGARt4KLs5oV1+qAsXirK9WBpxC3kfW
         TPHeFAacYKnGoMbzlrJqOeYvYpdjvEr0ld+YK8GBJgQaVIhIodm7Cwu9oJ1MhgnHZKxa
         B5kSCL60zQ7r0jnNpRVvMvG30rCvUcTokb07VHqtSJbXoXMDnIjieNHl9ElNmEd8PK35
         y7I59hL1rC06HXZWbVOQaDpMekyWSU7XFXXWiym7r8MBthuJbdjIXez7qTcQapcdttEt
         1zdRZeY3pONymhJxuYDUq6o/3qGm91+y7YVA4QcBVHrEHARoAEkBdsrUkwgIsg11lci7
         Og/w==
X-Gm-Message-State: AC+VfDxkiPUK4h8INkJALM74dbin8fOu0xIL9wVIzkGBoEueSRVnwjrL
        j6Ez1JV25rmrYJrAyERbK7mp2g==
X-Google-Smtp-Source: ACHHUZ4q36n8/c/iMTwvJa7Zu8+iDl2FNbh+EC9Sw31ARBn7eWaYWTYF5K113S9ikylsRIcDXtVdIQ==
X-Received: by 2002:a17:906:478a:b0:969:b88c:b8a2 with SMTP id cw10-20020a170906478a00b00969b88cb8a2mr6921774ejc.10.1683713612238;
        Wed, 10 May 2023 03:13:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id e17-20020a170906845100b0095844605bb8sm2525661ejy.10.2023.05.10.03.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 03:13:31 -0700 (PDT)
Message-ID: <d0368328-b2af-e4b8-4374-c9fcb9c376c0@linaro.org>
Date:   Wed, 10 May 2023 12:13:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: Allow use of pinconf in
 addition to pinctrl and pinmux
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20230510095330.30742-1-tony@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510095330.30742-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/05/2023 11:53, Tony Lindgren wrote:
> Some controllers can be just pinconf controllers and we have dts
> files using pinconf for the node name already.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
> @@ -27,7 +27,7 @@ description: |
>  
>  properties:
>    $nodename:
> -    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+)?$"
> +    pattern: "^(pinctrl|pinmux|pinconf)(@[0-9a-f]+)?$"

pinconf appears in three cases. Better just fix DTS.

Best regards,
Krzysztof

