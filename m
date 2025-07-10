Return-Path: <linux-omap+bounces-4080-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B7B00A5A
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 19:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16F1E1C82DBE
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 17:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14DE2F0C73;
	Thu, 10 Jul 2025 17:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rHxaP2Qp"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776CB199BC;
	Thu, 10 Jul 2025 17:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169724; cv=none; b=cVeK5kGH3ad93aBKbWH90BIOEEbm1XQCoy0lq6bcw+LeV3tiiK5p7u/xLwyeS8t01/mU2pDrl8ZNtbUw3CLBfNsyyEG71YyKu90Fyei8LsYvYv7j8ay6iqM1G4qWyjV55N8pWcZXseWbD5xkcRKnsojtyKWxu84IDvwlrMAJZMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169724; c=relaxed/simple;
	bh=erMDztuHzz1g+ThQgvQ6DzyHHeS4xUVijKItdgCHXSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j2XIL0LGWrLCyFBNor8TmeTISMhj8Aq7eXAr4Tk0EiL03ELIgXrb6TEX6CnAJqx9JSDWsKJWhQFvRcBUIaEnPrlgVfqT2tD62kZewlK2cFtpy6zVpJqSe4HPBzmRZWcuI4D79Wu2PaaTp8dv15J6GC6paEW403rivYoRhArzVpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rHxaP2Qp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B51DB3DC;
	Thu, 10 Jul 2025 19:48:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169690;
	bh=erMDztuHzz1g+ThQgvQ6DzyHHeS4xUVijKItdgCHXSg=;
	h=From:To:Cc:Subject:Date:From;
	b=rHxaP2QpQOFu+ipRyJU5SEAsBavHeI/QtAXwqV5IYScemKDGa8y8/ffO+XG8ZOpTU
	 Dk7eIuO7XnTylg07hyoe4D/CiSKABT3hgebmfk6urfLWAK7tS43vu6/wRmIuZz02/C
	 ga1AwrEvFCiS/zbneAi3wjyBBvqKg1o0h7oWfAjo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hao Yao <hao.yao@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Jason Chen <jason.z.chen@intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Todor Tomov <todor.too@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tony Lindgren <tony@atomide.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 00/72] media: i2c: Reduce cargo-cult
Date: Thu, 10 Jul 2025 20:46:56 +0300
Message-ID: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series build on top of Mehdi's introduction of the
devm_v4l2_sensor_clk_get() helper (see [1]) to drastically reduce
cargo-cult in camera sensor drivers.

A large number of camera sensor drivers directly use the
"clock-frequency" property to retrieve the effective or desired external
clock rate. This is standard behaviour on ACPI platforms that don't
implement MIPI DisCo for Imaging, but usage of the property has leaked
to OF-based platforms, due to a combination of historical reasons (using
"clock-frequency" was initially considered right until before the
introduction of "assigned-clock-rates") and plain cargo-cult.

A large number of camera sensor drivers also set the rate of the
external clock with clk_set_rate(). This behaviour is also fine on ACPI
platforms, and has also leaked to OF-based platforms for the same
reasons.

Mehdi's "[PATCH v2 00/48] media: Add a helper for obtaining the clock
producer" series improves the situation by centralizing clock handling
for camera sensor in one helper function that implements the correct
behaviour for all types of platforms (and should later allow support of
MIPI DisCo for Imaging transparently for camera sensor drivers). It
doesn't however address direct access of the "clock-frequency" property
or direct calls to clk_set_rate() in drivers.

This series builds on top of the new helper to replace manual handling
of the clock frequency in camera sensor drivers. It starts by addressing
the DT bindings and reprecating the clock-frequency property for camera
sensor drivers in all YAML bindings (01/72) and in the et8ek8 text
bindings (02/72). After that, patches 03/72 and 04/72 make the clocks
property mandatory in the two camera sensor DT bindings that specified
it as optional. Finally for the DT side, patches 05/72 to 14/72 replace
clock-frequency with assigned-clock-rates, or drops the property
altogether when the source clock has a fixed rate. This aligns the DT
bindings and device tree sources to the current recommended practice.

After that, the next 5 patches are assorted drive-by changes. Patch
15/72 drops an unused header the belonged to a long gone driver, and
patch 17/72 drops unusued support for platform data in the mt9v032
driver. Patch 18/72 is the first that addresses clock rate handling by
dropping unneeded clock rate setting in the mt9v111 driver. Patch 19/72
takes a harsher approach for the ov6650 by dropping the driver
completely as the driver hasn't been used since v5.9.

The next part of the series replaces manual clock rate handling with
usage of the devm_v4l2_sensor_clk_get() helper in a large number of
camera sensor drivers that implement clock rate handling in a standard
way. This is done in patches 20/72 to 54/72. This interleaves the clock
rate handling changes with drive-by refactoring (in separate patches) to
make the code easier to deal with.

The final part of the series addresses the remaining drivers that
implement non-standard behaviours. It starts in 55/72 by adding a new
devm_v4l2_sensor_clk_get_legacy() helper function for those drivers,
similar to devm_v4l2_sensor_clk_get() but with a few more quirks. This
function should not be used in any new driver. The remaining patches,
from 53/72 to 72/72, use the new helper in drivers, interleaved with
drive-by refactoring similarly to the previous part.

Before this series, with Mehdi's series applied, 29 drivers read the
"clock-frequency" property and 18 drivers set the external clock rate.
With these series we go down to 1 and 3 respectively, namely the ccs,
mt9p031 and mt9v032 drivers. Clock handling in the CCS driver is a bit
more convoluted so I will leave to Sakari the honour of dropping the
last direct user of "clock-frequency" :-) As for the mt9p031 and mt9v032
driver, addressing the issue there is more difficult and likely not
worth it.

[1] https://lore.kernel.org/linux-media/cover.1750942967.git.mehdi.djait@linux.intel.com

Laurent Pinchart (72):
  dt-bindings: media: Deprecate clock-frequency property for camera
    sensors
  dt-bindings: media: et8ek8: Deprecate clock-frequency property
  dt-bindings: media: imx258: Make clocks property required
  dt-bindings: media: imx274: Make clocks property required
  ARM: dts: nxp: imx6qdl-pico: Replace clock-frequency in camera sensor
    node
  ARM: dts: nxp: imx6qdl-wandboard: Replace clock-frequency in camera
    sensor node
  ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in camera
    sensor node
  ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in camera
    sensor node
  ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor
    node
  ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor
    node
  ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor node
  arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace
    clock-frequency in camera sensor node
  arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Drop
    clock-frequency from camera sensor node
  arm64: dts: renesas: rzg2l-smarc: Drop clock-frequency from camera
    sensor node
  media: i2c: mt9v022: Drop unused mt9v022.h header
  media: i2c: mt9v032: Replace client->dev usage
  media: i2c: mt9v032: Drop support for platform data
  media: i2c: mt9v111: Do not set clock rate manually
  media: i2c: ov6650: Drop unused driver
  media: i2c: hi556: Replace client->dev usage
  media: i2c: hi556: Use V4L2 sensor clock helper
  media: i2c: hi847: Replace client->dev usage
  media: i2c: hi847: Use V4L2 sensor clock helper
  media: i2c: imx208: Replace client->dev usage
  media: i2c: imx208: Use V4L2 sensor clock helper
  media: i2c: imx319: Replace client->dev usage
  media: i2c: imx319: Use V4L2 sensor clock helper
  media: i2c: imx355: Replace client->dev usage
  media: i2c: imx335: Use V4L2 sensor clock helper
  media: i2c: og01a1b: Replace client->dev usage
  media: i2c: og01a1b: Use V4L2 sensor clock helper
  media: i2c: ov02c10: Replace client->dev usage
  media: i2c: ov02c10: Use V4L2 sensor clock helper
  media: i2c: ov02e10: Replace client->dev usage
  media: i2c: ov02e10: Use V4L2 sensor clock helper
  media: i2c: ov08d10: Replace client->dev usage
  media: i2c: ov08d10: Use V4L2 sensor clock helper
  media: i2c: ov08x40: Replace client->dev usage
  media: i2c: ov08x40: Use V4L2 sensor clock helper
  media: i2c: ov13858: Replace client->dev usage
  media: i2c: ov13858: Use V4L2 sensor clock helper
  media: i2c: ov13b10: Replace client->dev usage
  media: i2c: ov13b10: Use V4L2 sensor clock helper
  media: i2c: ov2740: Replace client->dev usage
  media: i2c: ov2740: Use V4L2 sensor clock helper
  media: i2c: ov4689: Use V4L2 sensor clock helper
  media: i2c: ov5670: Replace client->dev usage
  media: i2c: ov5670: Use V4L2 sensor clock helper
  media: i2c: ov5675: Replace client->dev usage
  media: i2c: ov5675: Use V4L2 sensor clock helper
  media: i2c: ov5693: Use V4L2 sensor clock helper
  media: i2c: ov7251: Use V4L2 sensor clock helper
  media: i2c: ov9734: Replace client->dev usage
  media: i2c: ov9734: Use V4L2 sensor clock helper
  media: v4l2-common: Add legacy camera sensor clock helper
  media: i2c: et8ek8: Drop support for per-mode external clock frequency
  media: i2c: et8ek8: Use V4L2 legacy sensor clock helper
  media: i2c: gc05a2: Use V4L2 legacy sensor clock helper
  media: i2c: gc08a3: Use V4L2 legacy sensor clock helper
  media: i2c: imx258: Replace client->dev usage
  media: i2c: imx258: Use V4L2 legacy sensor clock helper
  media: i2c: imx290: Use V4L2 legacy sensor clock helper
  media: i2c: ov02a10: Replace client->dev usage
  media: i2c: ov02a10: Use V4L2 legacy sensor clock helper
  media: i2c: ov2685: Use V4L2 legacy sensor clock helper
  media: i2c: ov5645: Use V4L2 legacy sensor clock helper
  media: i2c: ov5695: Use V4L2 legacy sensor clock helper
  media: i2c: ov8856: Replace client->dev usage
  media: i2c: ov8856: Use V4L2 legacy sensor clock helper
  media: i2c: s5c73m3: Use V4L2 legacy sensor clock helper
  media: i2c: s5k5baf: Use V4L2 legacy sensor clock helper
  media: i2c: s5k6a3: Use V4L2 legacy sensor clock helper

 .../admin-guide/media/i2c-cardlist.rst        |    1 -
 .../bindings/media/i2c/mipi-ccs.yaml          |    7 +-
 .../bindings/media/i2c/ovti,ov02a10.yaml      |    3 +-
 .../bindings/media/i2c/ovti,ov5645.yaml       |    6 +-
 .../bindings/media/i2c/ovti,ov7251.yaml       |    6 +-
 .../bindings/media/i2c/ovti,ov8856.yaml       |    3 +-
 .../bindings/media/i2c/samsung,s5k5baf.yaml   |    6 +-
 .../bindings/media/i2c/samsung,s5k6a3.yaml    |    6 +-
 .../bindings/media/i2c/sony,imx258.yaml       |    1 +
 .../bindings/media/i2c/sony,imx274.yaml       |    4 +
 .../bindings/media/i2c/sony,imx290.yaml       |    5 +-
 .../bindings/media/i2c/toshiba,et8ek8.txt     |    8 +-
 MAINTAINERS                                   |    1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi   |    5 +-
 .../boot/dts/nxp/imx/imx6qdl-wandboard.dtsi   |    5 +-
 .../arm/boot/dts/samsung/exynos4210-i9100.dts |    5 +-
 .../boot/dts/samsung/exynos4412-midas.dtsi    |    5 +-
 arch/arm/boot/dts/ti/omap/omap3-n9.dts        |    5 +-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts      |    3 +-
 arch/arm/boot/dts/ti/omap/omap3-n950.dts      |    5 +-
 .../sdm845-db845c-navigation-mezzanine.dtso   |    3 +-
 .../aistarvision-mipi-adapter-2.1.dtsi        |    1 -
 .../dts/renesas/rz-smarc-cru-csi-ov5645.dtsi  |    1 -
 drivers/media/i2c/Kconfig                     |   10 +-
 drivers/media/i2c/Makefile                    |    1 -
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |   27 +-
 drivers/media/i2c/et8ek8/et8ek8_mode.c        |    9 -
 drivers/media/i2c/et8ek8/et8ek8_reg.h         |    1 -
 drivers/media/i2c/gc05a2.c                    |    8 +-
 drivers/media/i2c/gc08a3.c                    |    8 +-
 drivers/media/i2c/hi556.c                     |   92 +-
 drivers/media/i2c/hi847.c                     |   84 +-
 drivers/media/i2c/imx208.c                    |   91 +-
 drivers/media/i2c/imx258.c                    |  105 +-
 drivers/media/i2c/imx290.c                    |   27 +-
 drivers/media/i2c/imx319.c                    |   92 +-
 drivers/media/i2c/imx355.c                    |   90 +-
 drivers/media/i2c/mt9v032.c                   |  104 +-
 drivers/media/i2c/mt9v111.c                   |    2 -
 drivers/media/i2c/og01a1b.c                   |  103 +-
 drivers/media/i2c/ov02a10.c                   |   45 +-
 drivers/media/i2c/ov02c10.c                   |  107 +-
 drivers/media/i2c/ov02e10.c                   |  105 +-
 drivers/media/i2c/ov08d10.c                   |   82 +-
 drivers/media/i2c/ov08x40.c                   |   95 +-
 drivers/media/i2c/ov13858.c                   |   69 +-
 drivers/media/i2c/ov13b10.c                   |  110 +-
 drivers/media/i2c/ov2685.c                    |    8 +-
 drivers/media/i2c/ov2740.c                    |   91 +-
 drivers/media/i2c/ov4689.c                    |   12 +-
 drivers/media/i2c/ov5645.c                    |   13 +-
 drivers/media/i2c/ov5670.c                    |  105 +-
 drivers/media/i2c/ov5675.c                    |   89 +-
 drivers/media/i2c/ov5693.c                    |   16 +-
 drivers/media/i2c/ov5695.c                    |    8 +-
 drivers/media/i2c/ov6650.c                    | 1147 -----------------
 drivers/media/i2c/ov7251.c                    |   26 +-
 drivers/media/i2c/ov8856.c                    |   93 +-
 drivers/media/i2c/ov9734.c                    |   82 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |   15 +-
 drivers/media/i2c/s5c73m3/s5c73m3.h           |    2 -
 drivers/media/i2c/s5k5baf.c                   |   19 +-
 drivers/media/i2c/s5k6a3.c                    |   17 +-
 drivers/media/v4l2-core/v4l2-common.c         |   39 +-
 include/media/i2c/mt9v022.h                   |   13 -
 include/media/i2c/mt9v032.h                   |   12 -
 include/media/v4l2-common.h                   |   41 +-
 67 files changed, 1031 insertions(+), 2379 deletions(-)
 delete mode 100644 drivers/media/i2c/ov6650.c
 delete mode 100644 include/media/i2c/mt9v022.h
 delete mode 100644 include/media/i2c/mt9v032.h


base-commit: 95703a099e094c00a0714f4d6fa6d9f142ff3fda
prerequisite-patch-id: f9a80c958fab645e237a47c8e3bc19268fe699a0
prerequisite-patch-id: d058d644effe1953c742f6f0c7dd7692c61c733c
prerequisite-patch-id: 7b42fb0bc003a3857d332d404e935c01e917d73b
prerequisite-patch-id: d9b48f03a77c0fe88e60cf88256a395944b99810
prerequisite-patch-id: 9545c613887ee00591c30147553ac785703419e7
prerequisite-patch-id: 43ab82f52c5038df96167d26d63cd838a2d8eb58
prerequisite-patch-id: 182a9155342a92026b0da69532eaac966e2cd7be
prerequisite-patch-id: 2f9595bda17ce11348420cad7e446bc96b79b7e6
prerequisite-patch-id: 5e6e13044a003e00340c29539376d69e6bc1849c
prerequisite-patch-id: 32fcb56cf75ea45ff7cc556839ddbaffda509026
prerequisite-patch-id: 961a751cff6f39f6adad4e03a6dda045ccf42177
prerequisite-patch-id: 8b60d2f5b1e70480a9e6d2177f743a577db6e3ba
prerequisite-patch-id: 8ec9ba9f786d2f33e8b452bd380185351d1d97e1
prerequisite-patch-id: 24683271a88f01fef004788121ed0b0d610079e6
prerequisite-patch-id: f3bc82c9657b3bcdd81703a82efe90a39e598053
prerequisite-patch-id: 493444e38f6b82e080fec5f0e7f63fd95daca8c0
prerequisite-patch-id: 82f6ac141be65b812f142fb0e06f4501be9dc144
prerequisite-patch-id: e75c59c8eccf0248f5c8a9ba6cae398148a8d361
prerequisite-patch-id: 46aff7d253a16ebdc64dd4cb3b30f031579c3053
prerequisite-patch-id: 57e9cabf0ce8bda498fe2f16db6dd4a9d748d2fd
prerequisite-patch-id: 23781810738fe92eb26cb67ba16f554f58a6f2e4
prerequisite-patch-id: 3c82cca940d393e6ef78b79d7e065dbc62f03be9
prerequisite-patch-id: 52f23cc4ccfc514c7d24e9ac52ac537ba2256a51
prerequisite-patch-id: 2914df66fa49278e9163df769a810142652571b9
prerequisite-patch-id: a7d5dc1aa489556bdcd92d66d9ea78741a9a5d5c
prerequisite-patch-id: ac630eb405db2ea63c8ce3d037d0fa1ba635a397
prerequisite-patch-id: a4ea26b410045f28858d860bc382f6ec976be6d6
prerequisite-patch-id: 8e05fa6d4b7f0ae3feb21a8cfba71bf119d7ad8c
prerequisite-patch-id: e2db4be18a1c859947c90253b462b5d50611a4be
prerequisite-patch-id: 0fa8b8720b573929806bd35e3edc51f0544237ff
prerequisite-patch-id: 69f5743bca8d89adc28a35f3461d1c87e071e671
prerequisite-patch-id: 3076e3da660a8eef7f6f6dafb5fdd2bc2c83d754
prerequisite-patch-id: 09230d2fca61e552cc845242ed326b8eaf3514a4
prerequisite-patch-id: 63f0dc4815777b5005046c90c3fb1fe8ceb88664
prerequisite-patch-id: 012483569daea09f783c6f9a7c5c49bebb8959b0
prerequisite-patch-id: 7fe0df4335963fbf03535080ad24a4b31381c298
prerequisite-patch-id: e0b1ca15da78cb7c2acf58c6649cc26a2901ca28
prerequisite-patch-id: 8cc20810597925a8a0e52f7ed58e821c035244bf
prerequisite-patch-id: 4338a1728052ff14c029330de8f5efa65a69b3aa
prerequisite-patch-id: 198fd889e6f81ff249e56dd1a099cdf2527aef1f
prerequisite-patch-id: 9a6bef3b3dcf639f83b1255e639c99fb71f19008
prerequisite-patch-id: 57ccbadda2f33f6883289444ed7a3dbefaa9687d
prerequisite-patch-id: 9fa098d9e2757f54a616d1e7568a19f29d638d7a
prerequisite-patch-id: ef328feb7636c96629f030601b9ee950b4d62a42
prerequisite-patch-id: f9e70cc31c525d4344fc9e6e54ff2e1e3f5d80d0
prerequisite-patch-id: 9f1a026d73ac5fe39f8799915cf013843bd216aa
prerequisite-patch-id: 692b78c72fbe969fa8903982ebd6da61bd598550
prerequisite-patch-id: 2acccc54dd0fdeee252ba8eafbc16dd9a5cab0c1
-- 
Regards,

Laurent Pinchart


