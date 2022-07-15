Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C35575D9B
	for <lists+linux-omap@lfdr.de>; Fri, 15 Jul 2022 10:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiGOIf0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Jul 2022 04:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiGOIfZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 Jul 2022 04:35:25 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E479B33A26;
        Fri, 15 Jul 2022 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1657874109;
        bh=LAZsLjZmpRWu0eR/ZFsMTr9a3cRlqgXyPWqeMlfwQ8A=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=aFIWV/E5shvMoJBb5vWi7fIyASjrFa9x2hPKenis+jYDRN6acpYx4jtCUxjoyuTNi
         K05yW6o8g3hKyGlUVe5VbDkyki51w0IXuYXks0gjRp8E7ePzb8MyYfPiQ/yJjEXrWV
         TUc3Jmvid2LPygZQrEY3qv7NI4QduAWLF124PArs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.139.47]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3il-1o5zGg0ieB-00TQbS; Fri, 15
 Jul 2022 10:35:09 +0200
Date:   Fri, 15 Jul 2022 10:35:04 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tomi Valkeinen <tomba@kernel.org>
Subject: [PATCH] video: fbdev: omapfb: Unexport omap*_update_window_async()
Message-ID: <YtEmuHuPfXh6wIpc@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:g42iaChzcVEFxsRJEs+Pd7Iv4W2mQ2hk0Nm9L0mYAADlXDx2nLa
 vj6JiH/7pc5LjdjtY5db0K9T9uPA4/pcfqGpe+1XaOJSRErrpxvBkbX3wV2HG70GbhQDNRA
 6DAahrupRx04209w/uSTaLFoyzO+jyMIGoF9dnfdmx6oRcQmATfhXat/X2Wxd93sG/7W8dF
 AG7/LGx4k98hNqdC6CvnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:28EqFOiTA4g=:PqxoyL8h8cik+lMcKXW1O6
 yCRFIw0KikBYY0wj1ElLlOuxou9B9Hl6tdAeyJFeN6hXxQfvZIwrvQkl22qa5yN4A7PEOn3Xr
 PUH5ZMkXQPtO5ft9OfG24mYyoyGI2GE9+TOFVyxTYBjiHINW9K3IyXyzVtATQlgMresLBm8zA
 xk7DRODA5bcEDOthz/qJb7FeooAHD5uEXsbpGkLi+CNv6OQ+pEmi2DckmCsDjvBvn30d8DZJ/
 2pgGxzXSBEZpFCpVgqrrCSPqTiaEartWSplsq4VwjQB/rWOpHjlMpOYDQdCGgelona9IHNQA1
 MAmhpAq7dfHUq6to+tX5VSfdlxgu1nkdb0APakwvueKFUXtlhHfkFObNB22UDv+h8Vtrt5ufi
 SOjuugmLvAKyEb/SakNl2Cw6ODgfLFzrCHoXinRCpmYqI7yre6ApW45vp1gKfhHBLlQhOmA49
 679Ohm3OlYjMLDFkYHSu/O2c2B0UOK8UnxqZvOWvsHakwqnj3CsRRM6jHJRUwpFhvJooKd0HB
 Qwuxnv63/9wPErxWwFT5I1A08h7X6kJi2bRDPX2PhJ2YSnlAocAwVE36ho/B/NYFBjskKhubi
 2idC9XdBKWHZSq1EcElQHou9XAU6EVYAo5A/kaC+Wcy3VWWoKbcxkAN8WLXbe6xHgYet1L6l9
 qyaefP4ZNzdoX7DtpsJKY90VJoYsIv90yENxpfeklnH8qhNUHgFPY5jcLQDDX30Pl4QfT/Meh
 mfRQHy6cbo14XcUI1lAv6GkU2fNj7EmmD7sLD1cACdM6bFJsDDmKj5+9IfKWl++4BAPGAk7PJ
 s9Id4+v6smNSMikvNse1TQO5HLa5FKYoJAt5TzIIGeKBb5nlyN5RE4QbWS2rmHA8YSQT/epNH
 ru8GGb6nRvJVbWlP1UhXNmrOcWE2MCh15cvnk8gd3Ocf4oVooDQ8odONAqqpwHxcIpzXPRQkK
 8KpW00KR8Ehv28NW4sRqqudwz9YxlPDJg/5W+ylxg/q9LawbV7mI5QEce2MBEQLtwcnEjG+CX
 Sqbo/RZ6Xg2SKmhvv+/+2sYrrlt96myjBXN8Xn7ZgwE6wjfyPuV3SeOtAma13x6Gxk9DpyDvN
 LCh/LelHPZs272L246eWz9jM8QHTAUlzh9n0s0Gd7bHE6hHYgaJRHaPzg==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There is no need to EXPORT the functions hwa742_update_window_async()
and omapfb_update_window_async() since they are not used anywhere else
inside or outside the kernel tree.

Signed-off-by: Helge Deller <deller@gmx.de>
Link: https://lore.kernel.org/all/YpMXF9luBc4Sjr9h@ls3530/

diff --git a/drivers/video/fbdev/omap/hwa742.c b/drivers/video/fbdev/omap/=
hwa742.c
index 9d9fe5c3a7a1..161fc65d6b57 100644
=2D-- a/drivers/video/fbdev/omap/hwa742.c
+++ b/drivers/video/fbdev/omap/hwa742.c
@@ -489,7 +489,7 @@ static void hwa742_update_window_auto(struct timer_lis=
t *unused)
 	__hwa742_update_window_auto(false);
 }

-int hwa742_update_window_async(struct fb_info *fbi,
+static int hwa742_update_window_async(struct fb_info *fbi,
 				 struct omapfb_update_window *win,
 				 void (*complete_callback)(void *arg),
 				 void *complete_callback_data)
@@ -522,7 +522,6 @@ int hwa742_update_window_async(struct fb_info *fbi,
 out:
 	return r;
 }
-EXPORT_SYMBOL(hwa742_update_window_async);

 static int hwa742_setup_plane(int plane, int channel_out,
 				  unsigned long offset, int screen_width,
diff --git a/drivers/video/fbdev/omap/omapfb.h b/drivers/video/fbdev/omap/=
omapfb.h
index beb841ccb99c..ab1cb6e7f5f8 100644
=2D-- a/drivers/video/fbdev/omap/omapfb.h
+++ b/drivers/video/fbdev/omap/omapfb.h
@@ -227,13 +227,4 @@ extern int  omapfb_register_client(struct omapfb_noti=
fier_block *nb,
 				   omapfb_notifier_callback_t callback,
 				   void *callback_data);
 extern int  omapfb_unregister_client(struct omapfb_notifier_block *nb);
-extern int  omapfb_update_window_async(struct fb_info *fbi,
-				       struct omapfb_update_window *win,
-				       void (*callback)(void *),
-				       void *callback_data);
-extern int  hwa742_update_window_async(struct fb_info *fbi,
-				       struct omapfb_update_window *win,
-				       void (*callback)(void *),
-				       void *callback_data);
-
 #endif /* __OMAPFB_H */
diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/=
omap/omapfb_main.c
index 292fcb0a24fc..dfb4ddc45701 100644
=2D-- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -668,7 +668,7 @@ static int omapfb_set_par(struct fb_info *fbi)
 	return r;
 }

-int omapfb_update_window_async(struct fb_info *fbi,
+static int omapfb_update_window_async(struct fb_info *fbi,
 				struct omapfb_update_window *win,
 				void (*callback)(void *),
 				void *callback_data)
@@ -714,7 +714,6 @@ int omapfb_update_window_async(struct fb_info *fbi,

 	return fbdev->ctrl->update_window(fbi, win, callback, callback_data);
 }
-EXPORT_SYMBOL(omapfb_update_window_async);

 static int omapfb_update_win(struct fb_info *fbi,
 				struct omapfb_update_window *win)
