Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06B915BCADB
	for <lists+linux-omap@lfdr.de>; Mon, 19 Sep 2022 13:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiISLfr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Sep 2022 07:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiISLfq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Sep 2022 07:35:46 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FFDE2612E
        for <linux-omap@vger.kernel.org>; Mon, 19 Sep 2022 04:35:45 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u18so46420016lfo.8
        for <linux-omap@vger.kernel.org>; Mon, 19 Sep 2022 04:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=OFpiuFltYOyUQ93PvaIGVPkD8wS9IN/h7Vh/MgrsN8k=;
        b=PlE9o4cpnKwFh2eZ7Jvxld25HayF5uqbKUXal+8mkDfH0OXAwEAneqK0hZStW3dYwx
         znProc4iWIR7/LIAlSO5NxliiVZ1G5OSMANxKJzeqXHfLUvEbxjovhPuCCIKDrn3iAVU
         bZ1TxpxSlM0lbY/lfM/WgCz4urPpwfUeLDBmO3GyWIxUgidC2mACO86KWegs1c+zhVIe
         7Dq81T1NuLmV0ME1spnCTVT/g+CKIC8LbCFwoAZa3b4/CTdKsaqYZIrBtL6EDN8tWQZR
         5EV9KeTyW90zEtj4kcuxXJr8a8IvmW8egeh6TkG4zldVTLnlEvSp9GJupsXXGKtMX3cF
         g+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OFpiuFltYOyUQ93PvaIGVPkD8wS9IN/h7Vh/MgrsN8k=;
        b=Ye8IeNfnMLP5xHvZdu2hPtIlIyLUsXBd+x+nvPSKx15VdzlDVMz9W2BxnZGaaf0rFt
         jE05OAob/BCB8iE4FWucMwwi1JkLgcgg2oHM78PCHoNoHsDsZXNqUiX17MG3TOLImv0N
         mQkaw9Pno02JoHNUEj2/DSAEkdocPJ0owRFoKm6YkW8xYR1AyOE9rRgt8xZCmeTW04sF
         DdG8eGlotb1cv42r/To/WHrY3RJBBDcB0SRP8qeuL7stWr8cfowwEItmucdKlq7NPLT1
         khc7vjDF1MJdihRi3CAsAT2j19f4ver5RDwNEI4pgJhF2a1b5mW5OOLFzggPzWTux+gF
         sfzw==
X-Gm-Message-State: ACrzQf3zwcPip08BtX0v5KhfeE9srsesU5WS1Vn3qrd+OfBdNNc2Cu3r
        UZDEudC6yJG0dnFgosV9SR5jGQ==
X-Google-Smtp-Source: AMsMyM6roGFM3Lcbk3LihC6OS3+pDE8OZs4+Xcww2RM6Y7MCJ9DsXri4L9EZt2VmJtlRJdtejVZWRg==
X-Received: by 2002:a19:ca5a:0:b0:49f:64f2:c6e5 with SMTP id h26-20020a19ca5a000000b0049f64f2c6e5mr3722847lfj.317.1663587344029;
        Mon, 19 Sep 2022 04:35:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p7-20020a2eb7c7000000b0026c16e9e45bsm984751ljo.17.2022.09.19.04.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 04:35:43 -0700 (PDT)
Message-ID: <aee9384c-b46d-c85b-0ee6-113e6eca8c59@linaro.org>
Date:   Mon, 19 Sep 2022 13:35:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: timer: Add power-domains for TI timer-dm on
 K3
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20220919112357.64997-1-tony@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919112357.64997-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19/09/2022 13:23, Tony Lindgren wrote:
> On K3 SoCs, the power-domains property is needed. On the earlier SoCs,
> the power-domains property is handled by the interconnect target module
> parent device.

Rebase your patch on recent Linux kernel and use get_maintainers.pl.

> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
