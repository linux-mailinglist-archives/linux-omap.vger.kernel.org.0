Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 927E77AFC54
	for <lists+linux-omap@lfdr.de>; Wed, 27 Sep 2023 09:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjI0Hre (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Sep 2023 03:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbjI0Hr3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Sep 2023 03:47:29 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5101A136;
        Wed, 27 Sep 2023 00:47:26 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D86C221873;
        Wed, 27 Sep 2023 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695800844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=60Z1BjKIJ4+wGz82oT0iRpCCahrgRXOSIFEA+P9XjPQ=;
        b=Rtaz7SByafcrHUiZ6N4kbs5VxRG4isNa5QHvUiB0BBTSKedn2hPFSyJbU5cN1VZ2DCiTvn
        mGBg0fj9hFIUvGHg6WrKSSgoxnpTPi6Pq/c1nfGwN2e0tq7SX6saMDz7z9jvz9w48HWhYS
        BVLg/Cr8Hf6sv2uopQMtz8+zjGv7luA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695800844;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=60Z1BjKIJ4+wGz82oT0iRpCCahrgRXOSIFEA+P9XjPQ=;
        b=h8sBohLiXB2A1LBrQ8cgdFElh7N9h1oKS0IjzzKoTyOOEyZsIkeSOnTLxr+64RBvDVzrxq
        iA222wVIEFUO5EDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D0B11338F;
        Wed, 27 Sep 2023 07:47:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id B5+NIQzeE2XvUQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:24 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
        daniel@ffwll.ch
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/46] fbdev: Init fb_ops with helpers for I/O memory
Date:   Wed, 27 Sep 2023 09:26:33 +0200
Message-ID: <20230927074722.6197-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Initialize struct fb_ops for drivers for hardware with framebuffers
in I/O-memory ranges with the respective helper macros. Also select
the appropriate Kconfig dependencies.

The patchset is part of a larger effort to modularize the fbdev core
and make it more adaptable. Most of these drivers do not initialize
the fb_read, fb_write and fb_mmap callbacks in fb_ops. By leaving the
callback pointers to NULL, they rely on the fbdev core to invoke the
I/O-memory helpers by default. This default makes it impossible to
remove the I/O-memory helpers on systems that don't need them. Setting
the pointers explicitly will allow for the removal of the default. If
a callback in fb_ops is unset, the operation will then be unsupported.

Initializing struct fb_ops via helpers macros will also allow for a
fine-grained setup, depending on Kconfig options. For example, it
will be possible to leave out file I/O if FB_DEVICE has not been
set.

This patchset contains the majority of fbdev driver work. The updated
drivers now initialize fb_ops with __FB_DEFAULT_IOMEM_OPS_RDWR,
__FB_DEFAULT_IOMEM_OPS_DRAW and/or __FB_DEFAULT_IOMEM_OPS_MMAP if
possible. Some drivers now use FB_DEFAULT_IOMEM_OPS, which sets all
fields correctly. In Kconfig, each driver selects FB_IOMEM_FOPS to
get the helpers for I/O memory. Drivers that use _RDWR, _DRAW and
_MMAP unconditionally select FB_IOMEM_HELPERS, which selects the
correct modules automatically.

Thomas Zimmermann (46):
  fbdev: Provide I/O-memory helpers as module
  fbdev/68328fb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/amba-clcd: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/amifb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/arkfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/atafb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/atyfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/au1100fb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/cirrusfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/cobalt-lcd: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/controlfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/cyber2000fb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/dnfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/ep93xx-fb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/gbefb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/hgafb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/hitfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/hpfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/i810fb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/imsttfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/intelfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/matroxfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/neofb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/nvidiafb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/omapfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/pm2fb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/pm3fb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/pvr2fb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/radeon: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/rivafb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/s1d13xxxfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/s3fb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/sa1100fb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/savagefb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/sisfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/sm501fb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/sm712fb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/stifb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/sunxvr500: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/tdfxfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/tgafb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/tridentfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/vermilionfb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/vga16fb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/viafb: Initialize fb_ops to fbdev I/O-memory helpers
  fbdev/vt8623fb: Initialize fb_ops to fbdev I/O-memory helpers

 drivers/video/fbdev/68328fb.c                 |  5 +-
 drivers/video/fbdev/Kconfig                   | 93 +++++++++++--------
 drivers/video/fbdev/amba-clcd.c               |  5 +-
 drivers/video/fbdev/amifb.c                   |  2 +
 drivers/video/fbdev/arkfb.c                   |  2 +
 drivers/video/fbdev/atafb.c                   |  2 +
 drivers/video/fbdev/aty/atyfb_base.c          |  3 +
 drivers/video/fbdev/aty/radeon_base.c         |  2 +
 drivers/video/fbdev/au1100fb.c                |  8 +-
 drivers/video/fbdev/cirrusfb.c                |  2 +
 drivers/video/fbdev/cobalt_lcdfb.c            |  2 +
 drivers/video/fbdev/controlfb.c               |  5 +-
 drivers/video/fbdev/core/Kconfig              |  6 ++
 drivers/video/fbdev/core/Makefile             |  3 +-
 drivers/video/fbdev/core/fb_io_fops.c         |  3 +
 drivers/video/fbdev/cyber2000fb.c             |  2 +
 drivers/video/fbdev/dnfb.c                    |  2 +
 drivers/video/fbdev/ep93xx-fb.c               |  5 +-
 drivers/video/fbdev/gbefb.c                   |  7 +-
 drivers/video/fbdev/hgafb.c                   |  2 +
 drivers/video/fbdev/hitfb.c                   |  4 +-
 drivers/video/fbdev/hpfb.c                    |  2 +
 drivers/video/fbdev/i810/i810_main.c          |  2 +
 drivers/video/fbdev/imsttfb.c                 |  2 +
 drivers/video/fbdev/intelfb/intelfbdrv.c      |  4 +-
 drivers/video/fbdev/matrox/matroxfb_base.c    |  2 +
 drivers/video/fbdev/matrox/matroxfb_crtc2.c   |  4 +-
 drivers/video/fbdev/neofb.c                   |  2 +
 drivers/video/fbdev/nvidia/nvidia.c           |  2 +
 drivers/video/fbdev/omap2/omapfb/Kconfig      |  4 +-
 .../video/fbdev/omap2/omapfb/omapfb-main.c    |  5 +-
 drivers/video/fbdev/pm2fb.c                   |  2 +
 drivers/video/fbdev/pm3fb.c                   |  2 +
 drivers/video/fbdev/pvr2fb.c                  | 14 +--
 drivers/video/fbdev/riva/fbdev.c              |  2 +
 drivers/video/fbdev/s1d13xxxfb.c              | 25 +++--
 drivers/video/fbdev/s3fb.c                    |  2 +
 drivers/video/fbdev/sa1100fb.c                |  5 +-
 drivers/video/fbdev/savage/savagefb_driver.c  |  6 +-
 drivers/video/fbdev/sis/sis_main.c            |  4 +-
 drivers/video/fbdev/sm501fb.c                 |  4 +
 drivers/video/fbdev/sm712fb.c                 |  1 +
 drivers/video/fbdev/stifb.c                   |  2 +
 drivers/video/fbdev/sunxvr500.c               |  2 +
 drivers/video/fbdev/tdfxfb.c                  |  6 +-
 drivers/video/fbdev/tgafb.c                   |  2 +
 drivers/video/fbdev/tridentfb.c               |  2 +
 drivers/video/fbdev/vermilion/vermilion.c     |  5 +-
 drivers/video/fbdev/vga16fb.c                 |  2 +
 drivers/video/fbdev/via/viafbdev.c            |  2 +
 drivers/video/fbdev/vt8623fb.c                |  2 +
 51 files changed, 185 insertions(+), 101 deletions(-)


base-commit: e1973de2c4516e9130157e538014e79c8aa57b41
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
-- 
2.42.0

