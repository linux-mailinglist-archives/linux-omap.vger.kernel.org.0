Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 861341DF9A4
	for <lists+linux-omap@lfdr.de>; Sat, 23 May 2020 19:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbgEWRdN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 23 May 2020 13:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgEWRdM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 23 May 2020 13:33:12 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1942C05BD43;
        Sat, 23 May 2020 10:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590255190;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=GMAFg4Iya6Ifjur2kiGXLgqc7VRC8A3T4g1LmlEgMKI=;
        b=CWnFiLjq6I6mUfSDh2Z0n0Pru/uDkdeVOpSZcyrLyTP41RyLXSU+kU62sA0v0hxa2K
        ijGJacG4kCYerAu8M5B0aVwdALuP+2SVI6hsfsfIOSxRFuIk340qIo7gfN4Mm4P+HSGG
        kAtpOkepp0t9QFJJB2nioAHMvjezkynKUyn+cR54fIZpuXEq8Mio1hMMIcZuBF5eAPYm
        wRUMJlcN7FZggIXk1yPkz9GAUUCtgHWqxUcDBAKoQv2gTTk/1DP3ZqJY+T8GU5Esk9IA
        4WDN8QJHO8VbyU33L9Ut75H2mp0IZDWk1nriQNX6UyHkrzB+ZHIfRJFmifbgkmzyf7D2
        yG7Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o19MtK65S+//9m1YB9g="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.7.0 AUTH)
        with ESMTPSA id D0a7c0w4NHWwFaa
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 23 May 2020 19:32:58 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Evgeniy Polyakov <zbr@ioremap.net>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-kernel@vger.kernel.org, kernel@pyra-handheld.com,
        letux-kernel@openphoenux.org, linux-omap@vger.kernel.org
Subject: [PATCH 0/4] w1: omap: fix some regressions/bugs (some were introduced in v5.6 but some are older)
Date:   Sat, 23 May 2020 19:32:53 +0200
Message-Id: <cover.1590255176.git.hns@goldelico.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This series fixes:
* some dev_dbg are missing an explicit \n
* wrong return value if battery is removed and no hdq response
* problems with resetting interrupt flags too early leading to timeouts and wrong values
* print error if interrupt flags get mixed up


H. Nikolaus Schaller (4):
  w1: omap-hdq: cleanup to add missing newline for some dev_dbg
  w1: omap-hdq: fix return value to be -1 if there is a timeout
  w1: omap-hdq: fix interrupt handling which did show spurious timeouts
  w1: omap-hdq: print dev_err if irq flags are not cleared

 drivers/w1/masters/omap_hdq.c | 82 ++++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 26 deletions(-)

-- 
2.26.2

