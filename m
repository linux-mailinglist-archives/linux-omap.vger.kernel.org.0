Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C42292585
	for <lists+linux-omap@lfdr.de>; Mon, 19 Oct 2020 12:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729748AbgJSKTM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Oct 2020 06:19:12 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:58742 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727355AbgJSKSI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Oct 2020 06:18:08 -0400
Message-Id: <20201019101109.903651690@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603102685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=GspGZAgtTq6gMYfmmkZzHxj2wK5gwCFO/dMv4c+qGNg=;
        b=WK/KUF9nx+OzfrXpW6AZP63Mk3FL/cEjZl3mU1F9QJ+O6FJ7qFDBgNIs/DFAFqo32p+kRL
        wd5kaaQ3IHlGruoBf+Rn4HWEy/upe3XziU6BeSZv4kqnKeCytgoMKdNx04mw/kuVTUsi7/
        PYSOi/w361WypClc90JwGEnpGTOftBHhyjUjPjTSY2BTbxsTTpxQ5+n0W7qFt+i/X6h3Vb
        cXkJdxA60UzvFfPnepVkhrjd0HmQQD2yVv8bBmMjy8rEm00gd3dGvgMv8DKmKFb7xE8ttZ
        W8fcjFZdNQinRYMJy79YUEA9tvaulgCmIKr+DDzUp3pjRz/N51+z8dGvgR3vng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603102685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=GspGZAgtTq6gMYfmmkZzHxj2wK5gwCFO/dMv4c+qGNg=;
        b=x8rtyLqc8Pja+okYr4ByLhKQBeW2Ox67gJGffT2WLFy/CoG/rB/9qGuafa5FJRoM3ny9Di
        GdMrkcGxm7OgQlDg==
Date:   Mon, 19 Oct 2020 12:06:32 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: [patch V2 03/13] USB: serial: keyspan_pda: Consolidate room query
References: <20201019100629.419020859@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Having two copies of the same code doesn't make the code more readable and
allocating a buffer of 1 byte for a synchronous operation is a pointless
exercise.

Allocate a byte buffer at init which can be used instead. The buffer is
only used in open() and tty->write(). Console writes are not calling into
the query. open() obviously happens before write() and the writes are
serialized by bit 0 of port->write_urbs_free which protects also the
transaction itself.

Move the actual query into a helper function and cleanup the usage sites in
keyspan_pda_write() and keyspan_pda_open().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
---
V2; Allocate a real buffer (Alan)
---
 drivers/usb/serial/keyspan_pda.c |  108 +++++++++++++++++----------------------
 1 file changed, 49 insertions(+), 59 deletions(-)

--- a/drivers/usb/serial/keyspan_pda.c
+++ b/drivers/usb/serial/keyspan_pda.c
@@ -47,6 +47,7 @@ struct keyspan_pda_private {
 	struct work_struct			unthrottle_work;
 	struct usb_serial	*serial;
 	struct usb_serial_port	*port;
+	u8			*query_buf;
 };
 
 
@@ -436,6 +437,31 @@ static int keyspan_pda_tiocmset(struct t
 	return rc;
 }
 
+/*
+ * Using priv->query_buf is safe here because this is only called for TTY
+ * operations open() and write(). write() comes post open() obviously and
+ * write() itself is serialized via bit 0 of port->write_urbs_free. Console
+ * writes are never calling into this.
+ */
+static int keyspan_pda_query_room(struct usb_serial *serial,
+				  struct keyspan_pda_private *priv)
+{
+	int res;
+
+	res = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
+			      6, /* write_room */
+			      USB_TYPE_VENDOR | USB_RECIP_INTERFACE | USB_DIR_IN,
+			      0, /* value */
+			      0, /* index */
+			      priv->query_buf,
+			      1,
+			      2000);
+	if (res != 1)
+		return res < 0 ? res : -EIO;
+
+	return (unsigned int)*priv->query_buf;
+}
+
 static int keyspan_pda_write(struct tty_struct *tty,
 	struct usb_serial_port *port, const unsigned char *buf, int count)
 {
@@ -483,39 +509,16 @@ static int keyspan_pda_write(struct tty_
 	 * usage because the console write can't sleep.
 	 */
 	if (count > priv->tx_room && tty) {
-		u8 *room;
-
-		room = kmalloc(1, GFP_KERNEL);
-		if (!room) {
-			rc = -ENOMEM;
-			goto exit;
-		}
-
-		rc = usb_control_msg(serial->dev,
-				     usb_rcvctrlpipe(serial->dev, 0),
-				     6, /* write_room */
-				     USB_TYPE_VENDOR | USB_RECIP_INTERFACE
-				     | USB_DIR_IN,
-				     0, /* value: 0 means "remaining room" */
-				     0, /* index */
-				     room,
-				     1,
-				     2000);
-		if (rc > 0) {
-			dev_dbg(&port->dev, "roomquery says %d\n", *room);
-			priv->tx_room = *room;
-		}
-		kfree(room);
+		rc = keyspan_pda_query_room(serial, priv);
 		if (rc < 0) {
-			dev_dbg(&port->dev, "roomquery failed\n");
-			goto exit;
-		}
-		if (rc == 0) {
-			dev_dbg(&port->dev, "roomquery returned 0 bytes\n");
-			rc = -EIO; /* device didn't return any data */
+			dev_dbg(&port->dev, "roomquery failed %d\n", rc);
 			goto exit;
 		}
+
+		dev_dbg(&port->dev, "roomquery says %d\n", rc);
+		priv->tx_room = rc;
 	}
+
 	if (count > priv->tx_room) {
 		/* we're about to completely fill the Tx buffer, so
 		   we'll be throttled afterwards. */
@@ -615,45 +618,26 @@ static int keyspan_pda_open(struct tty_s
 					struct usb_serial_port *port)
 {
 	struct usb_serial *serial = port->serial;
-	u8 *room;
-	int rc = 0;
 	struct keyspan_pda_private *priv;
+	int rc;
 
-	/* find out how much room is in the Tx ring */
-	room = kmalloc(1, GFP_KERNEL);
-	if (!room)
-		return -ENOMEM;
+	priv = usb_get_serial_port_data(port);
 
-	rc = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
-			     6, /* write_room */
-			     USB_TYPE_VENDOR | USB_RECIP_INTERFACE
-			     | USB_DIR_IN,
-			     0, /* value */
-			     0, /* index */
-			     room,
-			     1,
-			     2000);
+	/* find out how much room is in the Tx ring */
+	rc = keyspan_pda_query_room(serial, priv);
 	if (rc < 0) {
-		dev_dbg(&port->dev, "%s - roomquery failed\n", __func__);
-		goto error;
-	}
-	if (rc == 0) {
-		dev_dbg(&port->dev, "%s - roomquery returned 0 bytes\n", __func__);
-		rc = -EIO;
-		goto error;
+		dev_dbg(&port->dev, "roomquery failed %d\n", rc);
+		return rc;
 	}
-	priv = usb_get_serial_port_data(port);
-	priv->tx_room = *room;
-	priv->tx_throttled = *room ? 0 : 1;
+
+	priv->tx_room = rc;
+	priv->tx_throttled = rc ? 0 : 1;
 
 	/*Start reading from the device*/
 	rc = usb_submit_urb(port->interrupt_in_urb, GFP_KERNEL);
-	if (rc) {
+	if (rc)
 		dev_dbg(&port->dev, "%s - usb_submit_urb(read int) failed\n", __func__);
-		goto error;
-	}
-error:
-	kfree(room);
+
 	return rc;
 }
 static void keyspan_pda_close(struct usb_serial_port *port)
@@ -715,6 +699,11 @@ static int keyspan_pda_port_probe(struct
 	priv = kmalloc(sizeof(struct keyspan_pda_private), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
+	priv->query_buf = kmalloc(1, GFP_KERNEL);
+	if (!priv->query_buf) {
+		kfree(priv);
+		return -ENOMEM;
+	}
 
 	INIT_WORK(&priv->wakeup_work, keyspan_pda_wakeup_write);
 	INIT_WORK(&priv->unthrottle_work, keyspan_pda_request_unthrottle);
@@ -731,6 +720,7 @@ static int keyspan_pda_port_remove(struc
 	struct keyspan_pda_private *priv;
 
 	priv = usb_get_serial_port_data(port);
+	kfree(priv->query_buf);
 	kfree(priv);
 
 	return 0;

