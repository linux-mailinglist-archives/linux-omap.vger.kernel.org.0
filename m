Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03ED25F12ED
	for <lists+linux-omap@lfdr.de>; Fri, 30 Sep 2022 21:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbiI3TnI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Sep 2022 15:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbiI3TnD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Sep 2022 15:43:03 -0400
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C494E17BEC0;
        Fri, 30 Sep 2022 12:42:59 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-13207a86076so2360823fac.3;
        Fri, 30 Sep 2022 12:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=zaxKhlu0A5y+HDeDD9O4OWcXAAMoWkFhIdfkHn+4OyI=;
        b=xNVmnxQ1+TsK7FpIEWsEpLRFOtQpFr6gKzJ4txjDWpdYO/gsBWnD7bTTQ+u8yqQvnT
         LNxSjPSpGAlDE7x4XM2c/cdkDeyRhhqQESnEWjcOSZmIO6ENif0ubzIJMDwPpTUsrgHS
         +jf1uB5KtdR1KKlBZWW/9x+9159LS+Ora9b19yR7GIxrcnAaXKsl6RrgUejlyv3Y66w/
         XKMnSGztDezBAFvb4HhaSkrDBNl5qPS281EfooFR5LE6XDCoUp2KuZuN4Eehn2Jd63Mz
         LwYdzvL77fKAeS2AcswgEIXlun9wUbltoFjy9AWknYNDq5C/WnrnKHnEKU7BN6ioSFWZ
         IndA==
X-Gm-Message-State: ACrzQf3DaGUncfpHLQPcWLFirDNyj/r11kjoSpfhTyeMrl7B3d9q+Po1
        sK/4GUaU+vSsPTzUMFp/Sg==
X-Google-Smtp-Source: AMsMyM7+iMMW66eP5e0LZhID8KFe5Z/j3XxZuKkx+uWXYar1kUyw2/l5sh7kCxiGmf7KZ2FkH7cbTw==
X-Received: by 2002:a05:6870:4798:b0:12c:fdf7:e948 with SMTP id c24-20020a056870479800b0012cfdf7e948mr5407607oaq.247.1664566978847;
        Fri, 30 Sep 2022 12:42:58 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g26-20020a9d621a000000b00655bc32a413sm767635otj.42.2022.09.30.12.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:42:58 -0700 (PDT)
Received: (nullmailer pid 763843 invoked by uid 1000);
        Fri, 30 Sep 2022 19:42:57 -0000
Date:   Fri, 30 Sep 2022 14:42:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>
Cc:     devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, rogerq@kernel.org, tony@atomide.com
Subject: Re: [PATCH v6 2/2] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
Message-ID: <20220930194257.GA756240-robh@kernel.org>
References: <20220929125639.143953-1-benedikt.niedermayr@siemens.com>
 <20220929125639.143953-3-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929125639.143953-3-benedikt.niedermayr@siemens.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 29, 2022 at 02:56:39PM +0200, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> The GPMC controller has the ability to configure the polarity for the
> wait pin. The current properties do not allow this configuration.
> This binding directly configures the WAITPIN<X>POLARITY bit
> in the GPMC_CONFIG register by setting the gpmc,wait-pin-polarity
> dt-property.
> 
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> ---
>  .../bindings/memory-controllers/ti,gpmc-child.yaml         | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
> index 6e3995bb1630..477189973334 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
> @@ -230,6 +230,13 @@ properties:
>        Wait-pin used by client. Must be less than "gpmc,num-waitpins".
>      $ref: /schemas/types.yaml#/definitions/uint32
>  
> +  gpmc,wait-pin-polarity:

'gpmc' is not a vendor. Don't continue this bad pattern, use 'ti'.

> +    description: |
> +      Set the desired polarity for the selected wait pin.
> +      1 for active low, 0 for active high.

Well that looks backwards. I assume from the commit msg above, it's the 
register value, but that's not what the description says. Please go with 
the logical state here and do the inversion in the driver.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +
>    gpmc,wait-on-read:
>      description: Enables wait monitoring on reads.
>      type: boolean
> -- 
> 2.25.1
> 
> 
