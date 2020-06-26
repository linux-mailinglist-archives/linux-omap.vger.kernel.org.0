Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B1820B0F3
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 13:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728782AbgFZLxl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 07:53:41 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:54215 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727818AbgFZLxk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 26 Jun 2020 07:53:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id omv4jNJEP0MRaomvLjN2nH; Fri, 26 Jun 2020 13:53:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593172419; bh=lFWvQ2tL+Wu+EZXNfy0nb8Fzx7KH+eeyz88m7Uh03t0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=QxYQflHFSeTb1OCRkypHqfbFLBOb/m72ok18wLidH/RnwY4ugpKUBu+9y7BKNQgYY
         l5xaOoKyLFY2GU3kgI5d5DDTBy/GRMV6UyKLHSJHcK1bUsK97T9aKbgG6Cl0WDkPLQ
         DbTqQhky3c8nJIzCJa/PwzkJuhpgL35/tvqHKFVNNPbbK1/GVTON5ulNZkteuDzzT5
         imrGNFs6XIX3Ax0Y/7dZ4MGJ4JQSL1l/036YNywoq4C4QxbunQ+bbj16bRctB2FTtC
         XUNwn82IJBiUIAvx3hePWi/EfAGKvXZ2QnmzZEKkidk+KvEhzYOjRwba1dr3Ze8jRH
         MsM6q+U0gMeWQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 2/7] pxa_camera: update MODULE_DESCRIPTION
Date:   Fri, 26 Jun 2020 13:53:16 +0200
Message-Id: <20200626115321.1898798-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
References: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIzDGmm54NkO8W3SCVbUUAstiCA20EKfCwZIT0izPaF5iBHWGwmtdzwhRo5LIoLW+5JOnha/vYGpqq8JTMDB3rHvgpWRBbDJEWi4TF3qqvKYMNoW7rsF
 TE5iKNNQzd6+6x/HnyCqVQ31GrfPEFHXhz+01I9VLifLttucc3VGMWTtDjZ362X1UrEIHQUfeLIfRHu/FmXjDEucAcwoFwgY3ucKAbNebMp6hHckEFNCVwZh
 qwkOwlEAbBekjo64OvW4SJfNLB4EIUFsG85Ou5HU0D78XTGZhBSECulHZT2Xl/M2kw8bJLBLwy7OdwFowkvrmcIzRAW+SjA1UlXsV0V+/wdxcjrMO7iw9MhJ
 D9ozdbn1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Remove the confusing SoC Camera reference.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/media/platform/pxa_camera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 3c5fe737d36f..a7cf830235b6 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -2588,7 +2588,7 @@ static struct platform_driver pxa_camera_driver = {
 
 module_platform_driver(pxa_camera_driver);
 
-MODULE_DESCRIPTION("PXA27x SoC Camera Host driver");
+MODULE_DESCRIPTION("PXA27x Camera Driver");
 MODULE_AUTHOR("Guennadi Liakhovetski <kernel@pengutronix.de>");
 MODULE_LICENSE("GPL");
 MODULE_VERSION(PXA_CAM_VERSION);
-- 
2.27.0

