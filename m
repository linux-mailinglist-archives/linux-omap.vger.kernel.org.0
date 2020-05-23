Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A431DF9AB
	for <lists+linux-omap@lfdr.de>; Sat, 23 May 2020 19:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388182AbgEWRdP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 23 May 2020 13:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388161AbgEWRdN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 23 May 2020 13:33:13 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47206C05BD43;
        Sat, 23 May 2020 10:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590255191;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=6zUSrqNpmPH2RtkkjpPpsaxaburuNS1KBzwK7uv+CMk=;
        b=YuUpB9a1jdDI+KgXXVJe+TvNLBcO1XUCUpPiBN/ONjXyD82UY00K7Y60HchwQOjT/r
        JYl8D2px73gGdN98K6L8NVGbMDo9r+4INBOll80GtVtIac6PX2fdfiuPm5zPbJz1tKNc
        r57BpwmydGsuCVhl0DRp6yjnzj3TqI/XkTZcIS1kD8XCKBKn8JdN7minpwJ8H/uF2t8A
        fT6D8SlUaYzafM4aUU+qaTyb8j1Gp24qHWIcl/xvzUisz+cW9qvb4O18gD8fVoE0kiwd
        Y3v6eFmG0XTlc8e0v+45kjJCtHoyBzyiDwVMIM4fKzuFNPhv+FkkAwvdZzaH2iJqaIv9
        9zHw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o19MtK65S+//9m1YB9g="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.7.0 AUTH)
        with ESMTPSA id D0a7c0w4NHX2Fae
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 23 May 2020 19:33:02 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Evgeniy Polyakov <zbr@ioremap.net>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-kernel@vger.kernel.org, kernel@pyra-handheld.com,
        letux-kernel@openphoenux.org, linux-omap@vger.kernel.org
Subject: [PATCH 4/4] w1: omap-hdq: print dev_err if irq flags are not cleared
Date:   Sat, 23 May 2020 19:32:57 +0200
Message-Id: <2de305d3046c7281a7123347899abbaa64c54fb8.1590255176.git.hns@goldelico.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590255176.git.hns@goldelico.com>
References: <cover.1590255176.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If irq flags are not cleared for certain operations we
print an error message.

Since this should never occur in normal operation, this
patch is an optional safety-net and debugging tool.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/w1/masters/omap_hdq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
index a6484700f3b388..bf2ec59c1f9ddc 100644
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -146,6 +146,10 @@ static int hdq_write_byte(struct hdq_data *hdq_data, u8 val, u8 *status)
 		goto rtn;
 	}
 
+	if (hdq_data->hdq_irqstatus)
+		dev_err(hdq_data->dev, "TX irqstatus not cleared (%02x)\n",
+			hdq_data->hdq_irqstatus);
+
 	*status = 0;
 
 	hdq_reg_out(hdq_data, OMAP_HDQ_TX_DATA, val);
@@ -243,6 +247,10 @@ static int omap_hdq_break(struct hdq_data *hdq_data)
 		goto rtn;
 	}
 
+	if (hdq_data->hdq_irqstatus)
+		dev_err(hdq_data->dev, "break irqstatus not cleared (%02x)\n",
+			hdq_data->hdq_irqstatus);
+
 	/* set the INIT and GO bit */
 	hdq_reg_merge(hdq_data, OMAP_HDQ_CTRL_STATUS,
 		OMAP_HDQ_CTRL_STATUS_INITIALIZATION | OMAP_HDQ_CTRL_STATUS_GO,
-- 
2.26.2

