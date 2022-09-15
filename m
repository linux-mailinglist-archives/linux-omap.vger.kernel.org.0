Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6E55B9761
	for <lists+linux-omap@lfdr.de>; Thu, 15 Sep 2022 11:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiIOJ04 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Sep 2022 05:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiIOJ0z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Sep 2022 05:26:55 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4CBF8036D;
        Thu, 15 Sep 2022 02:26:53 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id t7so29836499wrm.10;
        Thu, 15 Sep 2022 02:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date;
        bh=oZcHLP4HdtR1v6BTWYj2XPRoK5siEVv1DYPhLj/hidc=;
        b=cONemxuhxWJMQH4WpbMvaGKwDDh4gIAk76NP0g4nDCA3tstm3EL4xD44d2qcxdAlkX
         B39HdGRxDNuZX3ktCsG3whTIwHCK+HlUz3A7uROi/5sg01STJcRS7NwWiW9HqP/zM6P6
         olYkV6nf9ZvDtGDsc2i4ZmpYywGrSic+1yeluNOHvtnzc6Qy7M9jpkK9YLfvSje1d2eQ
         ev29p2u8jfnyuguwbqzagr3E49jWKe2Zz6ymtMueMWiDv5JaI42zbJHDFaRL6X5dFrP/
         +tJFxSJO2DFVaIDhZc+Jn5yyZlHjNkD9uz62A0wNU+tLbwxNPphFaKWZb/KkWkt6BBQS
         B3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date;
        bh=oZcHLP4HdtR1v6BTWYj2XPRoK5siEVv1DYPhLj/hidc=;
        b=spIpU4PcahAUEj3ECz1rAnRQci3S4d86+HTsh+nCMJ4ksZo01MrbJ2+aaT9xhrvJgM
         5QOjE/Aw8Bp3tVwW71zTX4k/ZLlxWwAzrUwdZOwQma55nHu8LOVHoTIQ/0JIZyH8ZJxt
         4GPN8onUmQMaZwvNPJ3GcZnFkf2PhlYZslqz3A6qGZZbWv0hakGogR8UYaDxDmPhzUeF
         eJIy6tyuhq3Ccx1PJQeBWZCMJxKj9RCq49LDi6Mr0jigp9DBEDdW+ptQi4yuAl5/6iAC
         DqMdYA/4vC5P3kMU5Cs21whNSwQayOVjXxLEGla9vQnZi+OV7vu+f/dhwej49i4ZojfZ
         bJWw==
X-Gm-Message-State: ACrzQf39+NkGgwMJG27E4CC8uuRnp2ISzVzdmqJPrRnvnkfg6ewzDlnr
        esIRRPqdf6/jsSegTgm7HrM=
X-Google-Smtp-Source: AMsMyM4Gj6tjcURPzhPJ93mzX9WbNhqvc9BcYOHLmidI51KP9CoUdS3FIJWsT7lf7SvYfg8axnvrtw==
X-Received: by 2002:adf:b1d2:0:b0:22a:d6cd:63cc with SMTP id r18-20020adfb1d2000000b0022ad6cd63ccmr782474wra.483.1663234012261;
        Thu, 15 Sep 2022 02:26:52 -0700 (PDT)
Received: from krzk-bin ([89.101.193.73])
        by smtp.googlemail.com with ESMTPSA id bg39-20020a05600c3ca700b003b47b913901sm1875153wmb.1.2022.09.15.02.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 02:26:51 -0700 (PDT)
From:   Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
X-Google-Original-From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date:   Thu, 15 Sep 2022 10:26:49 +0100
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-renesas-soc@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-omap@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        devicetree@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
Message-ID: <20220915092649.moyd6j6jm7dk6vmh@krzk-bin>
References: <cover.1663165552.git.geert+renesas@glider.be>
 <1224e757ec958f8b29ec66e783a7ee805c339d84.1663165552.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1224e757ec958f8b29ec66e783a7ee805c339d84.1663165552.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 14 Sep 2022 16:33:22 +0200, Geert Uytterhoeven wrote:
> Convert the NXP TDA998x HDMI transmitter Device Tree binding
> documentation to json-schema.
> 
> Add missing "#sound-dai-cells" property.
> Add ports hierarchy, as an alternative to port.
> Drop pinctrl properties, as they do not belong here.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Add maximum to video-ports,
>   - Drop unneeded maxItems for audio-ports,
>   - Complete port descriptions.
> ---
>  .../bindings/display/bridge/nxp,tda998x.yaml  | 109 ++++++++++++++++++
>  .../bindings/display/bridge/tda998x.txt       |  54 ---------
>  2 files changed, 109 insertions(+), 54 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/tda998x.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


tda19988@70: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb
	arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb
	arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb
	arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb

tda19988@70: ports: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/am335x-boneblack.dtb
	arch/arm/boot/dts/am335x-boneblack-wireless.dtb
	arch/arm/boot/dts/am335x-sancloud-bbe.dtb

tda19988@70: ports:port@0: 'reg' is a required property
	arch/arm/boot/dts/am335x-boneblack.dtb
	arch/arm/boot/dts/am335x-boneblack-wireless.dtb
	arch/arm/boot/dts/am335x-sancloud-bbe.dtb

tda9988@70: ports: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/am335x-myirtech-myd.dtb

tda9988@70: ports:port@0: 'reg' is a required property
	arch/arm/boot/dts/am335x-myirtech-myd.dtb
