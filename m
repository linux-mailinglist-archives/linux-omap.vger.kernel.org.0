Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D307411D18
	for <lists+linux-omap@lfdr.de>; Mon, 20 Sep 2021 19:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347328AbhITRQU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Sep 2021 13:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347492AbhITROP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Sep 2021 13:14:15 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6DEC061A4F
        for <linux-omap@vger.kernel.org>; Mon, 20 Sep 2021 09:50:01 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id 145so2872462pfz.11
        for <linux-omap@vger.kernel.org>; Mon, 20 Sep 2021 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qwTJ7Ad7zVwW8MXijFTCxqxIz/INuyLU038X6Cl8cX8=;
        b=gEpnnaWNfeGWV1YEfOrXuq+LS+LgPIPsf1DgmGFv9Am5IX4FzgUCAAz9kv6Wok3gcj
         hyqxFa0fPyvhfifyDUGVN6FUhXjQr5JBt69GUObZUMETluh34krbCh9RfSG3gJ2vz7WU
         m2sKlwAIdi+n4v1ByPZGwiF865i2wURG5Xvpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qwTJ7Ad7zVwW8MXijFTCxqxIz/INuyLU038X6Cl8cX8=;
        b=oeR4m88E7tjuuk7FsMQGPPJurv+cmjWn1/9oMMx/SM+xlwXAgazel01OshtfF3Nab9
         B2Awi6+nuvkU1RHcBZDhBClqLvWNb3r9XDikH6iEhuoZc8+Jq9zdPkeWXnHu70nNMhWz
         MKrFbkJ6LHfxXvg9Go/5qQ0h3GaNXf12vHtHTGqeqnxUtMhJEqoVAilj9SlvBOej3QnA
         nbdPV1HU0CdgcY0dVPIjUSX0KE+QcDzmzchVXa/RNAVoZHezowMv6+1/Tjs6dYnJXdct
         ++2EsIrkeuHR8EhT5kKnqUQM4J7aF8sfDOj6bB2tWrNL6eWUg7OvXWsuEpzKktkEZjWu
         d3mQ==
X-Gm-Message-State: AOAM532eRHmWGmLNRNqOfdlH57GUnBB5aW4IgHBLJq4IOTIN6vYfUkJE
        BpKaOLauGVfiABNtuvFtCy9N7W6ALZS/6w==
X-Google-Smtp-Source: ABdhPJwCKib4OZ+XbWTB/heQxuwA6t3xW2Rxkx9xumnJ84T+t0A20s7TgsHdMY4uJ1tx4iTgylnoRw==
X-Received: by 2002:a63:894a:: with SMTP id v71mr15497636pgd.13.1632156600355;
        Mon, 20 Sep 2021 09:50:00 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id x24sm5701131pge.85.2021.09.20.09.49.59
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 09:49:59 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id e7so17977069pgk.2
        for <linux-omap@vger.kernel.org>; Mon, 20 Sep 2021 09:49:59 -0700 (PDT)
X-Received: by 2002:a05:6e02:1847:: with SMTP id b7mr18604550ilv.180.1632156161095;
 Mon, 20 Sep 2021 09:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210914202202.1702601-1-dianders@chromium.org> <CACRpkdaTb4_UfFzCqw=fiAnQhHD+1sDDua529KdGQbgMVfjYBw@mail.gmail.com>
In-Reply-To: <CACRpkdaTb4_UfFzCqw=fiAnQhHD+1sDDua529KdGQbgMVfjYBw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 20 Sep 2021 09:42:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VPgFRBLgOGvt4a4afDr80aQL64L7=H3kqeRf2ffiusPg@mail.gmail.com>
Message-ID: <CAD=FV=VPgFRBLgOGvt4a4afDr80aQL64L7=H3kqeRf2ffiusPg@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Corentin Labbe <clabbe@baylibre.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Fabio Estevam <festevam@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lionel Debieve <lionel.debieve@st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?Q?Martin_J=C3=BCcker?= <martin.juecker@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Walle <michael@walle.cc>,
        NXP Linux Team <linux-imx@nxp.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Nishanth Menon <nm@ti.com>,
        Olivier Moysan <olivier.moysan@st.com>,
        Otavio Salvador <otavio@ossystems.com.br>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Razvan Stefanescu <razvan.stefanescu@microchip.com>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Tony Lindgren <tony@atomide.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Will Deacon <will@kernel.org>,
        William Cohen <wcohen@redhat.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-sunxi@lists.linux.dev,
        linux-tegra <linux-tegra@vger.kernel.org>,
        =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Tue, Sep 14, 2021 at 3:12 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Sep 14, 2021 at 10:22 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> > Version 5 of this series just fixes the panel ID encode macro to be
> > cleaner and adds Jani's review tags.
> >
> > It could possibly be ready to land?
>
> Definitely IMO, the kernel look so much better after this change,
> so for the series:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Pushed all 15 to drm-misc-next.

5540cf8f3e8d drm/panel-edp: Implement generic "edp-panel"s probed by EDID
24e27de11560 drm/panel-edp: Don't re-read the EDID every time we power
off the panel
a64ad9c3e4a5 drm/panel-edp: Fix "prepare_to_enable" if panel doesn't handle HPD
c46a4cc1403e drm/panel-edp: hpd_reliable shouldn't be subtraced from hpd_absent
52824ca4502d drm/panel-edp: Better describe eDP panel delays
9ea10a500045 drm/panel-edp: Split the delay structure out
b6d5ffce11dd drm/panel-simple: Non-eDP panels don't need "HPD" handling
3fd68b7b13c2 drm/panel-edp: Move some wayward panels to the eDP driver
5f04e7ce392d drm/panel-edp: Split eDP panels out of panel-simple
c0c11c70a6d0 arm64: defconfig: Everyone who had PANEL_SIMPLE now gets PANEL_EDP
310720875efa ARM: configs: Everyone who had PANEL_SIMPLE now gets PANEL_EDP
e8de4d55c259 drm/edid: Use new encoded panel id style for quirks matching
d9f91a10c3e8 drm/edid: Allow querying/working with the panel ID from the EDID
bac9c2948224 drm/edid: Break out reading block 0 of the EDID
29145a566873 dt-bindings: drm/panel-simple-edp: Introduce generic eDP panels

-Doug
