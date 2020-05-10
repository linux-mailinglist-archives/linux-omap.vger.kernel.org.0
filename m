Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFFB1CCC00
	for <lists+linux-omap@lfdr.de>; Sun, 10 May 2020 17:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgEJPhK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 May 2020 11:37:10 -0400
Received: from mga18.intel.com ([134.134.136.126]:43697 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgEJPhJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 10 May 2020 11:37:09 -0400
IronPort-SDR: EyYUUMTcGpDYIcKsYWE1/FfCgUOtD3sJYEWizRKOmZ1B6BtQo+4oOu7oBX/72mZ+2dxNSEkX4s
 ZHbGMtDhc2pQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2020 08:37:09 -0700
IronPort-SDR: /HpAhIVKa+oMLgdw/57Jx1OGpuXmJLiIh56T2t8nRbrLM7dLmNh7I01uUkAiTVhap+cwZOWghe
 tyglLwAVq/mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,376,1583222400"; 
   d="scan'208";a="250279950"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 May 2020 08:37:08 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jXo0p-000DwH-Kh; Sun, 10 May 2020 23:37:07 +0800
Date:   Sun, 10 May 2020 23:36:58 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kbuild-all@lists.01.org, linux-omap@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>
Subject: [RFC PATCH omap] gnss: motmdm: motmdm_gnss_send_command() can be
 static
Message-ID: <20200510153658.GA87187@7c31f038ab56>
References: <202005102338.fOZzLJuj%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202005102338.fOZzLJuj%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Fixes: ae348e86a0ab ("gnss: motmdm: Add support for Motorola Mapphone MDM6600 modem")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 motmdm.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gnss/motmdm.c b/drivers/gnss/motmdm.c
index da1d44bed899d..49d4580ae3eae 100644
--- a/drivers/gnss/motmdm.c
+++ b/drivers/gnss/motmdm.c
@@ -68,8 +68,8 @@ MODULE_PARM_DESC(rate_ms, "GNSS refresh rate between 1000 and 16000 ms (default
  * sort out the ID conflicts with the modem's unsolicited message ID
  * numbering.
  */
-int motmdm_gnss_send_command(struct motmdm_gnss_data *ddata,
-			     const u8 *buf, int len)
+static int motmdm_gnss_send_command(struct motmdm_gnss_data *ddata,
+				    const u8 *buf, int len)
 {
 	struct gnss_device *gdev = ddata->gdev;
 	const int timeout_ms = 1000;
