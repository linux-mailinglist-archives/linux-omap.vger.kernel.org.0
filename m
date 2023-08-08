Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F41BB773D6E
	for <lists+linux-omap@lfdr.de>; Tue,  8 Aug 2023 18:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbjHHQRm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Aug 2023 12:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbjHHQQJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Aug 2023 12:16:09 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA3830C6
        for <linux-omap@vger.kernel.org>; Tue,  8 Aug 2023 08:48:09 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fe0c566788so9088870e87.0
        for <linux-omap@vger.kernel.org>; Tue, 08 Aug 2023 08:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509688; x=1692114488;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UUWWJpKA/6zwXJWGtCMuvBG3TRDaWAJxATaidUtAgac=;
        b=irw0Ka5Qdf3kSEy0MALqAovFfHj/Ms0Z8HD3sgK5u0MQwlmUZFQhiROwNTspFVw5w6
         cuusOjKPFIgkexAPqrAWk5fFmrzlEPbnRl1Mh15AsaS0zMPyuSyMD0mkqBs2sBpN0BKj
         SFkyGxJ0QXFgo++VUq0KML3n6bKQDxVsnFmLXTvG7GkI4GoKNgcR41uQREdjpdYk5+Rt
         SQmEhUfwllza1hB+dnLz6hY7g6sIl5rjgjEsvRpZDXGC7WtX9oVO4LyEqY5nj/BH4b55
         jiUYqTunJ495iT5dLC0/whCPCOWkCfYXcT0DxpooYSq7++UtGuT5pwPOW6641R5FIQEU
         K4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509688; x=1692114488;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUWWJpKA/6zwXJWGtCMuvBG3TRDaWAJxATaidUtAgac=;
        b=WRE6y5tuEkpLv71+6vCxLYLcAj7M0oGrGDrTeV6VeIJA4c2mjzctCVTvD7svddyhFG
         NiS7ARUNGwK3ZAvldP4XQHfhuY3qh+R7FYDaGgR0cbdJEGWn07+Y0qgCrWCC1nz6G746
         SeAW6Mx34pN14a61976F+1VE9NWPwH3HxswSKkMoAIG6OlCGlDj/fM/I+TI8hP+yKVXN
         z84DW01wYzcBjX11xrXZE3wLnvRKE8uWW2SWgthjoCtDEFWDfBdz1W8D7mTFl4nUmchR
         QI82RLg8+BtwY0cf5g/4j2xH3ftv1Nxn/GYJPs8WyUawLPfErOseuKrLz5X0QujWjaHr
         +cUg==
X-Gm-Message-State: AOJu0YxcLQJNjwHxZJe17Npic6TLkh8b3MkTJKN0bcXhBOz2ofM1Pup9
        BGDvVrvUGttSi4Erj4+lWyO+lZkxZQYR80dq0YQ=
X-Google-Smtp-Source: AGHT+IESMg7JzrGFpGM30sigc77/m28bfDkUOPdPqGf70edI8KNzvVpGtPkhRGubKlKkdCSwOam6hg==
X-Received: by 2002:adf:ef42:0:b0:314:54f0:df35 with SMTP id c2-20020adfef42000000b0031454f0df35mr8529088wrp.16.1691489895173;
        Tue, 08 Aug 2023 03:18:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d5192000000b003143b7449ffsm13177574wrv.25.2023.08.08.03.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 03:18:14 -0700 (PDT)
Message-ID: <1ade44f5-b3d1-dcde-6819-9e944f3b115d@linaro.org>
Date:   Tue, 8 Aug 2023 12:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: remoteproc: pru: Add Interrupt property
Content-Language: en-US
To:     Md Danish Anwar <a0501179@ti.com>, Conor Dooley <conor@kernel.org>,
        MD Danish Anwar <danishanwar@ti.com>
Cc:     Suman Anna <s-anna@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, srk@ti.com,
        nm@ti.com
References: <20230807110836.2612730-1-danishanwar@ti.com>
 <20230807-euphemism-trailing-ef4130dc7437@spud>
 <910a4a98-712a-5517-5a5b-ffb962f83463@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <910a4a98-712a-5517-5a5b-ffb962f83463@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/08/2023 11:44, Md Danish Anwar wrote:
>>>    properties:
>>>      compatible:
>>> @@ -171,6 +181,9 @@ examples:
>>>                <0x22400 0x100>;
>>>          reg-names = "iram", "control", "debug";
>>>          firmware-name = "am65x-pru0_0-fw";
>>> +        interrupt-parent = <&icssg0_intc>;
>>> +        interrupts = <16 2 2>;
>>> +        interrupt-names = "vring";
>>>        };
>>
>> These examples would probably be more helpful if they used the
>> appropriate defines, no?
>>
> 
> PRUSS Interrupt controller doesn't have any appropriate defines. This doesn't
> use GIC so defines from arm-gic.h can not be used here. These are specific to
> PRUSS INTC.
> 
> I think these example are OK. Please let me know if this is OK to you.

But isn't "2" type of the interrupt?

Best regards,
Krzysztof

