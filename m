Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26CC0405E55
	for <lists+linux-omap@lfdr.de>; Thu,  9 Sep 2021 23:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346228AbhIIVCf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Sep 2021 17:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346024AbhIIVCe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Sep 2021 17:02:34 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D542EC061760
        for <linux-omap@vger.kernel.org>; Thu,  9 Sep 2021 14:01:19 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id k24so3104616pgh.8
        for <linux-omap@vger.kernel.org>; Thu, 09 Sep 2021 14:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TgYZsymCmqy6vs2OAQuoPF75DcvJ7dTHyXuxA0yEqwQ=;
        b=l3z9MTSjdnlmhP5mE7FA5iEXUZFoTQXDdRHC+RW4FVdcmwc4PenpU06QOYEENGQV7u
         G2ulyEeNyekNayLflnSI2V4wHKdy9EH9yUa50gYrRaW6weQ6+jrhJXV2earkNzZQ2rFB
         KtCzrZPvcxxigSjMFri/KLpVSnvl/0QKhpJOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TgYZsymCmqy6vs2OAQuoPF75DcvJ7dTHyXuxA0yEqwQ=;
        b=6/welhVhd0wg1XgQqaPafiB5c4pyN4dZgj8EIHGl39yrpE3CZlCRBRyqV16JHYop1O
         3CvQXXDzGjQMIMX+TgZWe3jz4KfzbI/WGJqyOR7SAKb0kwt7SDsfBoZe65cJi0/O48YQ
         4yFtbx3u9MEGIgs0Zx4EE4FZ9PpRKWiqk+Hm8EPXTutvvHDo11NVptNf3A9Y2/9chV/C
         z5v9FOoeJNpsr5gib57KUEC4+CZHEiBN2j9iPC4FyF0tKjRWkN0k9A7HFlwSQhliFVWy
         ywcVvYGU1xxMrfXGyNpGV1jKaol8tHRlI9VukBrIRvIEsBBDmFw9CfPXKTWK6LhbFNAg
         JWCg==
X-Gm-Message-State: AOAM5334ZZ1uuuW6axqz/JV1/Evj/MiTD1IBYA76Gh3Rmp08wW7r4F0M
        t99kZsP9pV43p3kZEvDbbSQ7PQ==
X-Google-Smtp-Source: ABdhPJzNYdLP54ZPrpCmZ3ORzDC7zdYKwrZ7BBoTmjOUbsHF+UzEN4SItH8EnPA93NK8fIF0hPxZ7g==
X-Received: by 2002:a63:9a19:: with SMTP id o25mr4440039pge.61.1631221279054;
        Thu, 09 Sep 2021 14:01:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:8da3:b0fb:4261:2c10])
        by smtp.gmail.com with ESMTPSA id l143sm177069pfd.60.2021.09.09.14.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 14:01:18 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
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
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
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
        Olof Johansson <olof@lixom.net>,
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH v4 00/15] eDP: Support probing eDP panels dynamically instead of hardcoding
Date:   Thu,  9 Sep 2021 14:00:16 -0700
Message-Id: <20210909210032.465570-1-dianders@chromium.org>
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
It could possibly be ready to land?

[1] https://lore.kernel.org/r/YFKQaXOmOwYyeqvM@google.com/
[2] https://lore.kernel.org/r/YRTsFNTn%2FT8fLxyB@ravnborg.org/

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
 drivers/gpu/drm/drm_edid.c                    |  281 ++-
 drivers/gpu/drm/panel/Kconfig                 |   16 +-
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-edp.c             | 1896 +++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          | 1072 +---------
 include/drm/drm_edid.h                        |   47 +
 23 files changed, 2355 insertions(+), 1162 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-edp.c

-- 
2.33.0.309.g3052b89438-goog

