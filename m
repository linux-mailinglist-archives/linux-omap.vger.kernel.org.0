Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDD935ACE74
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 11:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237352AbiIEI4k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 04:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235795AbiIEI4j (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 04:56:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57C64BD22;
        Mon,  5 Sep 2022 01:56:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7F3CCB80F6F;
        Mon,  5 Sep 2022 08:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02DCC433C1;
        Mon,  5 Sep 2022 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662368196;
        bh=Es/AHL8iVfzJP+fihr1TFAxJweWnWEbLykY5le8OeNU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=hf1O/zLzK0LNxBa9uWXvi+/lgwR3xkL9uATs6K6X2+QvAJQt9BoYYPsbrdlpe5X0h
         C2STvw98Aj8FucvFIoD+GRPCIlsS8r/P8cjbtwoor/KKhJKaZUXs3cnIeKHzJCJnwu
         v6r8eB+/AfSAh8h4jsN4tyG/AJ0EFiioMftLrYT14OG+y121/LQfERKbtuDi+pMzRK
         DM18ZbApax9gnxRS2PkBanvXL4mH+IHtAK0xdIHJydwJ7RAUP8oM/R3zz9OmlUun7O
         Y1HCGe13DnTKMT3pn2bj/iuif768mWNbKz+0UsANblQu9xj1a0ayVsZjqbbfLT7XL8
         +Uakw+H8dd7jA==
Message-ID: <d75ff1cf-64a6-e794-87a2-204e93c852cf@kernel.org>
Date:   Mon, 5 Sep 2022 11:56:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] dt-bindings: memory-controllers: gpmc-child: Add
 binding for wait-pin-polarity
Content-Language: en-US
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Cc:     tony@atomide.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org
References: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
 <20220905071717.1500568-4-benedikt.niedermayr@siemens.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20220905071717.1500568-4-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Benedikt,

On 05/09/2022 10:17, B. Niedermayr wrote:
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
> +    description: |
> +      Wait-pin polarity used by the clien. It relates to the pin defined

did you mean "client?"
Can you please specify what value is for Active Low vs Active High?

> +      with "gpmc,wait-pin".
> +    $ref: /schemas/types.yaml#/definitions/uint32

Why can't type be boolean?

> +    default: 0
> +
>    gpmc,wait-on-read:
>      description: Enables wait monitoring on reads.
>      type: boolean

cheers,
-roger
