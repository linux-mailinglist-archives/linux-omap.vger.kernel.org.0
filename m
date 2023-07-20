Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A87CA75B11C
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jul 2023 16:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbjGTOVg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Jul 2023 10:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbjGTOVe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Jul 2023 10:21:34 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1169F2135
        for <linux-omap@vger.kernel.org>; Thu, 20 Jul 2023 07:21:33 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b6f943383eso12412311fa.2
        for <linux-omap@vger.kernel.org>; Thu, 20 Jul 2023 07:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689862891; x=1690467691;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5bM5fwQZuavzr0KLXlSpBqYe6ZYyOnK6tAtOA/McGh0=;
        b=spUGuRcegEQPc3fc25t8itt8SEf8ygAVohrhUn1ujEk4I9NT0xUvIMs1yqyuWqxNFr
         fBngMP/QWUKoSJ4W5c8y5CIpFFLT2NdGs7KcRmUv/FP+F2rq6dMQaol9zCqPj/y+WTED
         2PSRgpO+AuKpqQjbbAcTkKACjlLeF1nbuCreWEGmYWXHj2dY5nBdA3c0ybQNAqoK1TUq
         kekBLt7Ich29WT7xHej4Hzg7GCemUc/EmRGwPy7fQEuunSvGNdqxqNwLHTK/PQwA40Dp
         BwJdBbnoarNMLasaotpymgCSCXe725rnTO/e+1odjR+bU2WyYT4CLBrdqgOxxsPSCDk1
         B2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689862891; x=1690467691;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5bM5fwQZuavzr0KLXlSpBqYe6ZYyOnK6tAtOA/McGh0=;
        b=IJ83uVnF0UE7wjnFJEOUEBpX9fqwV2gQNk8HYGiPC321y6+kj5AKg/XzKJv2G1e/41
         nDKEG/Xa4XbXym+TYefvrsVV770ql/G4v2vNOuzzaWnyk4LY5lasLx2ZnJv31njhXMG2
         Ds2qPoPcqC80CElcrlamnvx+rXamVtEX8Q6cgEvfshfm+F7FW5xh9LsZvsEwdWj5I0Rk
         e75Bqq7/R3ZEKHEDUpVJ4pTcKnnnvkhhJ/AEB9rViV2BKEaEn1ILXmjv4skBeIfF5F5o
         T8FWs7mjfK7EcerBk59c1nXBlJgCvXK4IH+jzD4q5oxysm3nOiCiYSah7ecky4FW7tPl
         4urQ==
X-Gm-Message-State: ABy/qLZaWRbvGqxKAEOtFc3d7Vl+HXd+ZsKQla81Kc6D0zPUqKqdwGsB
        E09y7cG6Tc9zgyYiqJ/PqCjqmw==
X-Google-Smtp-Source: APBJJlFpdXWglTYxIM2Ehzj8JoGpf26cOv1zlpe0BemO3ScIjse7kYRRtbcG/801j62owMtgpgABCA==
X-Received: by 2002:a2e:3310:0:b0:2b6:d137:b5a1 with SMTP id d16-20020a2e3310000000b002b6d137b5a1mr2400228ljc.43.1689862891321;
        Thu, 20 Jul 2023 07:21:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id c10-20020a056000104a00b0031434cebcd8sm1490017wrx.33.2023.07.20.07.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 07:21:30 -0700 (PDT)
Message-ID: <2b5b982d-5a9f-810a-ec3f-df65e6c8b83b@linaro.org>
Date:   Thu, 20 Jul 2023 16:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Replace deprecated extcon-usb-gpio
 id-gpio/vbus-gpio properties
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20230615145838.1526919-1-alexander.stein@ew.tq-group.com>
 <20230615145838.1526919-3-alexander.stein@ew.tq-group.com>
 <8374cb80-749a-401d-2d88-48001ad614c2@linaro.org>
 <2640608.BddDVKsqQX@steina-w>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2640608.BddDVKsqQX@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20/07/2023 15:58, Alexander Stein wrote:
> Hi Krzysztof,
> 
> Am Donnerstag, 20. Juli 2023, 10:07:04 CEST schrieb Krzysztof Kozlowski:
>> On 15/06/2023 16:58, Alexander Stein wrote:
>>> Use id-gpios and vbus-gpios instead.
>>>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
>>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek
>>> ---
>>> Changes in v2:
>>> * Added Heiko's A-b for rockchip
>>> * Added Matthias' R-b for mediatek
>>
>> Please split patches per subsystem, so this could be applied. Or send it
>> through soc tree, but you chosen the middle way - neither per subsystem
>> nor via soc tree - so it went nowhere :(
> 
> How do you distinguish that? 

You create multiple patches per each DTS subdirectory. Then you send
entire patchset to all people (might create too many Cc addresses) or
patch-per-maintainers.

> Almost all maintainers and mailing lists from 

Yes, and they can only Ack it. If you wanted it to go via SoC, you
should have Cc Soc. Since you didn't then it was not the intention, so
only the first option is left - split per subsystem.

> get_maintainer.pl output for patch 1 are also included in the list for patch 2 
> & 3? Do you want me to send two series (1 binding patch and 2 DT patches), 
> which you will receive both of them?


Best regards,
Krzysztof

