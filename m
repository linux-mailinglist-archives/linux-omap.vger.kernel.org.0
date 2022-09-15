Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA33B5B996B
	for <lists+linux-omap@lfdr.de>; Thu, 15 Sep 2022 13:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiIOLPo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Sep 2022 07:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiIOLPn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Sep 2022 07:15:43 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069626E2C1;
        Thu, 15 Sep 2022 04:15:43 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id a20so10573847qtw.10;
        Thu, 15 Sep 2022 04:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=qYu5hvXmZLhzcr/3mBvznfG69oYYMu1yl0KBbN7ILZU=;
        b=hGb0CSU5jG2/pJglLh921pt3wFeUCp4TJI24kk7Bjun0IlMRVd1MXbsyZr3QqXlVrn
         ZvYq8VAK1XIWbIy7mWhH5hu65zqnmiGEhteJNhg2KhYO8ApztOFhgWhuCzgnLjz0gxtd
         jcnvJYfzZKYWaS4mwWd3HjN8BTBczh3XsVLr2f4tpj5D5GQNARBvNXWrIS3sAQEmTWvE
         /Y2AVwQCJZn8v2864g1DJb5WnpMEieyX1mRAt3ZHWTB59HxdEpxoWeVQ46nuxk0hqWc6
         seqpu+MPcf2kdALaDJuNN7I4VIIBhcysrgXWzSD1ATmnEa/KS1qYfPPgfaUXRuETvaWw
         /mYw==
X-Gm-Message-State: ACgBeo1bQDEzUlUKhHPMXY4jKSY3SSGs0dZwLcQ8HfS714suAGGZZ1TP
        nkc29nLbhfIY6wT+ZiRYEXK1gVKAoP5WCeaO
X-Google-Smtp-Source: AA6agR7NtSoOAQ6Y0XaxWgN+XKMx+ga+WQII2xgzTFREcKw20O4PwfNVZkjRbUxWrPyABcMRNG2x6A==
X-Received: by 2002:ac8:5f8a:0:b0:35c:b90e:48c2 with SMTP id j10-20020ac85f8a000000b0035cb90e48c2mr7138831qta.9.1663240541801;
        Thu, 15 Sep 2022 04:15:41 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id b3-20020a05620a118300b006b8f4ade2c9sm3631172qkk.19.2022.09.15.04.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 04:15:40 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 198so22086593ybc.1;
        Thu, 15 Sep 2022 04:15:39 -0700 (PDT)
X-Received: by 2002:a25:e6d4:0:b0:6a8:da17:8eb7 with SMTP id
 d203-20020a25e6d4000000b006a8da178eb7mr34427524ybh.202.1663240539655; Thu, 15
 Sep 2022 04:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1663165552.git.geert+renesas@glider.be> <1224e757ec958f8b29ec66e783a7ee805c339d84.1663165552.git.geert+renesas@glider.be>
 <20220915092649.moyd6j6jm7dk6vmh@krzk-bin>
In-Reply-To: <20220915092649.moyd6j6jm7dk6vmh@krzk-bin>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Sep 2022 12:15:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqQXm66kbbKdK0O2qQFM_3oGEWEGmh4LxBZwR-PDc_Hg@mail.gmail.com>
Message-ID: <CAMuHMdWqQXm66kbbKdK0O2qQFM_3oGEWEGmh4LxBZwR-PDc_Hg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: bridge: nxp,tda998x: Convert
 to json-schema
To:     Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
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
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Krzysztof,

On Thu, Sep 15, 2022 at 10:26 AM Krzysztof Kozlowski
<k.kozlowski.k@gmail.com> wrote:
> On Wed, 14 Sep 2022 16:33:22 +0200, Geert Uytterhoeven wrote:
> > Convert the NXP TDA998x HDMI transmitter Device Tree binding
> > documentation to json-schema.
> >
> > Add missing "#sound-dai-cells" property.
> > Add ports hierarchy, as an alternative to port.
> > Drop pinctrl properties, as they do not belong here.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Add maximum to video-ports,
> >   - Drop unneeded maxItems for audio-ports,
> >   - Complete port descriptions.
> > ---
> >  .../bindings/display/bridge/nxp,tda998x.yaml  | 109 ++++++++++++++++++
> >  .../bindings/display/bridge/tda998x.txt       |  54 ---------
> >  2 files changed, 109 insertions(+), 54 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/tda998x.txt
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/patch/
>
>
> tda19988@70: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
>         arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb
>         arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb
>         arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb
>         arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb
>
> tda19988@70: ports: 'oneOf' conditional failed, one must be fixed:
>         arch/arm/boot/dts/am335x-boneblack.dtb
>         arch/arm/boot/dts/am335x-boneblack-wireless.dtb
>         arch/arm/boot/dts/am335x-sancloud-bbe.dtb
>
> tda19988@70: ports:port@0: 'reg' is a required property
>         arch/arm/boot/dts/am335x-boneblack.dtb
>         arch/arm/boot/dts/am335x-boneblack-wireless.dtb
>         arch/arm/boot/dts/am335x-sancloud-bbe.dtb
>
> tda9988@70: ports: 'oneOf' conditional failed, one must be fixed:
>         arch/arm/boot/dts/am335x-myirtech-myd.dtb
>
> tda9988@70: ports:port@0: 'reg' is a required property
>         arch/arm/boot/dts/am335x-myirtech-myd.dtb

Please test this with the earlier patches in the same series applied ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
