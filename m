Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 400647867B3
	for <lists+linux-omap@lfdr.de>; Thu, 24 Aug 2023 08:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239841AbjHXGqL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Aug 2023 02:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240235AbjHXGpc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Aug 2023 02:45:32 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED81710FA
        for <linux-omap@vger.kernel.org>; Wed, 23 Aug 2023 23:45:25 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99c4923195dso830003066b.2
        for <linux-omap@vger.kernel.org>; Wed, 23 Aug 2023 23:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692859524; x=1693464324;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rnNGmf2WWBgfkQAyVC3feikVFhEUoK2YZ6y9s10fp+g=;
        b=ZoaOILWVeHmGVSqeM8U7E3ZXekN3WMc75pFN7wcLlHYTcopJoS9k+ERfYsEddO37UB
         lNwbBVOiwhYBlZZvGk62x2SiK5hoGOOoeze07ubjx+kvO64UaP3LFy2ss+tZax/2Ej5O
         Oqq2PQdY8LWmJVZUYc+mv7ezbTJwUHQkwPQg99g0CX+sixtpDTYDzENZUjSGBLqXN/2N
         bjr0DnPTi8kGxZCKDc1O7UgFkUrPPH8ArytEFZeeUVn4M7y2ehTZQTfSicgotjrWaNuR
         /F4ww+S+CPEElNzVsrbZuhdaxIsDPbXU3zZxRxo2hbXmXdJJzlzoes34XKmgGE/m6C6c
         uiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692859524; x=1693464324;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnNGmf2WWBgfkQAyVC3feikVFhEUoK2YZ6y9s10fp+g=;
        b=HM1SwKsMJLniu6kd+iieOx9PpNfO2aWC4CoxzJI2AKze6w0ag/qxqqdA8OoTVbIGxh
         8ncmiExVEqjMlywxbHRk8iaqj9A98H2rrvUYnkvryaTJ9baBo7zFMuH75ETP+l8OmbSl
         aj1k3xoXieGXaXQiq0dWmsD9Bx3UPIOqykgcGbDSmvfkgELOYqgVXlcdYyeSE8bIwzBb
         tBmIFxY5MJZDDi72if+nKUfhfS4X2hd5pM5bt7Bf8J6EdTD7HEZiSYCuGs1BgtN1CRKK
         csYc0TjsuSmClbv8IENNdOF9oG52zPwfB8i3yz0G3RLqbALO5v0ctax5x9PSMo7XnOKu
         PfgA==
X-Gm-Message-State: AOJu0YzTO5G2sc4EMYqtVbsEIcWMA8HZtqsGAr2Kp8xcFSiSAyjpPxBk
        gY32EKCn/Cg4GLtr/LgF60wj6g==
X-Google-Smtp-Source: AGHT+IGy78witumN00EVCy5UGo3smU/gaSGULiiCcVwhomJv/wCO+KpTMU2P5OmjNabYfnDdCjVcfw==
X-Received: by 2002:a17:906:249:b0:9a1:cbe4:d033 with SMTP id 9-20020a170906024900b009a1cbe4d033mr3788327ejl.53.1692859524373;
        Wed, 23 Aug 2023 23:45:24 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709060c4700b00988c0c175c6sm10571133ejf.189.2023.08.23.23.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 23:45:24 -0700 (PDT)
Message-ID: <1326776f-2592-f231-2056-a231729da50a@linaro.org>
Date:   Thu, 24 Aug 2023 08:45:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 2/5] dt-bindings: net: Add IEP property in ICSSG
Content-Language: en-US
To:     MD Danish Anwar <danishanwar@ti.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Roger Quadros <rogerq@kernel.org>,
        Simon Horman <simon.horman@corigine.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Richard Cochran <richardcochran@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>
Cc:     nm@ti.com, srk@ti.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230823113254.292603-1-danishanwar@ti.com>
 <20230823113254.292603-3-danishanwar@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230823113254.292603-3-danishanwar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 23/08/2023 13:32, MD Danish Anwar wrote:
> Add IEP property in ICSSG hardware DT binding document.
> ICSSG uses IEP (Industrial Ethernet Peripheral) to support timestamping
> of ethernet packets, PTP and PPS.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Where? Please provide link.

> Reviewed-by: Roger Quadros <rogerq@kernel.org>

Where? Please provide link.

> Reviewed-by: Simon Horman <horms@kernel.org>

Where? Please provide link.

Otherwise all of them look like fake ways to sneak patches into the
kernel. Our work here depends a lot on the trust. Trust once lost, is
tricky to get back.

> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---


Best regards,
Krzysztof

