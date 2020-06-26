Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A31020B0F6
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 13:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbgFZLxm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 07:53:42 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:60941 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725884AbgFZLxl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 26 Jun 2020 07:53:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id omv4jNJEP0MRaomv7jN2mD; Fri, 26 Jun 2020 13:53:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593172418; bh=pxBlxp8/ElN0awuN8vpyn/3u2TcbupLndyUBEN4viCE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=J1Mr5ybjFfpPUSOtOZLY1A5sXX0V+IE8R5P+L5RKnQ2gXhLuTBvvr0DSAqWwFM4sS
         yMUFvg9Ecq7MBklea0RjF10OIweJ6qCEMX3PwMQ3Idn45SIlM4lcFyCZpuCsrpt5Zn
         UO4eiRa50+yA0XdYaFFFVdzd+Q4yFxmradPckC6+MZ+z2FqVMNEKVXidqSmBfOWBO2
         KxgKXBgOdVqEB3v79+4DhumlaVKTOz4v3S3gKp6BG8RPtqmi+97bdUx1ncSEmU5i6Y
         lI6hJ2hDmGbutuvtrLUJyf59MnsIuP7Fw0kJnj7UtV+QO3Ns9XHmBEC8BK1/zWbFjR
         5C+TT1djYU7Zg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/7] media: kill off broken soc_camera
Date:   Fri, 26 Jun 2020 13:53:14 +0200
Message-Id: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMTE0Nd3tii5ieL1QGBOcVk6QGv2o01LSiMpq/ht3BgSozcFsN4/e2CI70Y0+d4reb9GmJENt+UxQP18EBJeRCBHPKegbW/V/zfjsEDCEVhXW6IgthdZ
 Z/n9bBXP44Yedzp5KDTEUJlWQXETVRStFVDqNhSeEzwAbEqZAWNPQVsGpebb+IQVV3chNGVnELrJRIKXHzAAv/IVpjtwyRICYfTQBvYg+ijWYaz/x1ZDjeQ4
 zUCsZYSfSh5UtiwbiKFFE/W1wK5U09r6bQO8QwnmAgIVYk0uKlzShxsCCmxwTiVg
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The soc_camera driver (and soc_camera.h header) is obsolete and depends
on BROKEN. It's time to remove this driver and the last references to it.

The first two patches remove a SoC Camera reference in two media drivers.
These references are obsolete (these drivers no longer use soc_camera),
so update the MODULE_DESCRIPTION.

The next three patches remove soc_camera depencies in three board files.
This has been compile tested. Note that the camera support for those
boards has been dead for a long time, so this really removes it. These
three patches are independent of the other patches in this series.

Then the soc_camera driver itself is removed (including soc_camera
dependent sensor drivers). This patch is also independent of the
other patches.

The final patch removes the soc_camera.h header, and that requires
that patches 3-6 are all merged.

Regards,

	Hans

Hans Verkuil (7):
  ov9640: update MODULE_DESCRIPTION
  pxa_camera: update MODULE_DESCRIPTION
  mach-imx: mach-imx27_visstrim_m10.c: remove soc_camera dependencies
  mach-omap1: board-ams-delta.c: remove soc_camera dependencies
  mach-pxa: palmz72/pcm990: remove soc_camera dependencies
  staging/media/soc_camera: remove this driver
  soc_camera.h: remove this unused header

 arch/arm/mach-imx/mach-imx27_visstrim_m10.c   |   31 -
 arch/arm/mach-omap1/board-ams-delta.c         |   32 -
 arch/arm/mach-omap1/camera.h                  |   14 -
 arch/arm/mach-omap1/devices.c                 |   43 -
 arch/arm/mach-pxa/palmz72.c                   |  112 -
 arch/arm/mach-pxa/pcm990-baseboard.c          |  157 --
 drivers/media/i2c/ov9640.c                    |    2 +-
 drivers/media/platform/pxa_camera.c           |    2 +-
 drivers/staging/media/Kconfig                 |    2 -
 drivers/staging/media/Makefile                |    1 -
 drivers/staging/media/soc_camera/Kconfig      |   51 -
 drivers/staging/media/soc_camera/Makefile     |    7 -
 drivers/staging/media/soc_camera/TODO         |    4 -
 drivers/staging/media/soc_camera/imx074.c     |  492 ----
 drivers/staging/media/soc_camera/mt9t031.c    |  853 -------
 .../staging/media/soc_camera/soc-camera.rst   |  171 --
 drivers/staging/media/soc_camera/soc_camera.c | 2164 -----------------
 .../staging/media/soc_camera/soc_mediabus.c   |  529 ----
 .../staging/media/soc_camera/soc_mt9v022.c    | 1008 --------
 drivers/staging/media/soc_camera/soc_ov5642.c | 1085 ---------
 drivers/staging/media/soc_camera/soc_ov9740.c |  992 --------
 .../linux/platform_data/media/omap1_camera.h  |   32 -
 include/media/drv-intf/soc_mediabus.h         |  107 -
 include/media/soc_camera.h                    |  397 ---
 24 files changed, 2 insertions(+), 8286 deletions(-)
 delete mode 100644 arch/arm/mach-omap1/camera.h
 delete mode 100644 drivers/staging/media/soc_camera/Kconfig
 delete mode 100644 drivers/staging/media/soc_camera/Makefile
 delete mode 100644 drivers/staging/media/soc_camera/TODO
 delete mode 100644 drivers/staging/media/soc_camera/imx074.c
 delete mode 100644 drivers/staging/media/soc_camera/mt9t031.c
 delete mode 100644 drivers/staging/media/soc_camera/soc-camera.rst
 delete mode 100644 drivers/staging/media/soc_camera/soc_camera.c
 delete mode 100644 drivers/staging/media/soc_camera/soc_mediabus.c
 delete mode 100644 drivers/staging/media/soc_camera/soc_mt9v022.c
 delete mode 100644 drivers/staging/media/soc_camera/soc_ov5642.c
 delete mode 100644 drivers/staging/media/soc_camera/soc_ov9740.c
 delete mode 100644 include/linux/platform_data/media/omap1_camera.h
 delete mode 100644 include/media/drv-intf/soc_mediabus.h
 delete mode 100644 include/media/soc_camera.h

-- 
2.27.0

