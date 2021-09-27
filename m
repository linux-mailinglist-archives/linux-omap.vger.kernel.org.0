Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8156D419541
	for <lists+linux-omap@lfdr.de>; Mon, 27 Sep 2021 15:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234581AbhI0NnC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Sep 2021 09:43:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:38350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234359AbhI0NnB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 Sep 2021 09:43:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E397F61002;
        Mon, 27 Sep 2021 13:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632750083;
        bh=JjI0u1L1jKYQtGmh8Dc3QRrE0SY4VzH+q8NSvJlPrCE=;
        h=From:To:Cc:Subject:Date:From;
        b=UClzlqs++rOnLjpjymIt0cVidcglKG6CcGx2na/S9y1vd1qQj5be+HCu+2KldW5vl
         FRnQO8OhzNoQBRIR4a42rEDwf3XKpwj3iFtMswxtqaGMC9bnOUM8VM45N5O5JvnsSE
         vYwEOySWzGBif+A8G02uPbk3pq0QgHTA90XpGkbfIdfkR72e5xFegw/ok+hOR+WPci
         eQq+QizAVHf8SdCBeTGQx2QejfRioOF2niXDgiCaO/3KDSpNhusnVzuiSdR9/KvoFW
         H8otAHETZs9mlx7Z7HZBKxI4U8rBfAOoWCyemnwJkodHazMlIBWH3Rdj4Q+xBSDDUl
         d5Sb6F+ktRhEw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomi Valkeinen <tomba@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: omap_vout: use dma_addr_t consistently
Date:   Mon, 27 Sep 2021 15:41:06 +0200
Message-Id: <20210927134116.1592896-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

gcc notices that the driver mixes 'dma_addr_t' 'u8 *' and 'u32'
to store DMA addresses:

drivers/media/platform/omap/omap_vout.c: In function 'omap_vout_vb2_prepare':
drivers/media/platform/omap/omap_vout.c:979:37: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
  vout->queued_buf_addr[vb->index] = (u8 *)buf_phy_addr;
                                     ^
drivers/media/platform/omap/omap_vout.c: In function 'omap_vout_create_video_devices':
drivers/media/platform/omap/omap_vout.c:1479:21: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
   vout->fbuf.base = (void *)info.paddr;

Use dma_addr_t everywhere here to avoid the type conversions and document
what the address is used for. Assigning to vout->fbuf.base still requires
a cast, since that is part of the driver independent data structure.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/omap/omap_vout.c      | 18 ++++++++++--------
 drivers/media/platform/omap/omap_vout_vrfb.c |  2 +-
 drivers/media/platform/omap/omap_voutdef.h   |  2 +-
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/omap/omap_vout.c b/drivers/media/platform/omap/omap_vout.c
index 21193f0b7f61..3e0d9af7ffec 100644
--- a/drivers/media/platform/omap/omap_vout.c
+++ b/drivers/media/platform/omap/omap_vout.c
@@ -277,7 +277,7 @@ static int video_mode_to_dss_mode(struct omap_vout_device *vout)
  */
 static int omapvid_setup_overlay(struct omap_vout_device *vout,
 		struct omap_overlay *ovl, int posx, int posy, int outw,
-		int outh, u32 addr)
+		int outh, dma_addr_t addr)
 {
 	int ret = 0;
 	struct omap_overlay_info info;
@@ -352,7 +352,7 @@ static int omapvid_setup_overlay(struct omap_vout_device *vout,
 /*
  * Initialize the overlay structure
  */
-static int omapvid_init(struct omap_vout_device *vout, u32 addr)
+static int omapvid_init(struct omap_vout_device *vout, dma_addr_t addr)
 {
 	int ret = 0, i;
 	struct v4l2_window *win;
@@ -479,7 +479,8 @@ static int omapvid_handle_interlace_display(struct omap_vout_device *vout,
 static void omap_vout_isr(void *arg, unsigned int irqstatus)
 {
 	int ret, fid, mgr_id;
-	u32 addr, irq;
+	dma_addr_t addr;
+	u32 irq;
 	struct omap_overlay *ovl;
 	u64 ts;
 	struct omapvideo_info *ovid;
@@ -543,7 +544,7 @@ static void omap_vout_isr(void *arg, unsigned int irqstatus)
 			struct omap_vout_buffer, queue);
 	list_del(&vout->next_frm->queue);
 
-	addr = (unsigned long)vout->queued_buf_addr[vout->next_frm->vbuf.vb2_buf.index]
+	addr = vout->queued_buf_addr[vout->next_frm->vbuf.vb2_buf.index]
 		+ vout->cropped_offset;
 
 	/* First save the configuration in ovelray structure */
@@ -976,7 +977,7 @@ static int omap_vout_vb2_prepare(struct vb2_buffer *vb)
 	vb2_set_plane_payload(vb, 0, vout->pix.sizeimage);
 	voutbuf->vbuf.field = V4L2_FIELD_NONE;
 
-	vout->queued_buf_addr[vb->index] = (u8 *)buf_phy_addr;
+	vout->queued_buf_addr[vb->index] = buf_phy_addr;
 	if (ovid->rotation_type == VOUT_ROT_VRFB)
 		return omap_vout_prepare_vrfb(vout, vb);
 	return 0;
@@ -995,7 +996,8 @@ static int omap_vout_vb2_start_streaming(struct vb2_queue *vq, unsigned int coun
 	struct omap_vout_device *vout = vb2_get_drv_priv(vq);
 	struct omapvideo_info *ovid = &vout->vid_info;
 	struct omap_vout_buffer *buf, *tmp;
-	u32 addr = 0, mask = 0;
+	dma_addr_t addr = 0;
+	u32 mask = 0;
 	int ret, j;
 
 	/* Get the next frame from the buffer queue */
@@ -1018,7 +1020,7 @@ static int omap_vout_vb2_start_streaming(struct vb2_queue *vq, unsigned int coun
 			goto out;
 		}
 
-	addr = (unsigned long)vout->queued_buf_addr[vout->cur_frm->vbuf.vb2_buf.index]
+	addr = vout->queued_buf_addr[vout->cur_frm->vbuf.vb2_buf.index]
 		+ vout->cropped_offset;
 
 	mask = DISPC_IRQ_VSYNC | DISPC_IRQ_EVSYNC_EVEN | DISPC_IRQ_EVSYNC_ODD
@@ -1476,7 +1478,7 @@ static int __init omap_vout_create_video_devices(struct platform_device *pdev)
 		 * To be precise: fbuf.base should match smem_start of
 		 * struct fb_fix_screeninfo.
 		 */
-		vout->fbuf.base = (void *)info.paddr;
+		vout->fbuf.base = (void *)(uintptr_t)info.paddr;
 
 		/* Set VRFB as rotation_type for omap2 and omap3 */
 		if (omap_vout_dss_omap24xx() || omap_vout_dss_omap34xx())
diff --git a/drivers/media/platform/omap/omap_vout_vrfb.c b/drivers/media/platform/omap/omap_vout_vrfb.c
index 6bd672cbdb62..0cfa0169875f 100644
--- a/drivers/media/platform/omap/omap_vout_vrfb.c
+++ b/drivers/media/platform/omap/omap_vout_vrfb.c
@@ -305,7 +305,7 @@ int omap_vout_prepare_vrfb(struct omap_vout_device *vout,
 	/* Store buffers physical address into an array. Addresses
 	 * from this array will be used to configure DSS */
 	rotation = calc_rotation(vout);
-	vout->queued_buf_addr[vb->index] = (u8 *)
+	vout->queued_buf_addr[vb->index] =
 		vout->vrfb_context[vb->index].paddr[rotation];
 	return 0;
 }
diff --git a/drivers/media/platform/omap/omap_voutdef.h b/drivers/media/platform/omap/omap_voutdef.h
index 1cff6dea1879..b586193341d2 100644
--- a/drivers/media/platform/omap/omap_voutdef.h
+++ b/drivers/media/platform/omap/omap_voutdef.h
@@ -170,7 +170,7 @@ struct omap_vout_device {
 	struct omap_vout_buffer *cur_frm, *next_frm;
 	spinlock_t vbq_lock;            /* spinlock for dma_queue */
 	struct list_head dma_queue;
-	u8 *queued_buf_addr[VIDEO_MAX_FRAME];
+	dma_addr_t queued_buf_addr[VIDEO_MAX_FRAME];
 	u32 cropped_offset;
 	s32 tv_field1_offset;
 	void *isr_handle;
-- 
2.29.2

