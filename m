Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E785C72C776
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jun 2023 16:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237585AbjFLOO1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Jun 2023 10:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237388AbjFLOOI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Jun 2023 10:14:08 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6801705;
        Mon, 12 Jun 2023 07:14:03 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 1B7AE22854;
        Mon, 12 Jun 2023 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1686579242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ycsvHkXyKHqyfTafKQc0gRURrA79izYFrq9q9yeJ/ns=;
        b=Naniz9+3965gHUB2S6NeKdQAO4JHY/RSs5oYEgmctWK/A7nF0GanD4WojheAZ/i/1EdoP4
        GsQVoem9yYwtqku8g6YBvs6tB3VhLBzXqIx8bW/2AaJdrgHmXFpQRngQ7T91TzosZMv8ek
        yGoL6ZlJLaAnbldVDmAphDK0n43iHk8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1686579242;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ycsvHkXyKHqyfTafKQc0gRURrA79izYFrq9q9yeJ/ns=;
        b=Gt99tqHGBbeV119KG5Re7s6ni75yQa87JKHhl7/tT2WzJYakc0W/S64nUTsDdR9A1/YkEX
        tXVANoeqhFTkcLCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE0251357F;
        Mon, 12 Jun 2023 14:14:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id eObsLCkoh2RwGQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 14:14:01 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v2 21/38] fbdev/radeonfb: Reorder backlight and framebuffer cleanup
Date:   Mon, 12 Jun 2023 16:07:59 +0200
Message-ID: <20230612141352.29939-22-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230612141352.29939-1-tzimmermann@suse.de>
References: <20230612141352.29939-1-tzimmermann@suse.de>
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

The driver's backlight code requires the framebuffer to be
registered. Therefore reorder the cleanup calls for both data
structures. The init calls are already in the correct order.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/aty/radeon_base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index 972c4bbedfa36..8f2a527c26ebf 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -2517,9 +2517,8 @@ static void radeonfb_pci_unregister(struct pci_dev *pdev)
 
 	del_timer_sync(&rinfo->lvds_timer);
 	arch_phys_wc_del(rinfo->wc_cookie);
-        unregister_framebuffer(info);
-
         radeonfb_bl_exit(rinfo);
+	unregister_framebuffer(info);
 
         iounmap(rinfo->mmio_base);
         iounmap(rinfo->fb_base);
-- 
2.41.0

