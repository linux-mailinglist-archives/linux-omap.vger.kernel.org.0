Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E818298EC8
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 15:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1780900AbgJZODS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 10:03:18 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:40242 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1780899AbgJZODS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 26 Oct 2020 10:03:18 -0400
Date:   Mon, 26 Oct 2020 15:03:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603720995;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/XYLTnd4F+MtBkIEH9ciCsQ1o4o3fSs6saBPeUcCQRg=;
        b=aEC/DFGAzRNOiLoJ+IZswCQThDVstB95WznPoAR3plToyC0oKuWMntD/MsM7Q80qKg/2jO
        adPxZGvGg7lvDVSirCUS9D2Wta9ebe+TvRe5/DRNz1FIfM2t7IK1H5pDHy9BCMcIONVuvf
        hIXkpKAYZqrxK0McvVoaTZpzdMK5Xh0abpfujx6J8MPwp7QXTpLwMbLPesXEXLxSbrA1YW
        1sQ3ujDlOgt1oJHCdV5ZGIrBRDEVIx3GCOuMnAivzUpwnptyXAeoUTcDm4qnFcFG15p4Ge
        GcW+gOXJLp4nIiVi6zivJuwi5MeCguM7AjBDbyU7GMGleDGoKn+dN6uaA4m15w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603720995;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/XYLTnd4F+MtBkIEH9ciCsQ1o4o3fSs6saBPeUcCQRg=;
        b=MBgKbLCjynQlRvNZZxzHBvGsL2zC0Jh0u6i5DMLd7ximjnilFbLyHFIc1rye4RBzvKe46v
        c744gr3dJcGlRwDg==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Johan Hovold <johan@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: [PATCH v3 04/13 ] USB: serial: digi_acceleport: Remove
 in_interrupt() usage
Message-ID: <20201026140313.dpg3hkhkje2os4hw@linutronix.de>
References: <20201019100629.419020859@linutronix.de>
 <20201019101110.019266389@linutronix.de>
 <20201025171613.GT26280@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201025171613.GT26280@localhost>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

=46rom: "Ahmed S. Darwish" <a.darwish@linutronix.de>

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be separated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

The debug printk() in digi_write() prints in_interrupt() as context
information. This information is imprecisely as it does not distinguish
between hard-IRQ or disabled botton half and it does consider disabled
interrupts or preemption. It is not really helpful.

Remove the in_interrupt() printout.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
---
v2=E2=80=A6v3:
  - Don't make dev_dbg() conditional on `tty'
  - Remove the part "tty happens always in process context" from the
    commit message. Johan pointed out that for PPP it may happen in
    bottom half.

 drivers/usb/serial/digi_acceleport.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi=
_acceleport.c
index 91055a191995f..016e7dec31962 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -911,9 +911,8 @@ static int digi_write(struct tty_struct *tty, struct us=
b_serial_port *port,
 	unsigned char *data =3D port->write_urb->transfer_buffer;
 	unsigned long flags =3D 0;
=20
-	dev_dbg(&port->dev,
-		"digi_write: TOP: port=3D%d, count=3D%d, in_interrupt=3D%ld\n",
-		priv->dp_port_num, count, in_interrupt());
+	dev_dbg(&port->dev, "digi_write: TOP: port=3D%d, count=3D%d\n",
+		priv->dp_port_num, count);
=20
 	/* copy user data (which can sleep) before getting spin lock */
 	count =3D min(count, port->bulk_out_size-2);
--=20
2.28.0

