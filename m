Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E89841CCC01
	for <lists+linux-omap@lfdr.de>; Sun, 10 May 2020 17:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728146AbgEJPhM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 May 2020 11:37:12 -0400
Received: from mga03.intel.com ([134.134.136.65]:24717 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgEJPhL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 10 May 2020 11:37:11 -0400
IronPort-SDR: nMw/WYh53iwVLxBQJVXTvAgfPJAPvJFGSlXfFGcoWLpE+pXoFjt+dE+e7zHFXg25M2WHKpaQHK
 byWQIOTEsn8w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2020 08:37:11 -0700
IronPort-SDR: jA1QpQjL0mFINHirzTrTG3KB3YjNJJiuWcDpPuZwoHq5jeqIPn4zZZqiT9VAUAUIGydWiYnpEl
 CWVTDZTyoABw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,376,1583222400"; 
   d="scan'208";a="340312561"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 May 2020 08:37:08 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jXo0q-000DyU-03; Sun, 10 May 2020 23:37:07 +0800
Date:   Sun, 10 May 2020 23:36:57 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kbuild-all@lists.01.org, linux-omap@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>
Subject: [omap:serdev-ngsm-pending-v5.7 20/29] drivers/gnss/motmdm.c:71:5:
 sparse: sparse: symbol 'motmdm_gnss_send_command' was not declared. Should
 it be static?
Message-ID: <202005102338.fOZzLJuj%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git serdev-ngsm-pending-v5.7
head:   4eda51fea6be98ca5a4023a988b102bf3629b295
commit: ae348e86a0abccb615c8875a95d63f10268f1c4f [20/29] gnss: motmdm: Add support for Motorola Mapphone MDM6600 modem
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout ae348e86a0abccb615c8875a95d63f10268f1c4f
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gnss/motmdm.c:71:5: sparse: sparse: symbol 'motmdm_gnss_send_command' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
