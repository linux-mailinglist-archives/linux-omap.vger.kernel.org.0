Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE1D5B1C57
	for <lists+linux-omap@lfdr.de>; Thu,  8 Sep 2022 14:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbiIHMKS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Sep 2022 08:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbiIHMJv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Sep 2022 08:09:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F64D11C15A;
        Thu,  8 Sep 2022 05:09:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9F76F61CD4;
        Thu,  8 Sep 2022 12:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383B9C433D6;
        Thu,  8 Sep 2022 12:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662638956;
        bh=CJzMkou4A5airz5MIJinR+0yTfkpqS3kDaVetJ0jYr4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kcGsFITJO/bFq1DS3O6S+lx7s5KtJ4nlgo0u9HumiWYm76GkD3y5X7eTqp9rNPfJz
         mEFA48ubjKEo6YifSlG4Bha0r3Eo7f8sXl8bdFXSAUZyj7MIGJTvKlLv3vtX6TS5PY
         L59qhKsOSGyrF4zRgTmmm6ribhflTMisd9gzBW5gQS9Q/frRprHYdgDSgp2jiMEW/M
         ITwo0QPf7LDhdtk2LxG1+ROIQinUuTfxkziiMgtRqTJDBiCeZ9vAMqK9vMcE1hGGXA
         v3yx3257WLWwGNae4cvuxcznutLZiwkVaKALrntiK2TL++GXgYPrC8bQz8mxQT6Agu
         M5R06mqkXIJ9g==
Message-ID: <70a2fec4-e7b9-e8ed-4d8a-d547003dbb9e@kernel.org>
Date:   Thu, 8 Sep 2022 15:09:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 3/3] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
Content-Language: en-US
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Cc:     tony@atomide.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org
References: <20220906124747.1767318-1-benedikt.niedermayr@siemens.com>
 <20220906124747.1767318-5-benedikt.niedermayr@siemens.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20220906124747.1767318-5-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-10.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Benedikt,


On 06/09/2022 15:47, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> The GPMC controller has the ability to configure the polarity for the
> wait pin. The current properties do not allow this configuration.
> This binding directly configures the WAITPIN<X>POLARITY bit
> in the GPMC_CONFIG register.
> 
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> ---
>  .../bindings/memory-controllers/ti,gpmc-child.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
> index 6e3995bb1630..a115b544a407 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
> @@ -230,6 +230,12 @@ properties:
>        Wait-pin used by client. Must be less than "gpmc,num-waitpins".
>      $ref: /schemas/types.yaml#/definitions/uint32
>  
> +  gpmc,wait-pin-active-low:
> +    description: |
> +      Set the polarity for the selected wait pin to active low.
> +      Defaults to active high if this is not set.
> +    type: boolean
> +

I just checked that the default behaviour is active low.
Reset value of the polarity register field is 0, which means active low.

We will need to use the property "gpmc,wait-pin-active-high" instead.

Sorry for not catching this earlier.

>    gpmc,wait-on-read:
>      description: Enables wait monitoring on reads.
>      type: boolean

cheers,
-roger
