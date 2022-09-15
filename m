Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA675B9C6B
	for <lists+linux-omap@lfdr.de>; Thu, 15 Sep 2022 15:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiION4K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Sep 2022 09:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbiION4J (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Sep 2022 09:56:09 -0400
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8805E61700;
        Thu, 15 Sep 2022 06:56:07 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id w125so2303701oig.3;
        Thu, 15 Sep 2022 06:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=q66f43KsxyST/5BEurZYfdj2G2PKAITc7F9iCXzLPdk=;
        b=Flxga/hDO3VCaHBIyXTRyP5PDhUfHXv6PCujHJupjqUGUSCE4vcWNhXftTUnpa7+je
         /7MIiAVk7uaW3gQN7fZsBjI5DnCzyvUDRAr/w3y73O5DPjudrZYOMnC1w5mAPGn5he5H
         NdV2hBLNA5SX6fAQP8WEaqtA+0ZrXfT1JpWSu7JLSlS4tHSmJqXk4ioWwtso45hKLfjv
         6zeA7dsIrREAypb1MU5WZ62dC4maFQ5j+nJPsnRZ+HSU2cKf32l6+WEGKjZxJbmo9svD
         XH/7wxtRO7F2O6i91ewZYNgWP4ERgI/5Ib4KHv0ASnlhpVoKCRVHAgc3IyvfDPMu0k/b
         u94w==
X-Gm-Message-State: ACgBeo1SvCiLILcwDDY5joUHCxQBWUysWpQpO8TtrdkCduSStKfPhO5X
        4VjNTv+N0hC8pD1rGp8vmg==
X-Google-Smtp-Source: AA6agR4OqVR+8Sws/CQvxnWN++jg3/yUDEHTGwCJaIb2Vl0cXOP+vOI1TG5xv/TIrBp9LI7gXfjcXQ==
X-Received: by 2002:a05:6808:f8d:b0:345:6ee0:9a65 with SMTP id o13-20020a0568080f8d00b003456ee09a65mr4115637oiw.299.1663250166396;
        Thu, 15 Sep 2022 06:56:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x7-20020a4a8d47000000b004728e64dc0fsm8043611ook.38.2022.09.15.06.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 06:56:05 -0700 (PDT)
Received: (nullmailer pid 1191178 invoked by uid 1000);
        Thu, 15 Sep 2022 13:56:04 -0000
Date:   Thu, 15 Sep 2022 08:56:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Krzysztof Kozlowski <k.kozlowski.k@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-renesas-soc@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-omap@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        devicetree@vger.kernel.org,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
Message-ID: <20220915135604.GA1180348-robh@kernel.org>
References: <cover.1663165552.git.geert+renesas@glider.be>
 <1224e757ec958f8b29ec66e783a7ee805c339d84.1663165552.git.geert+renesas@glider.be>
 <20220915092649.moyd6j6jm7dk6vmh@krzk-bin>
 <CAMuHMdWqQXm66kbbKdK0O2qQFM_3oGEWEGmh4LxBZwR-PDc_Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWqQXm66kbbKdK0O2qQFM_3oGEWEGmh4LxBZwR-PDc_Hg@mail.gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 15, 2022 at 12:15:28PM +0100, Geert Uytterhoeven wrote:
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

Just ignore if not useful. It's informational purposes.

The testing doesn't get series because it gets patches from PW which 
filters out just bindings. And it tests a patch at a time to get 
warnings for that patch. If folks want to stop sending binding patches 
for a couple of months, I can improve it.

Rob
