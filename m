Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64326D2098
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 08:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732821AbfJJGCk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 02:02:40 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218]:30552 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfJJGCk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 02:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570687358;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:Cc:Message-Id:Date:Subject:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=yO1tqzRLFZEI6lonz5wMj4kQNc1chTOXzwu7MlVhARA=;
        b=PZbQh2i4A359mZXCzrR247MfuFkuYYm/dlK24uTWKbtoT/uA1PgWXuIK27NViWAw6C
        bN/W0QWvp7Qx67R8babWki+rlkOQEvkLq9H2Wmy6yileoBohvd6k6rUBXzCrCPU+Eri7
        gmMQbVIIR56vuXhCylwht1vGcYz6zYAvYhF4O2mTrzMCD4i61pZp5yuZ0il8DkvuQVNb
        VqACN4XiltkAy9wZnDyPj22N0GfvJc8/ioMFTdrt0Qxp14M6Fq261snDf0kP8OTuRDDA
        aNjIo4oht1A6sFq9JNoScDwLhXCWGm0Tsxnj2atIUOr3jzxrXFF1mltax4899rWyf2RE
        TTTg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/zowDCp46Q="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v9A62R24Q
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 10 Oct 2019 08:02:27 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: omapdrm: dsi panels
Date:   Thu, 10 Oct 2019 08:02:26 +0200
Message-Id: <3C538A9E-BCE9-4ECF-97C2-52E823266296@goldelico.com>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,
now as DPI panels have been moved to drm/panel are there plans to
support DSI panels sitting there as well?

I have looked to move our boe-w677l driver for the omap5/Pyra handheld
but it seems there are still some omapdrm dependencies.

A quick search for "omap" reveals:

#include "../dss/omapdss.h"
struct omap_dss_device
struct omap_dss_driver
struct omap_dsi_pin_config
struct omap_dss_device_ops
OMAP_DSS_DSI_FMT_RGB888
OMAP_DSS_DSI_VIDEO_MODE
OMAP_DSS_DSI_BURST_MODE
OMAP_DSS_DEVICE_OP_MODES
OMAP_DISPLAY_TYPE_DSI
omapdss_device_is_enabled()
omapdss_display_get_modes()
omapdss_display_init()
omapdss_device_register()
omapdss_device_unregister()

BR and thanks,
Nikolaus

