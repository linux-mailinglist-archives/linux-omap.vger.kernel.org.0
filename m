Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE46C5F6DC2
	for <lists+linux-omap@lfdr.de>; Thu,  6 Oct 2022 20:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiJFSzD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 6 Oct 2022 14:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbiJFSzC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 6 Oct 2022 14:55:02 -0400
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80297C1B4;
        Thu,  6 Oct 2022 11:54:59 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id r15-20020a4abf0f000000b004761c7e6be1so2028541oop.9;
        Thu, 06 Oct 2022 11:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNyDx6BFfg8+RnG0YeqL/qLZtD9Wu2Xa2UPz541So84=;
        b=qMiLkRBpmQGLEB51mCJ/M3Eht6bHBGfRNkwoQIxnEQakrqDMLJ2ku4IQecYNwn/R1F
         twTXkEizbSC1z+pBgD+42licwJPLfM03uVaWX+x6Om7abjVxup8Dl7Y5KMfdGMx1Zap0
         VcgdpHv7wAIBYac48LU2MLHcbmXZ64YJg0bJm2WrlLnidXUf5/dobbWZe5/t3LamxZnD
         hB0K/ufg03d/YZPhXnwlD57Tj0iSUl69WI0yS5SEHmYE2cWmxHzIczH00NG2e1d5wmJ6
         TfeJjZsdR2cUJUzfSkiguQzN0Rgi15wl4m2Ifz+xAZs7Z4u0t8BX2WHvrP8AQz5CfrGL
         P9cw==
X-Gm-Message-State: ACrzQf3WhOrHNy2HiOt9gAMAHSdZLodzevQLYPKIpUuy+y6HoLzBb85C
        CZbtEK08iNfapoU7WZ9Sww==
X-Google-Smtp-Source: AMsMyM4qQxT6T2VFfztIkmwrFcBzc6knSEGJe3R6TR5pCf0+L4b6vqHZm2Zlyu2w8h+YBr9xdznAEw==
X-Received: by 2002:a4a:ae43:0:b0:476:7acc:78e1 with SMTP id a3-20020a4aae43000000b004767acc78e1mr416443oon.90.1665082498858;
        Thu, 06 Oct 2022 11:54:58 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:8a65:c536:245:842:a3a4:9017])
        by smtp.gmail.com with ESMTPSA id q9-20020a056870808900b00132d5443aadsm211920oab.32.2022.10.06.11.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 11:54:58 -0700 (PDT)
Received: (nullmailer pid 29815 invoked by uid 1000);
        Thu, 06 Oct 2022 18:54:57 -0000
Date:   Thu, 6 Oct 2022 13:54:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>
Cc:     robh+dt@kernel.org, tony@atomide.com, devicetree@vger.kernel.org,
        rogerq@kernel.org, linux-omap@vger.kernel.org,
        krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v7 2/2] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
Message-ID: <166508249610.29727.2761917523353520158.robh@kernel.org>
References: <20221005142224.287982-1-benedikt.niedermayr@siemens.com>
 <20221005142224.287982-3-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005142224.287982-3-benedikt.niedermayr@siemens.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 05 Oct 2022 16:22:24 +0200, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> The GPMC controller has the ability to configure the polarity for the
> wait pin. The current properties do not allow this configuration.
> This binding directly configures the WAITPIN<X>POLARITY bit
> in the GPMC_CONFIG register by setting the "ti,wait-pin-polarity"
> dt-property.
> 
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> ---
>  .../bindings/memory-controllers/ti,gpmc-child.yaml         | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
