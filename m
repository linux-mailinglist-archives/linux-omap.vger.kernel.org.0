Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28BC2245AD
	for <lists+linux-omap@lfdr.de>; Tue, 21 May 2019 03:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbfEUBm1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 May 2019 21:42:27 -0400
Received: from mga14.intel.com ([192.55.52.115]:20886 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727078AbfEUBm1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 20 May 2019 21:42:27 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 May 2019 18:42:26 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 May 2019 18:42:25 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hStnN-000Iwj-7n; Tue, 21 May 2019 09:42:25 +0800
Date:   Tue, 21 May 2019 09:41:23 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kbuild-all@01.org, linux-omap@vger.kernel.org
Subject: [RFC PATCH omap] ASoC: audio-graph-card: motmd_read_fmt[] can be
 static
Message-ID: <20190521014123.GA91149@lkp-kbuild16>
References: <201905210947.S6UWpK5T%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201905210947.S6UWpK5T%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Fixes: 6adb2d19d926 ("ASoC: audio-graph-card: Add audio mixer for motorold mdm6600")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 motmdm.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/motmdm.c b/sound/soc/codecs/motmdm.c
index b337181..c6928ef 100644
--- a/sound/soc/codecs/motmdm.c
+++ b/sound/soc/codecs/motmdm.c
@@ -36,13 +36,13 @@ enum motmdm_cmd {
 	CMD_AT_NREC,
 };
 
-const char * const motmd_read_fmt[] = {
+static const char * const motmd_read_fmt[] = {
 	[CMD_AT_EACC] = "AT+EACC?",
 	[CMD_AT_CLVL] = "AT+CLVL?",
 	[CMD_AT_NREC] = "AT+NREC?",
 };
 
-const char * const motmd_write_fmt[] = {
+static const char * const motmd_write_fmt[] = {
 	[CMD_AT_EACC] = "AT+EACC=%u,0",
 	[CMD_AT_CLVL] = "AT+CLVL=%u",
 	[CMD_AT_NREC] = "AT+NREC=%u",
