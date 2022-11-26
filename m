Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA0463967D
	for <lists+linux-omap@lfdr.de>; Sat, 26 Nov 2022 15:31:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbiKZOa7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 26 Nov 2022 09:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbiKZOa6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 26 Nov 2022 09:30:58 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C861D302
        for <linux-omap@vger.kernel.org>; Sat, 26 Nov 2022 06:30:56 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id d6so10873768lfs.10
        for <linux-omap@vger.kernel.org>; Sat, 26 Nov 2022 06:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOp9VeEnzv5VAO/OaCmDsm8rDMNVnUqD5Q2WOV4X6To=;
        b=J9veXx5lGUVMqWV12L613oXsILLAQ+wdd9j0hxVGO49OzpZdRB5bzLw/nxtcS8z87e
         re99fj8r/ZKReZvZX5iAxs7yR6/s8zsnZU5pPJE+nWXLwcQJcd+fBQYLtqmUayn/5j5T
         ZkSop/96qSZ/eiG/l9O4wG0d+BO2v85G6zRYu86MJVpFf6d72MBrgfsho9hKX2H3RfdJ
         NklZGbzahZi8znKT+oqgqHJhUcsT72isQGFmNnB34J/BSSK91TrYePmcU5fztIfia8oV
         GUsnly+WeWsZjpNgN7rNNmnWzSzdW+x9ty4IueNPFj6GN0t8rBbHWZmuyENj9bI6uOwG
         /b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOp9VeEnzv5VAO/OaCmDsm8rDMNVnUqD5Q2WOV4X6To=;
        b=M23VZBNGGNvp6ngkkAL431BctoTowCR5dCmCSzkYDS8K9DdBkMvW/Q2Mxx2WJgXhHc
         niM0k79oXTq/hgy/qwrKYMbkUbsSUxCe9SsVzGiTAwiQ0o+XuLM8qAc7zx6lpC+Pvv9J
         VOvWrdd7YE9hQogclF2hJqpNWVKvRSzS2IwKEduqaDf3icSRLZELuwOThHnoYB1GYhLE
         DMDXOlay3ohjEcbHGZ7m/W2of6kcfvDvQb9XlO8QTqtUEMAgrQulF81O3PZYZ9WIonBd
         0W5mMr73vbTQLJPooq2b1oQirDV2NNcDoKpCk1RrNATQkexkvRtxmrVv/smgBjpz3Zyv
         M6Mg==
X-Gm-Message-State: ANoB5pm0AM1thEITblL12XeNe7mK5TeG0Qz4BTWLro4YPn/LNk/9M4AO
        Y7HvLWZVVfvltI04JSIqb2i2pA==
X-Google-Smtp-Source: AA0mqf75yMUiNVRsRqbq4zu5xWBS2wPOH+4izo3ghaVHNNA3rV1zExal1ikJKmniGK3OZXYq/r03dQ==
X-Received: by 2002:a19:5049:0:b0:4b4:661a:1ce1 with SMTP id z9-20020a195049000000b004b4661a1ce1mr13137363lfj.136.1669473054898;
        Sat, 26 Nov 2022 06:30:54 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p5-20020ac24ec5000000b00494603953b6sm935295lfr.6.2022.11.26.06.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 06:30:54 -0800 (PST)
Message-ID: <30744357-33cb-96c1-bbe9-f544cde04980@linaro.org>
Date:   Sat, 26 Nov 2022 15:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v7 4/5] dt-bindings: PCI: ti,j721e-pci-*: add j784s4-pci-*
 compatible strings
Content-Language: en-US
To:     Matt Ranostay <mranostay@ti.com>, rogerq@kernel.org,
        lpieralisi@kernel.org, robh@kernel.org, kw@linux.com,
        bhelgaas@google.com, vigneshr@ti.com, tjoseph@cadence.com,
        sergio.paracuellos@gmail.com, pthombar@cadence.com,
        linux-pci@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221124081221.1206167-1-mranostay@ti.com>
 <20221124081221.1206167-5-mranostay@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124081221.1206167-5-mranostay@ti.com>
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

On 24/11/2022 09:12, Matt Ranostay wrote:
> Add definition for j784s4-pci-ep + j784s4-pci-host devices along with
> schema checks for num-lanes.
> 
> Signed-off-by: Matt Ranostay <mranostay@ti.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

