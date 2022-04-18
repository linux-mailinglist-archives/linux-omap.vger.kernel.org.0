Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13514504F3A
	for <lists+linux-omap@lfdr.de>; Mon, 18 Apr 2022 13:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbiDRLHJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Apr 2022 07:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbiDRLHI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Apr 2022 07:07:08 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE5741A061
        for <linux-omap@vger.kernel.org>; Mon, 18 Apr 2022 04:04:29 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id r13so26243602ejd.5
        for <linux-omap@vger.kernel.org>; Mon, 18 Apr 2022 04:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6U9l77FD33XoUxlN4C0IowgyHbs01XD4FahB9dQjefs=;
        b=NShyOkE824I21KiCOZkQ+WGa6uc9uVI/EIRHGtVSTtEjc0Rv4/rW/9Eph3QsS2yRSN
         IxbMM3DBA9iMNxEDaUylJjN6+4P3nNE0tmA+FvuXSBHa5t3d/Hvi8sHjs2PBd/MYbnTd
         Pr1TrthcpxsGYqY8BX3M98xN7I+uHaNIe57Ae8zu4dExc9NO+PBqpHdwpkDEGP8+K8kt
         N22l93EEPm9fcyqflvrUljAhYhf5ZfMNSuSzTyn4q0Y+yegJVAp/YSlqW4U3rtsuj8S5
         8/bPAhQiAiESSZ5WtyWgJdypgQGaIX0v/crn4eMbu3euqlof+7keGUBAcBq7rftgiPdb
         6DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6U9l77FD33XoUxlN4C0IowgyHbs01XD4FahB9dQjefs=;
        b=I1YZMrGQRItvHRBK5toxh9l5OXQ/5wOSlz0r3T1oydIqP+BNEV70hbLmzD03RWhH60
         lY1ka7xYSMcW89iswLKJd/R+2aVHCFMiXXZ3BzayRnx4BIwI68K3X/razNyt0rykE8aj
         BjGIMzivP90HIDboC69kYKgkARdrOiMFaixWxYbHJCynp2gQXNIJO0boSUJQ5WZrPhKW
         CklIty93fGfzpoq6n+Q9vv3HJFl2aIGBLpuhLwPNdQCGvdjOL5BpCO3gavG8QzOFzu3u
         3BPJwmZG3a715NkXgGcPlcbNM29LeULIj/1d9mxb5otR9MW4MI3rGMo4X43Tg2d3HxGA
         RrBQ==
X-Gm-Message-State: AOAM532zfZvMpOUqwP0sTOUzXCDRCDWgTqg9jlojedOKK5dRGwGB0vOE
        GgjQYWxqEzc8dlSn7HMTbNYmYg==
X-Google-Smtp-Source: ABdhPJxQp369tmI5wz7ZkbMi5huMsFAnrQPw01ST5ZsVv7AcoYpJMxb6xWt+YNdUPpZpiv/nu9RJMQ==
X-Received: by 2002:a17:906:1ec3:b0:6cf:d118:59e2 with SMTP id m3-20020a1709061ec300b006cfd11859e2mr8698405ejj.767.1650279868386;
        Mon, 18 Apr 2022 04:04:28 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ch4-20020a170906c2c400b006efcc061c1fsm293563ejb.178.2022.04.18.04.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 04:04:27 -0700 (PDT)
Message-ID: <ebb51ba4-a199-96ee-6a88-6b917bc9c9d5@linaro.org>
Date:   Mon, 18 Apr 2022 13:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 1/2] dt-bindings: timer: Update TI timer to yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20220414085807.7389-1-tony@atomide.com>
 <20220414085807.7389-2-tony@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220414085807.7389-2-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 14/04/2022 10:58, Tony Lindgren wrote:
> Let's update the TI timer binding to use yaml. As this binding is specific
> to the TI dual-mode timers also known as dm-timers, let's use file name
> ti,timer-dm.yaml to avoid confusion with other timers.
> 
> We add checks for the deprecated ti,hwmods property as done for other TI
> device driver bindings earlier.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
