Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7096C40B8F5
	for <lists+linux-omap@lfdr.de>; Tue, 14 Sep 2021 22:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233831AbhINUXh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Sep 2021 16:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233778AbhINUXf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Sep 2021 16:23:35 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D04EBC0613C1
        for <linux-omap@vger.kernel.org>; Tue, 14 Sep 2021 13:22:17 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id t4so212659plo.0
        for <linux-omap@vger.kernel.org>; Tue, 14 Sep 2021 13:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=29glUktI+TgFcu0s/snTaCZqtPLPWr2Rvd/8CIHFfUI=;
        b=cfcIKIVYpE12XwL7GHkvoewGDjTUKq7LX1i1W01aOLR2X0kcbmmtIty6rTJxAE+UtB
         EXZxeVBBlW0eOxly76fpGdXjzLRCH4txhTigfbfrX8f/zh/8A7hgaqNAM5UUtMVWefkw
         ptV8EFOYK9tU6rzbt9T1ncBVfQuDJ/F5eB0Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=29glUktI+TgFcu0s/snTaCZqtPLPWr2Rvd/8CIHFfUI=;
        b=cQfzGlIegkZYxHcwyiBBgKN4J6qvHx4ehRRRjeMS+WuFO8+LLe5jci5sopi2xk2Ccq
         NC0bbahM4vj9E7X5Oh66m+NKw+GEaTnoSPJG8UxqJJ1066zjkOpQ/gqXwp726DAr66bZ
         dlwjEbDFLZsT3BdYIOnWxuBWrYNsyFmce2UzynIQdw8+eNIRULvYPw76hT7eB4tdFwYr
         fhZgByl4/FyddYn0Z6KyUbnNKw6JDGgFW0A6qCOSWPKxZxUDH+Dv+C7V2OlVL3fH44ax
         U3JBT6F2+uvrK/xz/jpdhohiztNPDrkEJ3w4CD+DCUvqhjXvB9k0RlPyAFn0co7sUPee
         KVGQ==
X-Gm-Message-State: AOAM5334ZygnrvFnkKjb1MUTYt/XG2THqVl5ywlY8ODL2lfAGsSNbTX4
        M51lzg35bxUss4GBCownP/mO1A==
X-Google-Smtp-Source: ABdhPJy2EEe19ESWg5bxUnradbRUCA2EQ+Ty9mf2FrxoWf30CMjk9tPMo/WXlF/y4jzWF/N4QIc6ZA==
X-Received: by 2002:a17:902:9682:b0:138:e2f9:720d with SMTP id n2-20020a170902968200b00138e2f9720dmr16562742plp.57.1631650937237;
        Tue, 14 Sep 2021 13:22:17 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f38f:9d0f:3eba:f8c4])
        by smtp.gmail.com with ESMTPSA id 141sm12185393pgg.16.2021.09.14.13.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 13:22:16 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
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
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
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
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH v5 00/15] eDP: Support probing eDP panels dynamically instead of hardcoding
Date:   Tue, 14 Sep 2021 13:21:47 -0700
Message-Id: <20210914202202.1702601-1-dianders@chromium.org>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The goal of this patch series is to move away from hardcoding exact
eDP panels in device tree files. As discussed in the various patches
in this series (I'm not repeating everything here), most eDP panels
are 99% probable and we can get that last 1% by allowing two "power
up" delays to be specified in the device tree file and then using the
panel ID (found in the EDID) to look up additional power sequencing
delays for the panel.

This patch series is the logical contiunation of a previous patch
series where I proposed solving this problem by adding a
board-specific compatible string [1]. In the discussion that followed
it sounded like people were open to something like the solution
proposed in this new series.

In version 2 I got rid of the idea that we could have a "fallback"
compatible string that we'd use if we didn't recognize the ID in the
EDID. This simplifies the bindings a lot and the implementation
somewhat. As a result of not having a "fallback", though, I'm not
confident in transitioning any existing boards over to this since
we'll have to fallback to very conservative timings if we don't
recognize the ID from the EDID and I can't guarantee that I've seen
every panel that might have shipped on an existing product. The plan
is to use "edp-panel" only on new boards or new revisions of old
boards where we can guarantee that every EDID that ships out of the
factory has an ID in the table.

Version 3 of this series now splits out all eDP panels to their own
driver and adds the generic eDP panel support to this new driver. I
believe this is what Sam was looking for [2].

Version 4 of this series is mostly small fixes / renames from review
feedback. It's largely the same as v3. Other than naming /
description / comment changes, the differences are:
- Dropped the MIPS config patch as per request.
- Reorder config patches first.
- Added a new patch to use the panel ID scheme for quirks.
- Landed the reorder of logicpd_type_28 / mitsubishi_aa070mc01

Version 5 of this series just fixes the panel ID encode macro to be
cleaner and adds Jani's review tags.

It could possibly be ready to land?

[1] https://lore.kernel.org/r/YFKQaXOmOwYyeqvM@google.com/
[2] https://lore.kernel.org/r/YRTsFNTn%2FT8fLxyB@ravnborg.org/

Changes in v5:
- Prettier encode panel ID function (thanks Andrzej!)
- Probable => Probeable

Changes in v4:
- "u8 *edid" => "void *edid" to avoid cast.
- ("Use new encoded panel id style for quirks matching") new for v4.
- Don't put kmalloc() in the "if" test even if the old code did.
- Don't refer to "panel-simple" in commit message.
- PANEL_SIMPLE_EDP => PANEL_EDP
- Remove "non-eDP" in panel-simple description.
- Reordered config patches to be before code patch
- decode_edid_id() => drm_edid_decode_panel_id()
- drm_do_get_edid_blk0() => drm_do_get_edid_base_block()
- drm_get_panel_id() => drm_edid_get_panel_id()
- encode_edid_id() => drm_edid_encode_panel_id()
- panel-simple-edp => panel-edp
- split panel id extraction out to its own function.

Changes in v3:
- ("Better describe eDP panel delays") new for v3.
- ("Don't re-read the EDID every time") moved to eDP only patch.
- ("Non-eDP panels don't need "HPD" handling") new for v3.
- Add AUO B116XAN06.1 to table.
- Add Sharp LQ116M1JW10 to table.
- Adjust endianness of product ID.
- Change init order to we power at the end.
- Decode hex product ID w/ same endianness as everyone else.
- Fallback to conservative delays if panel not recognized.
- Fix "prepare_to_enable" patch new for v3.
- Generic "edp-panel" handled by the eDP panel driver now.
- Move wayward panels patch new for v3.
- Rename delays more generically so they can be reused.
- Split eDP panels patch new for v3.
- Split the delay structure out patch just on eDP now.

Changes in v2:
- Add "-ms" suffix to delays.
- Don't support a "fallback" panel. Probed panels must be probed.
- No longer allow fallback to panel-simple.
- Not based on patch to copy "desc"--just allocate for probed panels.

Douglas Anderson (15):
  dt-bindings: drm/panel-simple-edp: Introduce generic eDP panels
  drm/edid: Break out reading block 0 of the EDID
  drm/edid: Allow querying/working with the panel ID from the EDID
  drm/edid: Use new encoded panel id style for quirks matching
  ARM: configs: Everyone who had PANEL_SIMPLE now gets PANEL_EDP
  arm64: defconfig: Everyone who had PANEL_SIMPLE now gets PANEL_EDP
  drm/panel-edp: Split eDP panels out of panel-simple
  drm/panel-edp: Move some wayward panels to the eDP driver
  drm/panel-simple: Non-eDP panels don't need "HPD" handling
  drm/panel-edp: Split the delay structure out
  drm/panel-edp: Better describe eDP panel delays
  drm/panel-edp: hpd_reliable shouldn't be subtraced from hpd_absent
  drm/panel-edp: Fix "prepare_to_enable" if panel doesn't handle HPD
  drm/panel-edp: Don't re-read the EDID every time we power off the
    panel
  drm/panel-edp: Implement generic "edp-panel"s probed by EDID

 .../bindings/display/panel/panel-edp.yaml     |  188 ++
 arch/arm/configs/at91_dt_defconfig            |    1 +
 arch/arm/configs/exynos_defconfig             |    1 +
 arch/arm/configs/imx_v6_v7_defconfig          |    1 +
 arch/arm/configs/lpc32xx_defconfig            |    1 +
 arch/arm/configs/multi_v5_defconfig           |    1 +
 arch/arm/configs/multi_v7_defconfig           |    1 +
 arch/arm/configs/omap2plus_defconfig          |    1 +
 arch/arm/configs/qcom_defconfig               |    1 +
 arch/arm/configs/realview_defconfig           |    1 +
 arch/arm/configs/sama5_defconfig              |    1 +
 arch/arm/configs/shmobile_defconfig           |    1 +
 arch/arm/configs/sunxi_defconfig              |    1 +
 arch/arm/configs/tegra_defconfig              |    1 +
 arch/arm/configs/versatile_defconfig          |    1 +
 arch/arm/configs/vexpress_defconfig           |    1 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/gpu/drm/drm_edid.c                    |  280 ++-
 drivers/gpu/drm/panel/Kconfig                 |   16 +-
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-edp.c             | 1895 +++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          | 1072 +---------
 include/drm/drm_edid.h                        |   45 +
 23 files changed, 2351 insertions(+), 1162 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-edp.c

-- 
2.33.0.309.g3052b89438-goog

