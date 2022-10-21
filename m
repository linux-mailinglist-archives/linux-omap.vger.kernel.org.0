Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1FB6079F3
	for <lists+linux-omap@lfdr.de>; Fri, 21 Oct 2022 16:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiJUOwb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Oct 2022 10:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiJUOwa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Oct 2022 10:52:30 -0400
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC54539B8E;
        Fri, 21 Oct 2022 07:52:29 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1321a1e94b3so3857793fac.1;
        Fri, 21 Oct 2022 07:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QlvEZdCqgxNR+lZRpUq3doxR2q3WHpw4WcV2BBWb8k=;
        b=DQcBcxEh8qAHe3OHC7f+k4ZG/NLt9cJjBfBdkLyphS6i+WaDIL61dFlSHKjJ7rWqiX
         tmasrX46HeaiosBLKMv/UQn4YW1VMXf7pYwYoIRb8nJLCaba258xxWMeElLna6/FIwxm
         vKl0D6DPAo+x7YUkn/Mc4lWmCcQfNelskfIKWeQooXzEOAESQeaxz8IjOQRKwFqwD90D
         qrpHQ0XVsgCvjX6HkVIfZQrtm52la6nqsesT5/ARfw10bG/Px1nFUv0feAB90iLerSWa
         23v3AZaFQSzPNve0RjTEppsgA1JfKN7shQA+Wi9+dkRzTCCnk560wZeR5W4Y36RQkQfY
         cRRQ==
X-Gm-Message-State: ACrzQf0GmL43w1EEOko9FI6rUuHv1bCA9lZrnjB86xOJdBWsiBDZFmCw
        xrbC6AlAmSDCu5O9o+3K5w==
X-Google-Smtp-Source: AMsMyM7qbJrS0n3aNo8NhFTsYDSbaO5y8VIbgq9g3ZX4vwrfWqW8unzAeVmfF4HnAa6rhS6zBuicQA==
X-Received: by 2002:a05:6870:2108:b0:132:f883:2378 with SMTP id f8-20020a056870210800b00132f8832378mr12208420oae.77.1666363948946;
        Fri, 21 Oct 2022 07:52:28 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w24-20020a4a9d18000000b0047f94375092sm8759640ooj.40.2022.10.21.07.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 07:52:28 -0700 (PDT)
Received: (nullmailer pid 3722054 invoked by uid 1000);
        Fri, 21 Oct 2022 14:52:30 -0000
Date:   Fri, 21 Oct 2022 09:52:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org, tony@atomide.com,
        linux-omap@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        rogerq@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
Message-ID: <166636394620.3721929.16610201673432595208.robh@kernel.org>
References: <20221021081612.591613-1-benedikt.niedermayr@siemens.com>
 <20221021081612.591613-3-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021081612.591613-3-benedikt.niedermayr@siemens.com>
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

On Fri, 21 Oct 2022 10:16:12 +0200, B. Niedermayr wrote:
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
