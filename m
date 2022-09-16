Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 288535BB2CC
	for <lists+linux-omap@lfdr.de>; Fri, 16 Sep 2022 21:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbiIPT34 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Sep 2022 15:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiIPT3z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Sep 2022 15:29:55 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D7D29CB0;
        Fri, 16 Sep 2022 12:29:54 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id u6-20020a056830118600b006595e8f9f3fso3362402otq.1;
        Fri, 16 Sep 2022 12:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=OB5NCz64cDZ4/Yf4QpF2872Y4Qqzscs/5jTTATIjmnM=;
        b=4c6wd7QU0K5sopw8AR8n+x/SDcYZS6hCuvOZybZUbjhmpKZnDT9aVHh+1B3FIMMMzA
         Puf/hgbQnNgjX3FIngfJR1RPL+bjc9ud+odWoFQlcs1PTR/XpUny5Z9wu6kxKOMOBR1B
         j8eXutoaOcYeYp1fAKsJhNqf4+5DAIyc1KcS7YPE8a7Fji1TyCHWW2Qjzw7TJgYAOJhd
         FqjXmyqpTwsxv1ZudGlr/WUHcd9SYZRUu/+39iTO85Ujb43lEprOB9y6ENzVMYx0yAw6
         46nCSZuF3HO5ZfX1ovJDNHZsYiDBWH0ZF/HXBjsaJZ54ACLpS/2rsiPWSla/SaXtQxNZ
         ZhjA==
X-Gm-Message-State: ACrzQf041oZF1jaiY35DGr9iSQIEqDi46DqhK+ZowmrXnw8zI/aR8jX8
        /8aecPAdm2h+mn6lqh6LuA==
X-Google-Smtp-Source: AMsMyM4H95t5Igw8deTnTowfnD2pJt70FJKnkiKmQGDXKRQ1kNqYPD86UfFnWiUF0xTtj0cjOFe76g==
X-Received: by 2002:a05:6830:6605:b0:656:c1b3:5d0a with SMTP id cp5-20020a056830660500b00656c1b35d0amr2978466otb.180.1663356593394;
        Fri, 16 Sep 2022 12:29:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a65-20020a9d2647000000b006391bdbb361sm10168430otb.31.2022.09.16.12.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 12:29:53 -0700 (PDT)
Received: (nullmailer pid 1130396 invoked by uid 1000);
        Fri, 16 Sep 2022 19:29:52 -0000
Date:   Fri, 16 Sep 2022 14:29:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <k.kozlowski.k@gmail.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
Message-ID: <20220916192952.GA1130333-robh@kernel.org>
References: <cover.1663165552.git.geert+renesas@glider.be>
 <1224e757ec958f8b29ec66e783a7ee805c339d84.1663165552.git.geert+renesas@glider.be>
 <20220915092649.moyd6j6jm7dk6vmh@krzk-bin>
 <CAMuHMdWqQXm66kbbKdK0O2qQFM_3oGEWEGmh4LxBZwR-PDc_Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWqQXm66kbbKdK0O2qQFM_3oGEWEGmh4LxBZwR-PDc_Hg@mail.gmail.com>
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

On Thu, 15 Sep 2022 12:15:28 +0100, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, Sep 15, 2022 at 10:26 AM Krzysztof Kozlowski
> <k.kozlowski.k@gmail.com> wrote:
> > On Wed, 14 Sep 2022 16:33:22 +0200, Geert Uytterhoeven wrote:
> > > Convert the NXP TDA998x HDMI transmitter Device Tree binding
> > > documentation to json-schema.
> > >
> > > Add missing "#sound-dai-cells" property.
> > > Add ports hierarchy, as an alternative to port.
> > > Drop pinctrl properties, as they do not belong here.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v2:
> > >   - Add maximum to video-ports,
> > >   - Drop unneeded maxItems for audio-ports,
> > >   - Complete port descriptions.
> > > ---
> > >  .../bindings/display/bridge/nxp,tda998x.yaml  | 109 ++++++++++++++++++
> > >  .../bindings/display/bridge/tda998x.txt       |  54 ---------
> > >  2 files changed, 109 insertions(+), 54 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/tda998x.txt
> > >
> >
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> >
> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.
> >
> > Full log is available here: https://patchwork.ozlabs.org/patch/
> >
> >
> > tda19988@70: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> >         arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb
> >         arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb
> >         arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb
> >         arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb
> >
> > tda19988@70: ports: 'oneOf' conditional failed, one must be fixed:
> >         arch/arm/boot/dts/am335x-boneblack.dtb
> >         arch/arm/boot/dts/am335x-boneblack-wireless.dtb
> >         arch/arm/boot/dts/am335x-sancloud-bbe.dtb
> >
> > tda19988@70: ports:port@0: 'reg' is a required property
> >         arch/arm/boot/dts/am335x-boneblack.dtb
> >         arch/arm/boot/dts/am335x-boneblack-wireless.dtb
> >         arch/arm/boot/dts/am335x-sancloud-bbe.dtb
> >
> > tda9988@70: ports: 'oneOf' conditional failed, one must be fixed:
> >         arch/arm/boot/dts/am335x-myirtech-myd.dtb
> >
> > tda9988@70: ports:port@0: 'reg' is a required property
> >         arch/arm/boot/dts/am335x-myirtech-myd.dtb
> 
> Please test this with the earlier patches in the same series applied ;-)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
> 
> From git@z Thu Jan  1 00:00:00 1970
> Return-Path: <devicetree-owner@kernel.org>
> X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
> 	aws-us-west-2-korg-lkml-1.web.codeaurora.org
> Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
> 	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EEEC6FA8B
> 	for <linux-devicetree@archiver.kernel.org>;
>  Wed, 14 Sep 2022 14:34:04 +0000 (UTC)
> Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
>         id S230118AbiINOeC (ORCPT
>         <rfc822;linux-devicetree@archiver.kernel.org>);
>         Wed, 14 Sep 2022 10:34:02 -0400
> Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57410 "EHLO
>         lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
>         with ESMTP id S230133AbiINOeA (ORCPT
>         <rfc822;devicetree@vger.kernel.org>); Wed, 14 Sep 2022 10:34:00 -0400
> Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
>  [IPv6:2a02:1800:120:4::f00:13])
>         by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC42B7C301
>         for <devicetree@vger.kernel.org>;
>  Wed, 14 Sep 2022 07:33:57 -0700 (PDT)
> Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:e925:8cbe:2e99:b03b])
>         by baptiste.telenet-ops.be with bizsmtp
>         id KqZi2800s3vs4GX01qZiPV; Wed, 14 Sep 2022 16:33:55 +0200
> Received: from rox.of.borg ([192.168.97.57])
>         by ramsan.of.borg with esmtps  (TLS1.3) tls
>  TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
>         (Exim 4.93)
>         (envelope-from <geert@linux-m68k.org>)
>         id 1oYTSP-005B5L-Rc; Wed, 14 Sep 2022 16:33:41 +0200
> Received: from geert by rox.of.borg with local (Exim 4.93)
>         (envelope-from <geert@linux-m68k.org>)
>         id 1oYTS7-000zXm-2p; Wed, 14 Sep 2022 16:33:23 +0200
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> To: Russell King <linux@armlinux.org.uk>,
>         Rob Herring <robh+dt@kernel.org>,
>         Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
>         Tony Lindgren <tony@atomide.com>,
>         Andrzej Hajda <andrzej.hajda@intel.com>,
>         Neil Armstrong <narmstrong@baylibre.com>,
>         Robert Foss <robert.foss@linaro.org>,
>         Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
>         Jonas Karlman <jonas@kwiboo.se>,
>         Jernej Skrabec <jernej.skrabec@gmail.com>,
>         David Airlie <airlied@linux.ie>,
>         Daniel Vetter <daniel@ffwll.ch>,
>         =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
>         Magnus Damm <magnus.damm@gmail.com>,
>         Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
>         linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
>         Geert Uytterhoeven <geert+renesas@glider.be>
> Subject: [PATCH v2 3/3] dt-bindings: display: bridge: nxp,tda998x: Convert to
>  json-schema
> Date: Wed, 14 Sep 2022 16:33:22 +0200
> Message-Id:
>  <1224e757ec958f8b29ec66e783a7ee805c339d84.1663165552.git.geert+renesas@glider.be>
> X-Mailer: git-send-email 2.25.1
> In-Reply-To: <cover.1663165552.git.geert+renesas@glider.be>
> References: <cover.1663165552.git.geert+renesas@glider.be>
> MIME-Version: 1.0
> Content-Transfer-Encoding: 8bit
> Precedence: bulk
> List-ID: <devicetree.vger.kernel.org>
> X-Mailing-List: devicetree@vger.kernel.org
> 
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

Applied, thanks!
