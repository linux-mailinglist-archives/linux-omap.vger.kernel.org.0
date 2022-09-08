Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2DD15B1C21
	for <lists+linux-omap@lfdr.de>; Thu,  8 Sep 2022 14:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbiIHMDU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Sep 2022 08:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbiIHMDT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Sep 2022 08:03:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C4DE22A2;
        Thu,  8 Sep 2022 05:03:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D572FB820C3;
        Thu,  8 Sep 2022 12:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455BEC433B5;
        Thu,  8 Sep 2022 12:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662638596;
        bh=Oq6/cRurxE13OIedRSajVjK+j/BeomDvOtcz+cNorrs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=catO2CZhto4p1XqpQM7hc2DTI+IbWrwGc7P4saDTWbNGAcfAmCPZuWH4Ri+U2daOt
         9cwTmgN4jyDhbfxvNdmXCMd9AmvZnafdHC3bGcznAySxu0ay+SWFIZ0lXDysPM0iI8
         zbFfXjJwXye1kORZGJLqnPJEu8ZWI2Y63ccczKmp8XfcWNx2SnyP05kaKglS4pOkgg
         eOj26VwQNd2Y/IuqZCUe97H/ZboN8pCROZQhvjCoiAY6wiZSHcVIJonGV2ywy+97q5
         9ndIh/yGbuHGzyV65FEX8aoNrdEsL2gdYABQZum2pPIxK3wMHZvjGios2jHYvjdkQK
         Zv1qsoule20SA==
Message-ID: <3f9ab380-4011-75f1-40df-f6c7759f69de@kernel.org>
Date:   Thu, 8 Sep 2022 15:03:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] dt-bindings: memory-controllers: gpmc-child: Add
 binding for wait-pin-polarity
Content-Language: en-US
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Cc:     tony@atomide.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org
References: <20220906124747.1767318-1-benedikt.niedermayr@siemens.com>
 <20220906124747.1767318-4-benedikt.niedermayr@siemens.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20220906124747.1767318-4-benedikt.niedermayr@siemens.com>
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



On 06/09/2022 15:47, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> Add a new dt-binding for the wait-pin-polarity property
> 
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> ---
>  .../bindings/memory-controllers/ti,gpmc-child.yaml         | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
> index 6e3995bb1630..7c721206f10b 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
> @@ -230,6 +230,13 @@ properties:
>        Wait-pin used by client. Must be less than "gpmc,num-waitpins".
>      $ref: /schemas/types.yaml#/definitions/uint32
>  
> +  gpmc,wait-pin-polarity:

gpmc,wait-pin-active-low ?

> +    description: |
> +      Wait-pin polarity used by the clien. It relates to the pin defined
> +      with "gpmc,wait-pin".

Please update description accordingly.

> +    $ref: /schemas/types.yaml#/definitions/uint32

boolean type

> +    default: 0
> +
>    gpmc,wait-on-read:
>      description: Enables wait monitoring on reads.
>      type: boolean


cheers,
-roger
