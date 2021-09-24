Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50409416D53
	for <lists+linux-omap@lfdr.de>; Fri, 24 Sep 2021 10:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244544AbhIXIGA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Fri, 24 Sep 2021 04:06:00 -0400
Received: from mga12.intel.com ([192.55.52.136]:37593 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244471AbhIXIF6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Sep 2021 04:05:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="203519850"
X-IronPort-AV: E=Sophos;i="5.85,319,1624345200"; 
   d="scan'208";a="203519850"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2021 01:04:04 -0700
X-IronPort-AV: E=Sophos;i="5.85,319,1624345200"; 
   d="scan'208";a="551488631"
Received: from avanhout-mobl.ger.corp.intel.com (HELO localhost) ([10.249.37.153])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2021 01:03:37 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Doug Anderson <dianders@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list\:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
        "open list\:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
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
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
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
        Martin =?utf-8?Q?J=C3=BCcker?= <martin.juecker@gmail.com>,
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
        =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Subject: Re: [PATCH v5 00/15] eDP: Support probing eDP panels dynamically instead of hardcoding
In-Reply-To: <CAD=FV=VPgFRBLgOGvt4a4afDr80aQL64L7=H3kqeRf2ffiusPg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210914202202.1702601-1-dianders@chromium.org> <CACRpkdaTb4_UfFzCqw=fiAnQhHD+1sDDua529KdGQbgMVfjYBw@mail.gmail.com> <CAD=FV=VPgFRBLgOGvt4a4afDr80aQL64L7=H3kqeRf2ffiusPg@mail.gmail.com>
Date:   Fri, 24 Sep 2021 11:03:34 +0300
Message-ID: <874kaabdt5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 20 Sep 2021, Doug Anderson <dianders@chromium.org> wrote:
> Pushed all 15 to drm-misc-next.
...
> e8de4d55c259 drm/edid: Use new encoded panel id style for quirks matching
> d9f91a10c3e8 drm/edid: Allow querying/working with the panel ID from the EDID

Hi Doug, Stan's reporting "initializer element is not constant" issues
here that were discussed before [1]. I wonder what gives, you said you'd
hit them on a draft version, but not with what was merged, and I can't
reproduce this either. Curious.

BR,
Jani.


In file included from drivers/gpu/drm/drm_edid.c:42:0:
./include/drm/drm_edid.h:525:2: error: initializer element is not constant
  ((((u32)((vend)[0]) - '@') & 0x1f) << 26 | \
  ^
drivers/gpu/drm/drm_edid.c:111:14: note: in expansion of macro ‘drm_edid_encode_panel_id’
  .panel_id = drm_edid_encode_panel_id(vend, product_id), \
	      ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/drm_edid.c:120:2: note: in expansion of macro ‘EDID_QUIRK’
  EDID_QUIRK("ACR", 44358, EDID_QUIRK_PREFER_LARGE_60),
  ^~~~~~~~~~
./include/drm/drm_edid.h:525:2: note: (near initialization for ‘edid_quirk_list[0].panel_id’)
  ((((u32)((vend)[0]) - '@') & 0x1f) << 26 | \
  ^
drivers/gpu/drm/drm_edid.c:111:14: note: in expansion of macro ‘drm_edid_encode_panel_id’
  .panel_id = drm_edid_encode_panel_id(vend, product_id), \
	      ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/drm_edid.c:120:2: note: in expansion of macro ‘EDID_QUIRK’
  EDID_QUIRK("ACR", 44358, EDID_QUIRK_PREFER_LARGE_60),
  ^~~~~~~~~~


[1] https://lore.kernel.org/all/CAD=FV=XHvFq5+Rtax7WNq2-BieQr-BM4UnmOcma_eTzkX2ZtNA@mail.gmail.com/


-- 
Jani Nikula, Intel Open Source Graphics Center
