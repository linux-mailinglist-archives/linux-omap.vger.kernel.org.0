Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 048BB72293F
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jun 2023 16:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233748AbjFEOsV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jun 2023 10:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233768AbjFEOsS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jun 2023 10:48:18 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5185102;
        Mon,  5 Jun 2023 07:48:16 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D93C61FD5E;
        Mon,  5 Jun 2023 14:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685976494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=cQ/uHOy9Ea/76BWJJOUMYibf8ONk/U2fmPr+7BD0qts=;
        b=0joN+Bl4uAtF9qKgj5B0qDBopz/rHhe9W45q4/Wg3V6LhC62nHMzIFKurj36hENDZ/DbvW
        ybCvVCXwHV+EISVqCLawF+TCbyqv5qQ2P7TNoq5cprahCGNjaMaYIrC/wduaB4yEBLu1Pl
        g/67yb0kin93cUmh3YfKgCs98wSwZso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685976494;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=cQ/uHOy9Ea/76BWJJOUMYibf8ONk/U2fmPr+7BD0qts=;
        b=15mtwJbpWGRwPlOj+AE/c62LMphngTJLdRujos72BLr6DI7n/pxf+ybBSG+Jkx89CikfIw
        I1xED+FX295M6iDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96045139C8;
        Mon,  5 Jun 2023 14:48:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id A9S1I671fWQvXwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:14 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/30] fbdev: Make userspace interfaces optional
Date:   Mon,  5 Jun 2023 16:47:42 +0200
Message-Id: <20230605144812.15241-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add the new config option FB_DEVICE. If enabled, fbdev provides
traditional userspace interfaces in devfs, sysfs and procfs, such
as /dev/fb0 or /proc/fb.

Modern Linux distrobutions have adopted DRM drivers for graphics
output and use fbdev only for the kernel's framebuffer console.
Userspace has also moved on, with no new fbdev code being written
and existing support being removed.

OTOH, fbdev provides userspace a way of accessing kernel or I/O
memory, which might compromise the system's security. See the recent
commit c8687694bb1f ("drm/fbdev-generic: prohibit potential
out-of-bounds access") for an example. Disabling fbdev userspace
interfaces is therefore a useful feature to limit unecessary
exposure of fbdev code to processes of low privilegues.

Patches 1 to 24 fix various bugs and issues in fbdev-related code.
In most cases the code uses the fbdev device where is should use
the Linux hardware device or someing else. Most of these patches
fix existing problems and should therefore be considered in any case.

Patches 25 to 29 refactor the fbdev core code. The patches move
support for backlights, sysfs, procfs and devfs into separate files
and hide it behind simple interfaces. These changes will allow to
easily build the userspace support conditionally.

Patch 30 introduces the config option FB_DEVICE and adapts the
fbdev core to support it. The field struct fb_info.dev is now also
optional, hence the name of the config option.

Tested on simpledrm and i915, including the device handover.

Future directions: With the support for disabling fbdev userspace
interfaces in place, it will be possible to make mosti fbdev drivers'
file-I/O code optional as well. 

Thomas Zimmermann (30):
  backlight/bd6107: Compare against struct fb_info.device
  backlight/gpio_backlight: Compare against struct fb_info.device
  backlight/lv5207lp: Compare against struct fb_info.device
  fbdev/atyfb: Reorder backlight and framebuffer init/cleanup
  fbdev/atyfb: Use hardware device as backlight parent
  fbdev/aty128fb: Reorder backlight and framebuffer init/cleanup
  fbdev/aty128fb: Use hardware device as backlight parent
  fbdev/broadsheetfb: Call device_remove_file() with hardware device
  fbdev/ep93xx-fb: Alloc DMA memory from hardware device
  fbdev/ep93xx-fb: Output messages with fb_info() and fb_err()
  fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
  fbdev/mb862xxfb: Output messages with fb_dbg() and fb_err()
  fbdev/metronomefb: Use hardware device for dev_err()
  fbdev/nvidiafb: Reorder backlight and framebuffer init/cleanup
  fbdev/nvidiafb: Use hardware device as backlight parent
  fbdev/pxa168fb: Do not assign to struct fb_info.dev
  fbdev/radeonfb: Reorder backlight and framebuffer cleanup
  fbdev/radeonfb: Use hardware device as backlight parent
  fbdev/rivafb: Reorder backlight and framebuffer init/cleanup
  fbdev/rivafb: Use hardware device as backlight parent
  fbdev/sm501fb: Output message with fb_err()
  fbdev/smscufx: Detect registered fb_info from refcount
  fbdev/tdfxfb: Set i2c adapter parent to hardware device
  fbdev/core: Pass Linux device to pm_vt_switch_*() functions
  fbdev/core: Move framebuffer and backlight helpers into separate files
  fbdev/core: Add fb_device_{create,destroy}()
  fbdev/core: Move procfs code to separate file
  fbdev/core: Move file-I/O code into separate file
  fbdev/core: Rework fb init code
  fbdev: Make support for userspace interfaces configurable

 arch/sh/boards/mach-ecovec24/setup.c         |   2 +-
 arch/sh/boards/mach-kfr2r09/setup.c          |   2 +-
 drivers/staging/fbtft/Kconfig                |   1 +
 drivers/video/backlight/bd6107.c             |   2 +-
 drivers/video/backlight/gpio_backlight.c     |   6 +-
 drivers/video/backlight/lv5207lp.c           |   2 +-
 drivers/video/fbdev/Kconfig                  |  12 +
 drivers/video/fbdev/aty/aty128fb.c           |  12 +-
 drivers/video/fbdev/aty/atyfb_base.c         |  18 +-
 drivers/video/fbdev/aty/radeon_backlight.c   |   2 +-
 drivers/video/fbdev/aty/radeon_base.c        |   3 +-
 drivers/video/fbdev/broadsheetfb.c           |   2 +-
 drivers/video/fbdev/core/Makefile            |   7 +-
 drivers/video/fbdev/core/fb_backlight.c      |  32 +
 drivers/video/fbdev/core/fb_devfs.c          | 484 +++++++++++++++
 drivers/video/fbdev/core/fb_info.c           |  76 +++
 drivers/video/fbdev/core/fb_internal.h       |  61 ++
 drivers/video/fbdev/core/fb_procfs.c         |  62 ++
 drivers/video/fbdev/core/fbcon.c             |   1 +
 drivers/video/fbdev/core/fbmem.c             | 594 +------------------
 drivers/video/fbdev/core/fbsysfs.c           | 134 +----
 drivers/video/fbdev/ep93xx-fb.c              |  21 +-
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c   |   7 +-
 drivers/video/fbdev/metronomefb.c            |   2 +-
 drivers/video/fbdev/nvidia/nv_backlight.c    |   2 +-
 drivers/video/fbdev/nvidia/nvidia.c          |   8 +-
 drivers/video/fbdev/omap2/omapfb/Kconfig     |   2 +-
 drivers/video/fbdev/pxa168fb.c               |   2 +-
 drivers/video/fbdev/riva/fbdev.c             |  10 +-
 drivers/video/fbdev/sm501fb.c                |   2 +-
 drivers/video/fbdev/smscufx.c                |   4 +-
 drivers/video/fbdev/tdfxfb.c                 |   4 +-
 include/linux/fb.h                           |   6 +-
 include/linux/platform_data/bd6107.h         |   2 +-
 include/linux/platform_data/gpio_backlight.h |   2 +-
 include/linux/platform_data/lv5207lp.h       |   2 +-
 36 files changed, 859 insertions(+), 732 deletions(-)
 create mode 100644 drivers/video/fbdev/core/fb_backlight.c
 create mode 100644 drivers/video/fbdev/core/fb_devfs.c
 create mode 100644 drivers/video/fbdev/core/fb_info.c
 create mode 100644 drivers/video/fbdev/core/fb_internal.h
 create mode 100644 drivers/video/fbdev/core/fb_procfs.c

-- 
2.40.1

