Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F416D209F1F
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jun 2020 15:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404709AbgFYNHs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jun 2020 09:07:48 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:30389 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403941AbgFYNHr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Jun 2020 09:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1593090461;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=bq07qeCy6qFD4ovjWBYuQCHApJ5NyrvJvRdANy8qgeE=;
        b=M65gpaKfYAmCvZfolUiT1HMQh7DmVVRCnXnTZWuLU/iZPWrg+/2a5pGdvgGLEO1tHV
        vQMvk1SX+LOewbYu8D4oFu+LcsiDTimzhlvcmxi0ObJMD8JJdkSh12MDXDagzJp9vjEU
        Fl7sCUFEEX0JRx8PpXs5exI6tv5ifWa4yag/E+820vTJPS7STZmUHGlFcK33f2YCMo6n
        iUtbzNOSly1gA10Jb3Gi9eP2cSAHkGIXzLrB6DxTwj9Dy+akfMqqI1U5/G48V/yU8V1E
        F3V7EKyQeAQGzxDRdZ6kULU0xDrWBTJcvy63obIpJM7MrcT5eIXr9hsCqMyB839iJbhy
        qkAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDleUXAxh"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w5PD7J9cW
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 25 Jun 2020 15:07:19 +0200 (CEST)
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi and drm_panel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
Date:   Thu, 25 Jun 2020 15:07:19 +0200
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Rob Herring <robh@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        kernel@collabora.com, kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, David Shah <dave@ds0.me>
Content-Transfer-Encoding: quoted-printable
Message-Id: <45C9C8F9-945C-4A16-BE1D-263F8D801B39@goldelico.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

> Am 25.02.2020 um 00:20 schrieb Sebastian Reichel =
<sebastian.reichel@collabora.com>:
>=20
> This updates the existing omapdrm DSI code, so that it uses
> common drm_mipi_dsi API and drm_panel.
>=20
> The patchset has been tested with Droid 4 using Linux console, X.org =
and
> Weston. The patchset is based on Laurent Pinchartl's patch series [0]
> and removes the last custom panel driver, so quite a few cleanups on =
the
> omapdrm codebase were possible.
>=20
> [0] [PATCH v7 00/54] drm/omap: Replace custom display drivers with =
drm_bridge and drm_panel
>    =
https://lore.kernel.org/dri-devel/20200222150106.22919-1-laurent.pinchart@=
ideasonboard.com/
>    git://linuxtv.org/pinchartl/media.git omapdrm/bridge/devel
>=20
> I pushed this patchset into the following branch:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git =
omapdrm/bridge/devel-with-dsi
>=20
> The previous version of this patchset has been sent quite some time =
ago.
> This version has been rebased and required cleaning up most of the
> hacks. I do not have a detailed changelog, but quite a few things
> changed. I decided against doing anything special for the DT change
> (adding DSI channel number), since only 3 devices are affected. It is
> quite likely, that all developers of those devices update DT together
> with kernel for those devices. My suggestion is to merge the first two
> patches ASAP and backport to stable, since it does not affect old
> kernels and the change is rather small.
>=20
> RFCv1: =
https://lore.kernel.org/dri-devel/20191117023946.VjCC3yE08DMx7JIKxNagPoT5e=
t7WTnKGVV6MtOtB9Ro@z/

is there something new for this series? Is there a repo where it has =
been rebased to v5.8-rc1 (and tested)?

Our Pyra MIPI/DSI omap5 panel setup is broken by upstream changes since =
v5.7-rc1 and I am not sure if it is better to search in the old omapdrm =
code what is missing now. Or to wait for your DSI code and just =
update/fix our panel driver (and have a chance to get that one =
upstream).

BR and thanks,
Nikolaus


>=20
> -- Sebastian
>=20
> Sebastian Reichel (56):
>  ARM: dts: omap: add channel to DSI panels
>  ARM: dts: omap4-droid4: add panel compatible
>  Revert "drm/omap: dss: Remove unused omap_dss_device operations"
>  omap/drm: drop unused dsi.configure_pins
>  drm/omap: dsi: use MIPI_DSI_FMT_* instead of OMAP_DSS_DSI_FMT_*
>  drm/omap: constify write buffers
>  drm/omap: dsi: add generic transfer function
>  drm/omap: panel-dsi-cm: convert to transfer API
>  drm/omap: dsi: unexport specific data transfer functions
>  drm/omap: dsi: drop virtual channel logic
>  drm/omap: dsi: simplify write function
>  drm/omap: dsi: simplify read functions
>  drm/omap: dsi: switch dsi_vc_send_long/short to mipi_dsi_msg
>  drm/omap: dsi: introduce mipi_dsi_host
>  drm/omap: panel-dsi-cm: use DSI helpers
>  drm/omap: dsi: request VC via mipi_dsi_attach
>  drm/omap: panel-dsi-cm: drop hardcoded VC
>  drm/omap: panel-dsi-cm: use common MIPI DCS 1.3 defines
>  drm/omap: dsi: drop unused memory_read()
>  drm/omap: dsi: drop unused get_te()
>  drm/omap: dsi: drop unused enable_te()
>  drm/omap: dsi: drop useless sync()
>  drm/omap: dsi: use pixel-format and mode from attach
>  drm/omap: panel-dsi-cm: use bulk regulator API
>  drm/omap: dsi: lp/hs switching support for transfer()
>  drm/omap: dsi: move TE GPIO handling into core
>  drm/omap: dsi: drop custom enable_te() API
>  drm/omap: dsi: do bus locking in host driver
>  drm/omap: dsi: untangle ulps ops from enable/disable
>  drm/dsi: add MIPI_DSI_MODE_ULPS_IDLE
>  drm/omap: dsi: do ULPS in host driver
>  drm/omap: dsi: move panel refresh function to host
>  drm/omap: dsi: Reverse direction of the DSS device enable/disable
>    operations
>  drm/omap: dsi: drop custom panel capability support
>  drm/omap: dsi: convert to drm_panel
>  drm/omap: drop omapdss-boot-init
>  drm/omap: dsi: implement check timings
>  drm/omap: panel-dsi-cm: use DEVICE_ATTR_RO
>  drm/omap: panel-dsi-cm: support unbinding
>  drm/omap: panel-dsi-cm: fix remove()
>  drm/omap: dsi: return proper error code from dsi_update_all()
>  drm/omap: remove global dss_device variable
>  drm/omap: bind components with drm_device argument
>  drm/panel: Move OMAP's DSI command mode panel driver
>  drm/omap: dsi: Register a drm_bridge
>  drm/omap: remove legacy DSS device operations
>  drm/omap: remove unused omap_connector
>  drm/omap: simplify omap_display_id
>  drm/omap: drop unused DSS next pointer
>  drm/omap: drop empty omap_encoder helper functions
>  drm/omap: drop DSS ops_flags
>  drm/omap: drop dssdev display field
>  drm/omap: simplify DSI manual update code
>  ARM: omap2plus_defconfig: Update for moved DSI command mode panel
>  drm/panel/panel-dsi-cm: support rotation property
>  ARM: dts: omap4-droid4: add panel orientation
>=20
> .../bindings/display/panel/panel-dsi-cm.txt   |    4 +-
> .../boot/dts/motorola-mapphone-common.dtsi    |    6 +-
> arch/arm/boot/dts/omap3-n950.dts              |    3 +-
> arch/arm/boot/dts/omap3.dtsi                  |    3 +
> arch/arm/boot/dts/omap4-sdp.dts               |    6 +-
> arch/arm/boot/dts/omap4.dtsi                  |    6 +
> arch/arm/boot/dts/omap5.dtsi                  |    6 +
> arch/arm/configs/omap2plus_defconfig          |    2 +-
> drivers/gpu/drm/omapdrm/Kconfig               |    1 -
> drivers/gpu/drm/omapdrm/Makefile              |    2 -
> drivers/gpu/drm/omapdrm/displays/Kconfig      |   10 -
> drivers/gpu/drm/omapdrm/displays/Makefile     |    2 -
> .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 1387 -----------------
> drivers/gpu/drm/omapdrm/dss/Kconfig           |    4 +-
> drivers/gpu/drm/omapdrm/dss/Makefile          |    2 -
> drivers/gpu/drm/omapdrm/dss/base.c            |   58 +-
> drivers/gpu/drm/omapdrm/dss/dsi.c             | 1034 +++++++-----
> drivers/gpu/drm/omapdrm/dss/dss.c             |   44 +-
> .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   |  220 ---
> drivers/gpu/drm/omapdrm/dss/omapdss.h         |  141 +-
> drivers/gpu/drm/omapdrm/dss/output.c          |   13 +-
> drivers/gpu/drm/omapdrm/dss/venc.c            |    1 -
> drivers/gpu/drm/omapdrm/omap_connector.c      |  157 --
> drivers/gpu/drm/omapdrm/omap_connector.h      |   28 -
> drivers/gpu/drm/omapdrm/omap_crtc.c           |   35 +-
> drivers/gpu/drm/omapdrm/omap_drv.c            |   49 +-
> drivers/gpu/drm/omapdrm/omap_drv.h            |    1 -
> drivers/gpu/drm/omapdrm/omap_encoder.c        |   59 +-
> drivers/gpu/drm/panel/Kconfig                 |    9 +
> drivers/gpu/drm/panel/Makefile                |    1 +
> drivers/gpu/drm/panel/panel-dsi-cm.c          |  674 ++++++++
> include/drm/drm_mipi_dsi.h                    |    2 +
> 32 files changed, 1465 insertions(+), 2505 deletions(-)
> delete mode 100644 drivers/gpu/drm/omapdrm/displays/Kconfig
> delete mode 100644 drivers/gpu/drm/omapdrm/displays/Makefile
> delete mode 100644 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> delete mode 100644 drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> delete mode 100644 drivers/gpu/drm/omapdrm/omap_connector.c
> delete mode 100644 drivers/gpu/drm/omapdrm/omap_connector.h
> create mode 100644 drivers/gpu/drm/panel/panel-dsi-cm.c
>=20
>=20
> base-commit: 54ba965bb3873eca6098ddf04e3a8d7bba1b5557
> --=20
> 2.25.0
>=20

