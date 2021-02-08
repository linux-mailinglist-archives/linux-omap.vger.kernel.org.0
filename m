Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE29931431A
	for <lists+linux-omap@lfdr.de>; Mon,  8 Feb 2021 23:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhBHWjF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Feb 2021 17:39:05 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:39696 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhBHWjC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Feb 2021 17:39:02 -0500
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1612823899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BvatIb+SuoAuL1N1yaJF6Fqf9sEJaUMKCM1rr5oWM0c=;
        b=HQ8/+BYas8HMUkPF27kztYqrFhdPsFIp69WWxyy/EEF0Ir4mMx5TNUNl8G8wjx968H0tWA
        fijZ9pRp9yy5V9jXhZWQWreUCfT4VvtdxXJocSAJAfbcnTEnXMbC9JijwK3xwNArT9da0b
        i2UhsAjxTMq5BlTbjlWVLsDU1x9n3FZRGzADq8hV1tP/mBQz4OmBfad+vXFf9kj1rgEbE8
        a8qdJntipwhJnbJEeljHzFMKkgJyINRhS4I8h5SIrUv8Qf6tIC/OEZMZn49zJVbro20krO
        QQNdgJn/wCKA3HDM9WtcFZWi60bIhfiG/B88mUBeQ3fJ50/YUEjVUQ8gyfmTrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1612823899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BvatIb+SuoAuL1N1yaJF6Fqf9sEJaUMKCM1rr5oWM0c=;
        b=3qtO6vvCZk8yVT+UG/xPNQ/5g6dZnHinwVdniGk7VN9PvM6WrZAx5BTDtKsCc/h3rdpMLb
        QvvC58VbkmR+NmCA==
To:     linux-fbdev@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/3] video: omap: Remove in_interrupt() usage.
Date:   Mon,  8 Feb 2021 23:38:08 +0100
Message-Id: <20210208223810.388502-2-bigeasy@linutronix.de>
In-Reply-To: <20210208223810.388502-1-bigeasy@linutronix.de>
References: <20210208223810.388502-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Ahmed S. Darwish" <a.darwish@linutronix.de>

alloc_req() uses in_interrupt() to detect if it is safe to use down().

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be separated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

The semaphore is used as a counting semaphore, initialized with the
number of slots in the request pool minus IRQ_REQ_POOL_SIZE - which are
reserved for the in_interrupt() user to ensure that a request is always
available. The preemptible user will block on the semphore waiting for a
request to become available in case there are no requests available.

Replace in_interrupt() with a `can_sleep' argument to indicate if it is
safe to block on the sempahore.

Cc: linux-omap@vger.kernel.org
Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/video/fbdev/omap/hwa742.c | 42 ++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/omap/hwa742.c b/drivers/video/fbdev/omap/h=
wa742.c
index cfe63932f8255..b191bef22d984 100644
--- a/drivers/video/fbdev/omap/hwa742.c
+++ b/drivers/video/fbdev/omap/hwa742.c
@@ -100,6 +100,14 @@ struct {
 	struct hwa742_request	req_pool[REQ_POOL_SIZE];
 	struct list_head	pending_req_list;
 	struct list_head	free_req_list;
+
+	/*
+	 * @req_lock: protect request slots pool and its tracking lists
+	 * @req_sema: counter; slot allocators from task contexts must
+	 *            push it down before acquiring a slot. This
+	 *            guarantees that atomic contexts will always have
+	 *            a minimum of IRQ_REQ_POOL_SIZE slots available.
+	 */
 	struct semaphore	req_sema;
 	spinlock_t		req_lock;
=20
@@ -224,13 +232,13 @@ static void disable_tearsync(void)
 	hwa742_write_reg(HWA742_NDP_CTRL, b);
 }
=20
-static inline struct hwa742_request *alloc_req(void)
+static inline struct hwa742_request *alloc_req(bool can_sleep)
 {
 	unsigned long flags;
 	struct hwa742_request *req;
 	int req_flags =3D 0;
=20
-	if (!in_interrupt())
+	if (can_sleep)
 		down(&hwa742.req_sema);
 	else
 		req_flags =3D REQ_FROM_IRQ_POOL;
@@ -399,8 +407,8 @@ static void send_frame_complete(void *data)
 	hwa742.int_ctrl->enable_plane(OMAPFB_PLANE_GFX, 0);
 }
=20
-#define ADD_PREQ(_x, _y, _w, _h) do {		\
-	req =3D alloc_req();			\
+#define ADD_PREQ(_x, _y, _w, _h, can_sleep) do {\
+	req =3D alloc_req(can_sleep);		\
 	req->handler	=3D send_frame_handler;	\
 	req->complete	=3D send_frame_complete;	\
 	req->par.update.x =3D _x;			\
@@ -413,7 +421,8 @@ static void send_frame_complete(void *data)
 } while(0)
=20
 static void create_req_list(struct omapfb_update_window *win,
-			    struct list_head *req_head)
+			    struct list_head *req_head,
+			    bool can_sleep)
 {
 	struct hwa742_request *req;
 	int x =3D win->x;
@@ -427,7 +436,7 @@ static void create_req_list(struct omapfb_update_window=
 *win,
 	color_mode =3D win->format & OMAPFB_FORMAT_MASK;
=20
 	if (x & 1) {
-		ADD_PREQ(x, y, 1, height);
+		ADD_PREQ(x, y, 1, height, can_sleep);
 		width--;
 		x++;
 		flags &=3D ~OMAPFB_FORMAT_FLAG_TEARSYNC;
@@ -439,19 +448,19 @@ static void create_req_list(struct omapfb_update_wind=
ow *win,
=20
 		if (xspan * height * 2 > hwa742.max_transmit_size) {
 			yspan =3D hwa742.max_transmit_size / (xspan * 2);
-			ADD_PREQ(x, ystart, xspan, yspan);
+			ADD_PREQ(x, ystart, xspan, yspan, can_sleep);
 			ystart +=3D yspan;
 			yspan =3D height - yspan;
 			flags &=3D ~OMAPFB_FORMAT_FLAG_TEARSYNC;
 		}
=20
-		ADD_PREQ(x, ystart, xspan, yspan);
+		ADD_PREQ(x, ystart, xspan, yspan, can_sleep);
 		x +=3D xspan;
 		width -=3D xspan;
 		flags &=3D ~OMAPFB_FORMAT_FLAG_TEARSYNC;
 	}
 	if (width)
-		ADD_PREQ(x, y, 1, height);
+		ADD_PREQ(x, y, 1, height, can_sleep);
 }
=20
 static void auto_update_complete(void *data)
@@ -461,12 +470,12 @@ static void auto_update_complete(void *data)
 			  jiffies + HWA742_AUTO_UPDATE_TIME);
 }
=20
-static void hwa742_update_window_auto(struct timer_list *unused)
+static void __hwa742_update_window_auto(bool can_sleep)
 {
 	LIST_HEAD(req_list);
 	struct hwa742_request *last;
=20
-	create_req_list(&hwa742.auto_update_window, &req_list);
+	create_req_list(&hwa742.auto_update_window, &req_list, can_sleep);
 	last =3D list_entry(req_list.prev, struct hwa742_request, entry);
=20
 	last->complete =3D auto_update_complete;
@@ -475,6 +484,11 @@ static void hwa742_update_window_auto(struct timer_lis=
t *unused)
 	submit_req_list(&req_list);
 }
=20
+static void hwa742_update_window_auto(struct timer_list *unused)
+{
+	__hwa742_update_window_auto(false);
+}
+
 int hwa742_update_window_async(struct fb_info *fbi,
 				 struct omapfb_update_window *win,
 				 void (*complete_callback)(void *arg),
@@ -497,7 +511,7 @@ int hwa742_update_window_async(struct fb_info *fbi,
 		goto out;
 	}
=20
-	create_req_list(win, &req_list);
+	create_req_list(win, &req_list, true);
 	last =3D list_entry(req_list.prev, struct hwa742_request, entry);
=20
 	last->complete =3D complete_callback;
@@ -544,7 +558,7 @@ static void hwa742_sync(void)
 	struct hwa742_request *req;
 	struct completion comp;
=20
-	req =3D alloc_req();
+	req =3D alloc_req(true);
=20
 	req->handler =3D sync_handler;
 	req->complete =3D NULL;
@@ -599,7 +613,7 @@ static int hwa742_set_update_mode(enum omapfb_update_mo=
de mode)
 		omapfb_notify_clients(hwa742.fbdev, OMAPFB_EVENT_READY);
 		break;
 	case OMAPFB_AUTO_UPDATE:
-		hwa742_update_window_auto(0);
+		__hwa742_update_window_auto(true);
 		break;
 	case OMAPFB_UPDATE_DISABLED:
 		break;
--=20
2.30.0

