Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF08C120FE3
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2019 17:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbfLPQnk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Dec 2019 11:43:40 -0500
Received: from muru.com ([72.249.23.125]:48492 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbfLPQnk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Dec 2019 11:43:40 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 73F55810D;
        Mon, 16 Dec 2019 16:44:17 +0000 (UTC)
Date:   Mon, 16 Dec 2019 08:43:35 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCHv2] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20191216164335.GP35479@atomide.com>
References: <20191216145359.28219-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191216145359.28219-1-tony@atomide.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [191216 14:54]:
> Vignesh, any comments on the ti,mode = "1w" and removal of the call to
> hdq_disable_interrupt()? Is there some specific section where we need
> to have interrupts disabled and then re-enabled?

OK I got "1w" mode working too now. We need to clear the irqstatus before
calling wait_event_timeout() on it, and we're now missing it in the
hdq_read_byte().

Looks like we should not tinker with the actual irstatus register though,
that's up to the hdq_isr() to manage.

So the following helper is probably what we want to do additionally.
I'll be posting v3 of the $subject patch.

Regards,

Tony

8< ----------------------
diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -119,22 +119,24 @@ static int hdq_wait_for_flag(struct hdq_data *hdq_data, u32 offset,
 	return ret;
 }
 
+/* Clear saved irqstatus after using an interrupt */
+static void hdq_reset_irqstatus(struct hdq_data *hdq_data)
+{
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&hdq_data->hdq_spinlock, irqflags);
+	hdq_data->hdq_irqstatus = 0;
+	spin_unlock_irqrestore(&hdq_data->hdq_spinlock, irqflags);
+}
+
 /* write out a byte and fill *status with HDQ_INT_STATUS */
 static int hdq_write_byte(struct hdq_data *hdq_data, u8 val, u8 *status)
 {
 	int ret;
 	u8 tmp_status;
-	unsigned long irqflags;
 
 	*status = 0;
 
-	spin_lock_irqsave(&hdq_data->hdq_spinlock, irqflags);
-	/* clear interrupt flags via a dummy read */
-	hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
-	/* ISR loads it with new INT_STATUS */
-	hdq_data->hdq_irqstatus = 0;
-	spin_unlock_irqrestore(&hdq_data->hdq_spinlock, irqflags);
-
 	hdq_reg_out(hdq_data, OMAP_HDQ_TX_DATA, val);
 
 	/* set the GO bit */
@@ -168,6 +170,7 @@ static int hdq_write_byte(struct hdq_data *hdq_data, u8 val, u8 *status)
 	}
 
 out:
+	hdq_reset_irqstatus(hdq_data);
 	return ret;
 }
 
@@ -219,7 +222,6 @@ static int omap_hdq_break(struct hdq_data *hdq_data)
 {
 	int ret = 0;
 	u8 tmp_status;
-	unsigned long irqflags;
 
 	ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
 	if (ret < 0) {
@@ -228,13 +230,6 @@ static int omap_hdq_break(struct hdq_data *hdq_data)
 		goto rtn;
 	}
 
-	spin_lock_irqsave(&hdq_data->hdq_spinlock, irqflags);
-	/* clear interrupt flags via a dummy read */
-	hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
-	/* ISR loads it with new INT_STATUS */
-	hdq_data->hdq_irqstatus = 0;
-	spin_unlock_irqrestore(&hdq_data->hdq_spinlock, irqflags);
-
 	/* set the INIT and GO bit */
 	hdq_reg_merge(hdq_data, OMAP_HDQ_CTRL_STATUS,
 		OMAP_HDQ_CTRL_STATUS_INITIALIZATION | OMAP_HDQ_CTRL_STATUS_GO,
@@ -283,6 +278,7 @@ static int omap_hdq_break(struct hdq_data *hdq_data)
 			" return to zero, %x", tmp_status);
 
 out:
+	hdq_reset_irqstatus(hdq_data);
 	mutex_unlock(&hdq_data->hdq_mutex);
 rtn:
 	return ret;
@@ -330,6 +326,7 @@ static int hdq_read_byte(struct hdq_data *hdq_data, u8 *val)
 	/* the data is ready. Read it in! */
 	*val = hdq_reg_in(hdq_data, OMAP_HDQ_RX_DATA);
 out:
+	hdq_reset_irqstatus(hdq_data);
 	mutex_unlock(&hdq_data->hdq_mutex);
 rtn:
 	return ret;
@@ -363,7 +360,6 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
 		goto rtn;
 	}
 
-	hdq_data->hdq_irqstatus = 0;
 	/* read id_bit */
 	hdq_reg_merge(_hdq, OMAP_HDQ_CTRL_STATUS,
 		      ctrl | OMAP_HDQ_CTRL_STATUS_DIR, mask);
@@ -377,7 +373,9 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
 	}
 	id_bit = (hdq_reg_in(_hdq, OMAP_HDQ_RX_DATA) & 0x01);
 
-	hdq_data->hdq_irqstatus = 0;
+	/* Must clear irqstatus for another RXCOMPLETE interrupt */
+	hdq_reset_irqstatus(hdq_data);
+
 	/* read comp_bit */
 	hdq_reg_merge(_hdq, OMAP_HDQ_CTRL_STATUS,
 		      ctrl | OMAP_HDQ_CTRL_STATUS_DIR, mask);
@@ -420,6 +418,7 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
 		      OMAP_HDQ_CTRL_STATUS_SINGLE);
 
 out:
+	hdq_reset_irqstatus(hdq_data);
 	mutex_unlock(&hdq_data->hdq_mutex);
 rtn:
 	pm_runtime_mark_last_busy(hdq_data->dev);
@@ -460,7 +459,7 @@ static u8 omap_w1_read_byte(void *_hdq)
 	if (ret < 0) {
 		pm_runtime_put_noidle(hdq_data->dev);
 
-		return ret;
+		return -1;
 	}
 
 	ret = hdq_read_byte(hdq_data, &val);
-- 
2.24.1
